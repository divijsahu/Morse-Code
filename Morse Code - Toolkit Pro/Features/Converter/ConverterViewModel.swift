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

    var outputText: String {
        guard !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return "" }
        return mode == .textToMorse
            ? encoder.encode(inputText)
            : decoder.decode(inputText)
    }

    func toggleMode(to newMode: ConversionMode) {
        guard newMode != mode else { return }
        inputText = ""
        lastSaved = ""
        mode = newMode
    }

    func clear() {
        inputText = ""
        lastSaved = ""
    }

    func saveToHistoryIfNeeded(context: ModelContext) {
        let output = outputText
        guard !output.isEmpty, output != lastSaved else { return }
        let entry = mode == .textToMorse
            ? MorseEntry(inputText: inputText, morseText: output)
            : MorseEntry(inputText: output, morseText: inputText)
        context.insert(entry)
        lastSaved = output
    }
}
