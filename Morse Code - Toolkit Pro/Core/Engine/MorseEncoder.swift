/// Encodes plain text into International Morse Code.
///
/// - Characters are separated by a single space.
/// - Words are separated by ` / `.
/// - Unknown characters are replaced with `?` — no crash.
///
/// ```swift
/// let encoder = MorseEncoder()
/// encoder.encode("SOS")  // "... --- ..."
/// encoder.encode("HI")   // ".... .."
/// encoder.encode("")     // ""
/// ```
struct MorseEncoder {

    private let table: [String: String]

    init(table: [String: String] = MorseCodeTable.symbols) {
        self.table = table
    }

    // MARK: - Public API

    func encode(_ text: String) -> String {
        guard !text.isEmpty else { return "" }

        return text
            .map(encodedCharacter)
            .joined(separator: " ")
    }

    // MARK: - Private

    private func encodedCharacter(_ char: Character) -> String {
        if char == " " { return "/" }
        return table[char.uppercased()] ?? "?"
    }
}
