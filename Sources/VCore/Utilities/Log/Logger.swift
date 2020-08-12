//
//  File.swift
//  
//
//  Created by Victor Melo on 12/08/20.
//

import Foundation

public class Logger {
    
    // MARK: Internal Types
    
    public class Configuration {
        static var allowToPrint = true
        static var allowToLogWrite = true
        static var addTimeStamp = false
        static var addFileName = true
        static var addFunctionName = true
        static var addLineNumber = true
        
        private init() { }
    }
    
    public enum Level {
        case debug, info, error, exception, warning
        
        func symbolString() -> String {
            switch self {
            case .debug: return "\u{0001F539} Debug ➯ "
            case .info: return "\u{0001F538} Info ➯ "
            case .error: return "\u{0001F6AB} Error ➯ "
            case .exception: return "\u{2757}\u{Fe0F} Exception ➯ "
            case .warning: return "\u{26A0}\u{FE0F} Warning ➯ "
            }
        }
    }
    
    // MARK: Attributes
    
    public static var configuration = Configuration.self
    
    // MARK: Functions

    @discardableResult
    public static func log(_ message: String, logLevel: Level, _ callingFunctionName: String = #function, _ lineNumber: UInt = #line, _ fileName: String = #file) -> String {
        
        var fullMessageString = logLevel.symbolString()
        
        if configuration.addTimeStamp {
            fullMessageString += Date().formattedISO8601 + " ⇨ "
        }
        
        if configuration.addFileName {
            let fileName = URL(fileURLWithPath: fileName).deletingPathExtension().lastPathComponent
            fullMessageString += " "+fileName+" ⇨ "
        }
        
        if configuration.addFunctionName {
            fullMessageString += callingFunctionName
            fullMessageString += configuration.addLineNumber ? " : \(lineNumber) ⇨ " : " ⇨ "
        }
        
        fullMessageString += message
        
        if configuration.allowToPrint {
           print(fullMessageString)
        }
        
        if configuration.allowToLogWrite {
            var a = FileLogger.default
            print(fullMessageString, to: &a)
        }

        return fullMessageString
    }
    
}

private struct FileLogger: TextOutputStream {
    
    private static var documentDirectoryPath: String {
        NSHomeDirectory() + "/Documents/"
    }
    
    private static var logFileName: String {
        Date().currentDate+"Logger.txt"
    }
    
    private static var logFileFullPath: String {
            documentDirectoryPath+logFileName
    }
    
    static var `default`: FileLogger {
        struct Singleton {
            static let instance = FileLogger()
        }
        return Singleton.instance
    }
    
    private init() {
        
    }
    
    lazy var fileHandle: FileHandle? = {
        if !FileManager.default.fileExists(atPath: FileLogger.logFileFullPath) {
            FileManager.default.createFile(atPath: FileLogger.logFileFullPath, contents: nil, attributes: nil)
        }
        let fileHandle = FileHandle(forWritingAtPath: FileLogger.logFileFullPath)
        return fileHandle
    }()
    
    mutating func write(_ string: String) {
        fileHandle?.seekToEndOfFile()
        if let dataToWrite = string.data(using: String.Encoding.utf8) {
            fileHandle?.write(dataToWrite)
        }
        
    }
}

private extension Date {
    
    static let formatterISO8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSX"
        return formatter
    }()
    
    static let formatteryyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: Calendar.Identifier.iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    var formattedISO8601: String { return Date.formatterISO8601.string(from: self) }
    var currentDate: String { return Date.formatteryyyyMMdd.string(from: self) }
}
