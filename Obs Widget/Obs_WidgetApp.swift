//
//  Obs_WidgetApp.swift
//  Obs Widget
//
//  Created by Daniel Tiuneev on 16.02.24.
//

import SwiftUI
import Foundation

@main
struct StatusBarItemApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .commands {
            CommandGroup(replacing: CommandGroupPlacement.newItem) {}
        };
        
        @State var command: String = "d"
        
        MenuBarExtra(command, systemImage: "checklist") {
            Text("obsidian ")
            
            Button("Uno") { print("opop") }
                .keyboardShortcut("U")
           
            Divider()

            Button("Quit") { NSApplication.shared.terminate(nil) }
                .keyboardShortcut("S")
        }
    }
}

class BackgroundTask {
    var timer: Timer?

    func start() {
        // Start a timer to simulate background taskw
        timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true) { _ in
            self.performBackgroundTask()
        }
    }

    func stop() {
        // Stop the timer when the background task is no longer needed
        timer?.invalidate()
    }

    func performBackgroundTask() {
        // Perform the background task here
//        print("Background task running...")
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var backgroundTask: BackgroundTask?
    var fileWatcher: FileWatcher?
    var logPath = URL(fileURLWithPath: "/Users/mac_quack/Dev/filo")

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Initialize and start the background task
        backgroundTask = BackgroundTask()
        backgroundTask?.start()
        
        print("asdffaa")

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
        fileHandle.seekToEndOfFile() // Make sure we're writing at the end of the file!
//        fileHandle.write("Woo! SwiftRocks.".data(using: .utf8)!)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Clean up resources when the application terminates
        backgroundTask?.stop()
    }
}

struct ContentView: View {
    var body: some View {
        Text("Settings here. GHHH")
            .padding()
    }
}

#Preview {
    ContentView()
}
