@_private(sourceFile: "Obs_WidgetApp.swift") import Obs_Widget
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import Foundation
import SwiftUI

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mac_quack/Dev/Learn/Obs Widget/Obs Widget/Obs_WidgetApp.swift", line: 97)
        Text(__designTimeString("#3232.[5].[0].property.[0].[0].arg[0].value", fallback: "Settings here. GHHH"))
            .padding()
    
#sourceLocation()
    }
}

extension AppDelegate {
    @_dynamicReplacement(for: applicationWillTerminate(_:)) private func __preview__applicationWillTerminate(_ aNotification: Notification) {
        #sourceLocation(file: "/Users/mac_quack/Dev/Learn/Obs Widget/Obs Widget/Obs_WidgetApp.swift", line: 90)
        // Clean up resources when the application terminates
        backgroundTask?.stop()
    
#sourceLocation()
    }
}

extension AppDelegate {
    @_dynamicReplacement(for: applicationDidFinishLaunching(_:)) private func __preview__applicationDidFinishLaunching(_ aNotification: Notification) {
        #sourceLocation(file: "/Users/mac_quack/Dev/Learn/Obs Widget/Obs Widget/Obs_WidgetApp.swift", line: 67)
        // Initialize and start the background task
        backgroundTask = BackgroundTask()
        backgroundTask?.start()
        
        print(__designTimeString("#3232.[4].[3].[2].arg[0].value", fallback: "asdffaa"))

        do {
            try "".write(to: logPath, atomically: true, encoding: .utf8)
            print("Success! Yum.")
        } catch {
            print("No!")
        }
        
        // Monitor the file
        fileWatcher = try? FileWatcher(url: logPath)

        // Write something to the file
        let fileHandle = try? FileHandle(forWritingTo: logPath)
//        fileHandle.seekToEndOfFile() // Make sure we're writing at the end of the file!
//        fileHandle.write("Woo! SwiftRocks.".data(using: .utf8)!)
    
#sourceLocation()
    }
}

extension BackgroundTask {
    @_dynamicReplacement(for: performBackgroundTask()) private func __preview__performBackgroundTask() {
        #sourceLocation(file: "/Users/mac_quack/Dev/Learn/Obs Widget/Obs Widget/Obs_WidgetApp.swift", line: 56)

#sourceLocation()
        // Perform the background task here
//        print("Background task running...")
    }
}

extension BackgroundTask {
    @_dynamicReplacement(for: stop()) private func __preview__stop() {
        #sourceLocation(file: "/Users/mac_quack/Dev/Learn/Obs Widget/Obs Widget/Obs_WidgetApp.swift", line: 51)
        // Stop the timer when the background task is no longer needed
        timer?.invalidate()
    
#sourceLocation()
    }
}

extension BackgroundTask {
    @_dynamicReplacement(for: start()) private func __preview__start() {
        #sourceLocation(file: "/Users/mac_quack/Dev/Learn/Obs Widget/Obs Widget/Obs_WidgetApp.swift", line: 44)
        // Start a timer to simulate background taskw
        timer = Timer.scheduledTimer(withTimeInterval: __designTimeFloat("#3232.[3].[1].[0].[0]", fallback: 5.0), repeats: __designTimeBoolean("#3232.[3].[1].[0].[1]", fallback: true)) { _ in
            self.performBackgroundTask()
        }
    
#sourceLocation()
    }
}

import struct Obs_Widget.StatusBarItemApp
import class Obs_Widget.BackgroundTask
import class Obs_Widget.AppDelegate
import struct Obs_Widget.ContentView
#Preview {
    ContentView()
}



