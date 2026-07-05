import SwiftUI

struct TransmitView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Transmit",
                systemImage: "antenna.radiowaves.left.and.right",
                description: Text("Flashlight, haptics, and audio transmission coming soon.")
            )
            .navigationTitle("Transmit")
        }
    }
}

#Preview {
    TransmitView()
}
