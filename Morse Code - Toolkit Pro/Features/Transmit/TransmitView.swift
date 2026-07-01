import SwiftUI

struct TransmitView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Transmit",
                systemImage: "antenna.radiowaves.left.and.right",
                description: Text("Flashlight, haptics, and audio transmission coming in Sprint 3.")
            )
            .navigationTitle("Transmit")
        }
    }
}

#Preview {
    TransmitView()
}
