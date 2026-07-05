import SwiftUI
import SwiftData

struct ConverterView: View {

    @State private var viewModel = ConverterViewModel()
    @State private var showHistory = false
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                inputSection
                Divider()
                outputSection
            }
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            .navigationTitle("Converter")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("History", systemImage: "clock") {
                        showHistory = true
                    }
                }
            }
            .sheet(isPresented: $showHistory) {
                NavigationStack {
                    HistoryView()
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button("Done") { showHistory = false }
                            }
                        }
                }
            }
            .safeAreaInset(edge: .top, spacing: 0) {
                scopeBar
            }
            .onChange(of: viewModel.outputText) {
                viewModel.scheduleHistorySave(context: modelContext)
            }
        }
    }

    // MARK: - Subviews

    private var scopeBar: some View {
        Picker("", selection: Binding(
            get: { viewModel.mode },
            set: { viewModel.toggleMode(to: $0) }
        )) {
            Text("Text → Morse").tag(ConversionMode.textToMorse)
            Text("Morse → Text").tag(ConversionMode.morseToText)
        }
        .pickerStyle(.segmented)
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(.bar)
    }

    private var inputSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Input")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                Button("Clear", systemImage: "xmark.circle") {
                    viewModel.clear()
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .disabled(viewModel.inputText.isEmpty)
            }
            .padding(.horizontal)

            TextEditor(text: $viewModel.inputText)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
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
        }
        .padding(.vertical, 8)
        .frame(maxHeight: .infinity)
    }

    private var outputSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text("Output")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                Button("Copy", systemImage: "doc.on.doc") {
                    UIPasteboard.general.string = viewModel.outputText
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                .disabled(viewModel.outputText.isEmpty)

                ShareLink(item: viewModel.outputText) {
                    Label("Share", systemImage: "square.and.arrow.up")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .disabled(viewModel.outputText.isEmpty)
            }
            .padding(.horizontal)

            Group {
                if viewModel.outputText.isEmpty {
                    ContentUnavailableView(
                        "No output yet",
                        systemImage: "waveform",
                        description: Text("Start typing above to see the conversion.")
                    )
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
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.secondarySystemBackground), in: RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
        .frame(maxHeight: .infinity)
    }
}

#Preview {
    ConverterView()
        .environment(\.modelContext, try! ModelContainer(for: MorseEntry.self, configurations: .init(isStoredInMemoryOnly: true)).mainContext)
}
