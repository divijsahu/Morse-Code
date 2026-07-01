import SwiftUI

struct VisualizerView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Telegraph Key",
                systemImage: "hand.tap",
                description: Text("Tap to send dots and dashes. LED visualizer coming in Sprint 3.5.")
            )
            .navigationTitle("Visualizer")
        }
    }
}

#Preview {
    VisualizerView()
}
