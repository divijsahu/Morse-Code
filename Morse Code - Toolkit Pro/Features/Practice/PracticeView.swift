import SwiftUI

struct PracticeView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "Practice",
                systemImage: "graduationcap",
                description: Text("Learn, quiz, and daily challenges coming soon.")
            )
            .navigationTitle("Practice")
        }
    }
}

#Preview {
    PracticeView()
}
