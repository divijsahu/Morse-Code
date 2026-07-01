import SwiftUI
import SwiftData

@main
struct MorseToolkit: App {
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(for: MorseEntry.self)
    }
}
