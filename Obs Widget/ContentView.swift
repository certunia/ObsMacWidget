//
//  ContentView.swift
//  Obs Widget
//
//  Created by Daniel Tiuneev on 16.02.24.
//

import SwiftUI

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
        }
    }
}

class BackgroundTask {
    var timer: Timer?

    func start() {
        // Start a timer to simulate background task
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
        print("Background task running...")
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var backgroundTask: BackgroundTask?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Initialize and start the background task
        backgroundTask = BackgroundTask()
        backgroundTask?.start()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Clean up resources when the application terminates
        backgroundTask?.stop()
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}



#Preview {
    ContentView()
}
