import CFrida

@objc(FridaDeviceManager)
public class DeviceManager: NSObject, NSCopying {
    public weak var delegate: DeviceManagerDelegate?

    public typealias CloseComplete = () -> Void

    public typealias EnumerateDevicesComplete = (_ result: EnumerateDevicesResult) -> Void
    public typealias EnumerateDevicesResult = () throws -> [Device]

    public typealias AddRemoteDeviceComplete = (_ result: AddRemoteDeviceResult) -> Void
    public typealias AddRemoteDeviceResult = () throws -> Device

    public typealias RemoveRemoteDeviceComplete = (_ result: RemoveRemoteDeviceResult) -> Void
    public typealias RemoveRemoteDeviceResult = () throws -> Bool

    private typealias ChangedHandler = @convention(c) (_ manager: OpaquePointer, _ userData: gpointer) -> Void
    private typealias AddedHandler = @convention(c) (_ manager: OpaquePointer, _ device: OpaquePointer, _ userData: gpointer) -> Void
    private typealias RemovedHandler = @convention(c) (_ manager: OpaquePointer, _ device: OpaquePointer, _ userData: gpointer) -> Void

    private let handle: OpaquePointer
    private var onChangedHandler: gulong = 0
    private var onAddedHandler: gulong = 0
    private var onRemovedHandler: gulong = 0

    public convenience override init() {
        frida_init()

        self.init(handle: frida_device_manager_new())
    }

    init(handle: OpaquePointer) {
        self.handle = handle

        super.init()

        let rawHandle = gpointer(handle)
        onChangedHandler = g_signal_connect_data(rawHandle, "changed", unsafeBitCast(onChanged, to: GCallback.self),
                                                 gpointer(Unmanaged.passRetained(SignalConnection(instance: self)).toOpaque()),
                                                 releaseConnection, GConnectFlags(0))
        onAddedHandler = g_signal_connect_data(rawHandle, "added", unsafeBitCast(onAdded, to: GCallback.self),
                                               gpointer(Unmanaged.passRetained(SignalConnection(instance: self)).toOpaque()),
                                               releaseConnection, GConnectFlags(0))
        onRemovedHandler = g_signal_connect_data(rawHandle, "removed", unsafeBitCast(onRemoved, to: GCallback.self),
                                                 gpointer(Unmanaged.passRetained(SignalConnection(instance: self)).toOpaque()),
                                                 releaseConnection, GConnectFlags(0))
    }

    public func copy(with zone: NSZone?) -> Any {
        g_object_ref(gpointer(handle))
        return DeviceManager(handle: handle)
    }

    deinit {
        let rawHandle = gpointer(handle)
        let handlers = [onChangedHandler, onAddedHandler, onRemovedHandler]
        Runtime.scheduleOnFridaThread {
            for handler in handlers {
                g_signal_handler_disconnect(rawHandle, handler)
            }
            g_object_unref(rawHandle)
        }
    }

    public override var description: String {
        return "Frida.DeviceManager()"
    }

    public override func isEqual(_ object: Any?) -> Bool {
        if let manager = object as? DeviceManager {
            return manager.handle == handle
        } else {
            return false
        }
    }

    public override var hash: Int {
        return handle.hashValue
    }

    public func close(_ completionHandler: @escaping CloseComplete = {}) {
        Runtime.scheduleOnFridaThread {
            frida_device_manager_close(self.handle, nil, { source, result, data in
                let operation = Unmanaged<AsyncOperation<CloseComplete>>.fromOpaque(UnsafeRawPointer(data)!).takeRetainedValue()

                frida_device_manager_close_finish(OpaquePointer(source), result, nil)

                Runtime.scheduleOnMainThread {
                    operation.completionHandler()
                }
            }, Unmanaged.passRetained(AsyncOperation<CloseComplete>(completionHandler)).toOpaque())
        }
    }

