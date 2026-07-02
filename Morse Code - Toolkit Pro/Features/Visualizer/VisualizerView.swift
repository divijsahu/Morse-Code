import SwiftUI

struct VisualizerView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Telegraph Key",
                systemImage: "hand.tap",
                description: Text("Tap to send dots and dashes. LED visualizer coming soon")
            )
            .navigationTitle("Visualizer")
        }
    }
}

#Preview {
    VisualizerView()
}
