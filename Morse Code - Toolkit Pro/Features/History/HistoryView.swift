import SwiftUI
import SwiftData

struct HistoryView: View {

    @Query(sort: \MorseEntry.createdAt, order: .reverse) private var entries: [MorseEntry]
    @Environment(\.modelContext) private var modelContext

    var body: some View {
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
                        VStack(alignment: .leading, spacing: 2) {
                            HStack(spacing: 4) {
                                Text(entry.isTextToMorse ? entry.inputText : entry.morseText)
                                    .font(.subheadline.weight(.medium))
                                    .lineLimit(1)
                                Spacer()
                                Text(entry.isTextToMorse ? "Text → Morse" : "Morse → Text")
                                    .font(.caption2)
                                    .foregroundStyle(.secondary)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 2)
                                    .background(.secondary.opacity(0.15), in: Capsule())
                            }
                            Text(entry.isTextToMorse ? entry.morseText : entry.inputText)
                                .font(.caption.monospaced())
                                .foregroundStyle(.secondary)
                                .lineLimit(1)
                            Text(entry.createdAt.formatted(date: .abbreviated, time: .shortened))
                                .font(.caption2)
                                .foregroundStyle(.tertiary)
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
                ToolbarItem(placement: .topBarLeading) {
                    Button("Clear All", role: .destructive) {
                        entries.forEach { modelContext.delete($0) }
                    }
                    .foregroundStyle(.red)
                }
                ToolbarItem(placement: .topBarTrailing) {
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
