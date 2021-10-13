import SwiftUI

@main
struct CleaningApp: App {
    @StateObject private var appState = AppStateModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
