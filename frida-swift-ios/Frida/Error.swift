import Foundation

public enum Error: Swift.Error {
    case serverNotRunning(String)
    case executableNotFound(String)
    case executableNotSupported(String)
    case processNotFound(String)
    case processNotResponding(String)
    case invalidArgument(String)
    case invalidOperation(String)
    case permissionDenied(String)
    case addressInUse(String)
    case timedOut(String)
    case notSupported(String)
    case protocolViolation(String)
    case transport(String)
    case rpcError(message: String, stackTrace: String?)
}
