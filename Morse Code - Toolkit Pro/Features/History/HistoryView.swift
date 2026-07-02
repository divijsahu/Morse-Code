import SwiftUI
import SwiftData

struct HistoryView: View {

    @Query(sort: \MorseEntry.createdAt, order: .reverse) private var entries: [MorseEntry]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            Group {
                if entries.isEmpty {
                    ContentUnavailableView(
                        "No history yet",
                        systemImage: "clock",
                        description: Text("Conversions you make will appear here.")
                    )
                } else {
                    List {
                        ForEach(entries) { entry in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(entry.inputText)
                                    .font(.subheadline.weight(.medium))
                                    .lineLimit(1)
                                Text(entry.morseText)
                                    .font(.caption.monospaced())
                                    .foregroundStyle(.secondary)
                                    .lineLimit(1)
                            }
                            .padding(.vertical, 2)
                        }
                        .onDelete(perform: delete)
                    }
                }
            }
            .navigationTitle("History")
            .toolbar {
                if !entries.isEmpty {
                    EditButton()
                }
            }
        }
    }

    private func delete(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(entries[index])
        }
    }
}

#Preview {
    HistoryView()
        .environment(\.modelContext, try! ModelContainer(for: MorseEntry.self, configurations: .init(isStoredInMemoryOnly: true)).mainContext)
}
