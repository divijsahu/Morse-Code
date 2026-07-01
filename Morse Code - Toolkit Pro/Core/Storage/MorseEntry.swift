import Foundation
import SwiftData

@Model
final class MorseEntry {
    var id: UUID
    var inputText: String
    var morseText: String
    var isFavorite: Bool
    var createdAt: Date

    init(inputText: String, morseText: String) {
        self.id = UUID()
        self.inputText = inputText
        self.morseText = morseText
        self.isFavorite = false
        self.createdAt = Date()
    }
}
