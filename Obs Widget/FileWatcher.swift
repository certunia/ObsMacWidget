//
//  FileWatcher.swift
//  Obs Widget
//
//  Created by Daniel Tiuneev on 16.02.24.
//

import Foundation

final class FileWatcher {
    let url: URL
    let fileHandle: FileHandle
    let source: DispatchSourceFileSystemObject

    init(url: URL) throws {
        self.url = url
        self.fileHandle = try FileHandle(forReadingFrom: url)

        source = DispatchSource.makeFileSystemObjectSource(
            fileDescriptor: fileHandle.fileDescriptor,
            eventMask: .extend,
            queue: DispatchQueue.main
        )
        
        source.setEventHandler {
            let event = self.source.data
            self.process(event: event)
        }
        source.setCancelHandler {
            try? self.fileHandle.close()
        }
    }
    
    deinit {
        source.cancel()
    }
    
    func process(event: DispatchSource.FileSystemEvent) {
        guard event.contains(.extend) else {
            return
        }
        let newData = self.fileHandle.readDataToEndOfFile()
        let string = String(data: newData, encoding: .utf8)!
        print("Detected: \(string)")
    }
}