    public func enumerateDevices(_ completionHandler: @escaping EnumerateDevicesComplete) {
        Runtime.scheduleOnFridaThread {
            frida_device_manager_enumerate_devices(self.handle, nil, { source, result, data in
                let operation = Unmanaged<AsyncOperation<EnumerateDevicesComplete>>.fromOpaque(data!).takeRetainedValue()

                var rawError: UnsafeMutablePointer<GError>? = nil
                let rawDevices = frida_device_manager_enumerate_devices_finish(OpaquePointer(source), result, &rawError)
                if let rawError = rawError {
                    let error = Marshal.takeNativeError(rawError)
                    Runtime.scheduleOnMainThread {
                        operation.completionHandler { throw error }
                    }
                    return
                }

                var devices = [Device]()
                let numberOfDevices = frida_device_list_size(rawDevices)
                for index in 0..<numberOfDevices {
                    let device = Device(handle: frida_device_list_get(rawDevices, index))
                    devices.append(device)
                }
                g_object_unref(gpointer(rawDevices))

                Runtime.scheduleOnMainThread {
                    operation.completionHandler { devices }
                }
            }, Unmanaged.passRetained(AsyncOperation<EnumerateDevicesComplete>(completionHandler)).toOpaque())
        }
    }

    public func addRemoteDevice(_ host: String, completionHandler: @escaping AddRemoteDeviceComplete = { _ in }) {
        Runtime.scheduleOnFridaThread {
            frida_device_manager_add_remote_device(self.handle, host, nil, { source, result, data in
                let operation = Unmanaged<AsyncOperation<AddRemoteDeviceComplete>>.fromOpaque(data!).takeRetainedValue()

                var rawError: UnsafeMutablePointer<GError>? = nil
                let rawDevice = frida_device_manager_add_remote_device_finish(OpaquePointer(source), result, &rawError)
                if let rawError = rawError {
                    let error = Marshal.takeNativeError(rawError)
                    Runtime.scheduleOnMainThread {
                        operation.completionHandler { throw error }
                    }
                    return
                }

                let device = Device(handle: rawDevice!)

                Runtime.scheduleOnMainThread {
                    operation.completionHandler { device }
                }
            }, Unmanaged.passRetained(AsyncOperation<AddRemoteDeviceComplete>(completionHandler)).toOpaque())
        }
    }

    public func removeRemoteDevice(_ host: String, completionHandler: @escaping RemoveRemoteDeviceComplete = { _ in }) {
        Runtime.scheduleOnFridaThread {
            frida_device_manager_remove_remote_device(self.handle, host, nil, { source, result, data in
                let operation = Unmanaged<AsyncOperation<RemoveRemoteDeviceComplete>>.fromOpaque(data!).takeRetainedValue()

                var rawError: UnsafeMutablePointer<GError>? = nil
                frida_device_manager_remove_remote_device_finish(OpaquePointer(source), result, &rawError)
                if let rawError = rawError {
                    let error = Marshal.takeNativeError(rawError)
                    Runtime.scheduleOnMainThread {
                        operation.completionHandler { throw error }
                    }
                    return
                }

                Runtime.scheduleOnMainThread {
                    operation.completionHandler { true }
                }
            }, Unmanaged.passRetained(AsyncOperation<RemoveRemoteDeviceComplete>(completionHandler)).toOpaque())
        }
    }

    private let onChanged: ChangedHandler = { _, userData in
        let connection = Unmanaged<SignalConnection<DeviceManager>>.fromOpaque(userData).takeUnretainedValue()

        if let manager = connection.instance {
            Runtime.scheduleOnMainThread {
                manager.delegate?.deviceManagerDidChangeDevices?(manager)
            }
        }
    }

    private let onAdded: AddedHandler = { _, rawDevice, userData in
        let connection = Unmanaged<SignalConnection<DeviceManager>>.fromOpaque(userData).takeUnretainedValue()

        g_object_ref(gpointer(rawDevice))
        let device = Device(handle: rawDevice)

        if let manager = connection.instance {
            Runtime.scheduleOnMainThread {
                manager.delegate?.deviceManager?(manager, didAddDevice: device)
            }
        }
    }

    private let onRemoved: RemovedHandler = { _, rawDevice, userData in
        let connection = Unmanaged<SignalConnection<DeviceManager>>.fromOpaque(userData).takeUnretainedValue()

        g_object_ref(gpointer(rawDevice))
        let device = Device(handle: rawDevice)

        if let manager = connection.instance {
            Runtime.scheduleOnMainThread {
                manager.delegate?.deviceManager?(manager, didRemoveDevice: device)
            }
        }
    }

    private let releaseConnection: GClosureNotify = { data, _ in
        Unmanaged<SignalConnection<DeviceManager>>.fromOpaque(data!).release()
    }
}
