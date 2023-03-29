import SwiftUI
import Combine

class GameState: ObservableObject {
    @Published var bossHealth: Double
    @Published var remainingLives: Int
    @Published var progressViewColor: Color

    init(bossHealth: Double, remainingLives: Int, progressViewColor: Color = .green) {
        self.bossHealth = bossHealth
        self.remainingLives = remainingLives
        self.progressViewColor = progressViewColor
    }

    func decreaseBossHealth() {
        bossHealth -= 20
        updateProgressViewColor()
    }

    func decreaseLives() {
        remainingLives -= 1
    }

    private func updateProgressViewColor() {
        if bossHealth < 30 {
            progressViewColor = .red
        } else if bossHealth < 50 {
            progressViewColor = .orange
        } else if bossHealth < 70 {
            progressViewColor = .yellow
        } else {
            progressViewColor = .green
        }
    }
}
