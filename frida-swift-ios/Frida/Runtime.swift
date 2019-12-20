import CFrida

class Runtime {
    typealias Handler = @convention(block) () -> Void

    static func scheduleOnMainThread(_ handler: @escaping Handler) {
        DispatchQueue.main.async(execute: handler)
    }

    static func scheduleOnFridaThread(_ handler: @escaping Handler) {
        let data = gpointer(Unmanaged.passRetained(ScheduledOperation(handler: handler)).toOpaque())
        let source = g_idle_source_new()
        g_source_set_callback(source, { data in
            let operation = Unmanaged<ScheduledOperation>.fromOpaque(UnsafeRawPointer(data)!).takeRetainedValue()
            operation.handler()
            return gboolean(0)
        }, data, nil)
        g_source_attach(source, frida_get_main_context())
        g_source_unref(source)
    }

    private class ScheduledOperation {
        fileprivate let handler: Handler

        init(handler: @escaping Handler) {
            self.handler = handler
        }
    }
}
