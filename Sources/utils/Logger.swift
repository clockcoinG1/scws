import Foundation

enum LogLevel: String {
    case debug = "DEBUG"
    case info = "INFO"
    case warning = "WARNING"
    case error = "ERROR"
}

class Logger {
    private let logFileURL: URL
    private let dateFormatter: DateFormatter
    
    init(logFileURL: URL) {
        self.logFileURL = logFileURL
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    }
    
    private func log(_ level: LogLevel, _ message: String) {
        let timestamp = dateFormatter.string(from: Date())
        let logLine = "\(timestamp) [\(level.rawValue)] \(message)"
        
        print(logLine)
        
        do {
            let fileHandle = try FileHandle(forWritingTo: logFileURL)
            fileHandle.seekToEndOfFile()
            fileHandle.write(logLine.data(using: .utf8)!)
            fileHandle.write("\n".data(using: .utf8)!)
            fileHandle.closeFile()
        } catch {
            print("Error writing to log file: \(error)")
        }
    }
    
    func debug(_ message: String) {
        log(.debug, message)
    }
    
    func info(_ message: String) {
        log(.info, message)
    }
    
    func warning(_ message: String) {
        log(.warning, message)
    }
    
    func error(_ message: String) {
        log(.error, message)
    }
}