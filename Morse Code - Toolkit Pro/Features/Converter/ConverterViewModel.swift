import SwiftUI
import SwiftData

enum ConversionMode {
    case textToMorse, morseToText

    var label: String {
        self == .textToMorse ? "Text → Morse" : "Morse → Text"
    }

    var inputPlaceholder: String {
        self == .textToMorse ? " Type in English here..." : " Type in Morse (e.g. ... --- ...)"
    }
}

@Observable
final class ConverterViewModel {

    var inputText: String = ""
    var mode: ConversionMode = .textToMorse

    private let encoder = MorseEncoder()
    private let decoder = MorseDecoder()
    private var lastSaved: String = ""
    private var debounceTask: Task<Void, Never>?

    var outputText: String {
        guard !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return "" }
        return mode == .textToMorse
            ? encoder.encode(inputText)
            : decoder.decode(inputText)
    }

    func toggleMode(to newMode: ConversionMode) {
        guard newMode != mode else { return }
        debounceTask?.cancel()
        inputText = ""
        lastSaved = ""
        mode = newMode
    }

    func clear() {
        debounceTask?.cancel()
        inputText = ""
        lastSaved = ""
    }

    func scheduleHistorySave(context: ModelContext) {
        debounceTask?.cancel()
        let delay: Duration = mode == .textToMorse ? .seconds(5) : .seconds(10)
        debounceTask = Task { [weak self] in
            try? await Task.sleep(for: delay)
            guard !Task.isCancelled, let self else { return }
            let output = self.outputText
            guard !output.isEmpty, output != self.lastSaved else { return }
            let entry = self.mode == .textToMorse
                ? MorseEntry(inputText: self.inputText, morseText: output, isTextToMorse: true)
                : MorseEntry(inputText: output, morseText: self.inputText, isTextToMorse: false)
            await MainActor.run {
                context.insert(entry)
                self.lastSaved = output
            }
        }
    }
}
