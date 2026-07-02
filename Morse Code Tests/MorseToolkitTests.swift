import Testing
@testable import Morse_Code___Toolkit_Pro

@Suite("MorseEncoder")
struct MorseEncoderTests {

    let encoder = MorseEncoder()

    // MARK: - Edge cases

    @Test func emptyString() {
        #expect(encoder.encode("") == "")
    }

    // MARK: - Letters

    @Test func singleLetterUppercase() {
        #expect(encoder.encode("E") == ".")
        #expect(encoder.encode("T") == "-")
    }

    @Test func singleLetterLowercase() {
        #expect(encoder.encode("e") == ".")
        #expect(encoder.encode("t") == "-")
    }

    @Test func multipleLetters() {
        #expect(encoder.encode("HI") == ".... ..")
        #expect(encoder.encode("SOS") == "... --- ...")
    }

    // MARK: - Digits

    @Test func digits() {
        #expect(encoder.encode("0") == "-----")
        #expect(encoder.encode("9") == "----.")
        #expect(encoder.encode("99") == "----. ----.")
    }

    // MARK: - Punctuation

    @Test func punctuation() {
        #expect(encoder.encode(".") == ".-.-.-")
        #expect(encoder.encode(",") == "--..--")
        #expect(encoder.encode("?") == "..--..")
        #expect(encoder.encode("!") == "-.-.--")
        #expect(encoder.encode("'") == ".----.")
        #expect(encoder.encode("/") == "-..-.")
        #expect(encoder.encode("(") == "-.--.")
        #expect(encoder.encode(")") == "-.--.-")
        #expect(encoder.encode("&") == ".-...")
        #expect(encoder.encode(":") == "---...")
        #expect(encoder.encode(";") == "-.-.-.")
        #expect(encoder.encode("=") == "-...-")
        #expect(encoder.encode("+") == ".-.-.")
        #expect(encoder.encode("-") == "-....-")
        #expect(encoder.encode("_") == "..--.-")
        #expect(encoder.encode("\"") == ".-..-.")
        #expect(encoder.encode("@") == ".--.-.")
    }

    // MARK: - Word separation

    @Test func wordSeparator() {
        #expect(encoder.encode("HI HI") == ".... .. / .... ..")
    }

    @Test func multipleWords() {
        #expect(encoder.encode("S O S") == "... / --- / ...")
    }

    // MARK: - Unknown characters

    @Test func unknownCharacterReturnsQuestionMark() {
        #expect(encoder.encode("£") == "?")
    }

    @Test func unknownCharacterMixedWithKnown() {
        #expect(encoder.encode("A£B") == ".- ? -...")
    }

    @Test func unknownCharacterNocrash() {
        #expect(encoder.encode("😀") == "?")
    }
}

@Suite("MorseDecoder")
struct MorseDecoderTests {

    let decoder = MorseDecoder()

    // MARK: - Edge cases

    @Test func emptyString() {
        #expect(decoder.decode("") == "")
    }

    @Test func extraWhitespaceTrimmed() {
        #expect(decoder.decode("  ... --- ...  ") == "SOS")
    }

    // MARK: - Letters

    @Test func singleSymbol() {
        #expect(decoder.decode(".") == "E")
        #expect(decoder.decode("-") == "T")
    }

    @Test func multipleSymbols() {
        #expect(decoder.decode(".... ..") == "HI")
        #expect(decoder.decode("... --- ...") == "SOS")
    }

    // MARK: - Digits

    @Test func digits() {
        #expect(decoder.decode("-----") == "0")
        #expect(decoder.decode("----.") == "9")
        #expect(decoder.decode("----. ----.") == "99")
    }

    // MARK: - Word separation

    @Test func wordSeparator() {
        #expect(decoder.decode(".... .. / .... ..") == "HI HI")
    }

    // MARK: - Unknown / malformed

    @Test func unknownSequenceReturnsQuestionMark() {
        #expect(decoder.decode("..--") == "?")
    }

    @Test func unknownMixedWithKnown() {
        #expect(decoder.decode(".- ..-- -...") == "A?B")
    }

    @Test func malformedInputNoCrash() {
        #expect(decoder.decode("invalid!!!") == "?")
    }

    // MARK: - Roundtrip

    @Test func roundtrip() {
        let encoder = MorseEncoder()
        let original = "HELLO WORLD"
        #expect(decoder.decode(encoder.encode(original)) == original)
    }
}
