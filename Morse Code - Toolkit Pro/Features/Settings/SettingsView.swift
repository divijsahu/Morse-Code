import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Settings",
                systemImage: "gearshape",
                description: Text("WPM, audio frequency, theme, and more coming soon.")
            )
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
}
