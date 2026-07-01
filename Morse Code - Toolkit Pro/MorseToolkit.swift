import SwiftUI
import SwiftData

@main
struct MorseToolkit: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: MorseEntry.self)
    }
}
