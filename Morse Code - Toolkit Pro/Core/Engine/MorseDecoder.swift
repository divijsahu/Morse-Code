/// Decodes International Morse Code back into plain text.
///
/// - Symbol tokens are separated by a single space.
/// - Word boundaries are marked by ` / `.
/// - Unknown sequences are replaced with `?` — no crash.
/// - Extra whitespace in input is handled via `split`.
///
/// ```swift
/// let decoder = MorseDecoder()
/// decoder.decode("... --- ...")  // "SOS"
/// decoder.decode(".... ..")      // "HI"
/// decoder.decode("")             // ""
/// ```
struct MorseDecoder {

    private let table: [String: String]

    init(table: [String: String] = MorseCodeTable.reversed) {
        self.table = table
    }

    // MARK: - Public API

    func decode(_ morse: String) -> String {
        guard !morse.isEmpty else { return "" }

        return morse
            .split(separator: "/", omittingEmptySubsequences: true)
            .map { decodeWord(String($0)) }
            .joined(separator: " ")
    }

    // MARK: - Private

    private func decodeWord(_ word: String) -> String {
        word.split(separator: " ", omittingEmptySubsequences: true)
            .map { table[String($0)] ?? "?" }
            .joined()
    }
}
