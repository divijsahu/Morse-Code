import SwiftUI
import SwiftData

struct ConverterView: View {

    @State private var viewModel = ConverterViewModel()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                modeToggle
                inputSection
                Divider()
                outputSection
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: viewModel.outputText) {
                viewModel.saveToHistoryIfNeeded(context: modelContext)
            }
        }
    }

    // MARK: - Subviews

    private var modeToggle: some View {
        Button {
            viewModel.toggleMode()
        } label: {
            Label(viewModel.mode.label, systemImage: "arrow.left.arrow.right")
                .font(.subheadline.weight(.medium))
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
                .background(.thinMaterial, in: Capsule())
        }
        .padding(.vertical, 12)
    }

    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Input")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            TextEditor(text: $viewModel.inputText)
                .frame(minHeight: 120, maxHeight: 180)
                .padding(8)
                .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal)
                .overlay(alignment: .topLeading) {
                    if viewModel.inputText.isEmpty {
                        Text(viewModel.mode.inputPlaceholder)
                            .foregroundStyle(.tertiary)
                            .padding(.horizontal, 24)
                            .padding(.top, 16)
                            .allowsHitTesting(false)
                    }
                }

            HStack {
                Spacer()
                Button("Clear", systemImage: "xmark.circle") {
                    viewModel.clear()
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .disabled(viewModel.inputText.isEmpty)
                .padding(.horizontal)
            }
        }
        .padding(.bottom, 8)
    }

    private var outputSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Output")
                .font(.caption)
                .foregroundStyle(.secondary)
                .padding(.horizontal)

            Group {
                if viewModel.outputText.isEmpty {
                    ContentUnavailableView(
                        "No output yet",
                        systemImage: "waveform",
                        description: Text("Start typing above to see the conversion.")
                    )
                    .frame(maxHeight: .infinity)
                } else {
                    ScrollView {
                        Text(viewModel.outputText)
                            .font(.system(.body, design: .monospaced))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .textSelection(.enabled)
                    }
                }
            }
            .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)

            if !viewModel.outputText.isEmpty {
                HStack(spacing: 16) {
                    Spacer()
                    Button("Copy", systemImage: "doc.on.doc") {
                        UIPasteboard.general.string = viewModel.outputText
                    }
                    .font(.caption)

                    ShareLink(item: viewModel.outputText) {
                        Label("Share", systemImage: "square.and.arrow.up")
                            .font(.caption)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 8)
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ConverterView()
        .environment(\.modelContext, try! ModelContainer(for: MorseEntry.self, configurations: .init(isStoredInMemoryOnly: true)).mainContext)
}
