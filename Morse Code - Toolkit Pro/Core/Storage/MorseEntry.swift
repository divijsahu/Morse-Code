import Foundation
import SwiftData

@Model
final class MorseEntry {
    var id: UUID
    var inputText: String
    var morseText: String
    var isFavorite: Bool
    var isTextToMorse: Bool
    var createdAt: Date

    init(inputText: String, morseText: String, isTextToMorse: Bool) {
        self.id = UUID()
        self.inputText = inputText
        self.morseText = morseText
        self.isFavorite = false
        self.isTextToMorse = isTextToMorse
        self.createdAt = Date()
    }
}
