/// The canonical Morse code symbol table.
///
/// All mappings live here so every encoder/decoder shares one source of truth.
enum MorseCodeTable {

    // MARK: - Symbol map

    /// Maps a normalised uppercase character → Morse pattern.
    static let symbols: [String: String] = {
        var t: [String: String] = [:]

        // Letters (A–Z)
        let letters: KeyValuePairs<String, String> = [
            "A": ".-",   "B": "-...", "C": "-.-.", "D": "-..",
            "E": ".",    "F": "..-.", "G": "--.",  "H": "....",
            "I": "..",   "J": ".---", "K": "-.-",  "L": ".-..",
            "M": "--",   "N": "-.",   "O": "---",  "P": ".--.",
            "Q": "--.-", "R": ".-.",  "S": "...",  "T": "-",
            "U": "..-",  "V": "...-", "W": ".--",  "X": "-..-",
            "Y": "-.--", "Z": "--.."
        ]

        // Digits (0–9)
        let digits: KeyValuePairs<String, String> = [
            "0": "-----", "1": ".----", "2": "..---", "3": "...--",
            "4": "....-", "5": ".....", "6": "-....", "7": "--...",
            "8": "---..", "9": "----."
        ]

        // Punctuation
        let punctuation: KeyValuePairs<String, String> = [
            ".": ".-.-.-", ",": "--..--", "?": "..--..", "!": "-.-.--",
            "'": ".----.", "/": "-..-.",  "(": "-.--.",  ")": "-.--.-",
            "&": ".-...", ":": "---...", ";": "-.-.-.", "=": "-...-",
            "+": ".-.-.", "-": "-....-", "_": "..--.-", "\"": ".-..-.",
            "@": ".--.-."
        ]

        for (k, v) in letters     { t[k] = v }
        for (k, v) in digits      { t[k] = v }
        for (k, v) in punctuation { t[k] = v }

        return t
    }()

    /// Inverted map: Morse pattern → character. Used by `MorseDecoder`.
    static let reversed: [String: String] = Dictionary(
        symbols.map { ($1, $0) }, uniquingKeysWith: { first, _ in first }
    )
}
