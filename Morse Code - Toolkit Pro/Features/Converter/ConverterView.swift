import SwiftUI

struct ConverterView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Converter",
                systemImage: "arrow.left.arrow.right",
                description: Text("Text ↔ Morse conversion coming in Sprint 2.")
            )
            .navigationTitle("Converter")
        }
    }
}

#Preview {
    ConverterView()
}
