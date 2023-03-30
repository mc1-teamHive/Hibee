import SwiftUI
import Combine

class GameState: ObservableObject {
    @Published var bossHealth: Double
    @Published var remainingLives: Int
    @Published var progressViewColor: Color
    @Published var isRoundEnd: Bool = false
    @Published var isHotdogtime = false
    @Published var isGameWon: Bool = false
    @Published var currentBossIndex: Int = 0
    let totalBosses: Int
    init(bossHealth: Double, remainingLives: Int, progressViewColor: Color = .green, totalBosses: Int = 3) {
        self.bossHealth = bossHealth
        self.remainingLives = remainingLives
        self.totalBosses = totalBosses
        self.progressViewColor = progressViewColor
    }

    func moveToNextBoss() {
        currentBossIndex += 1
        self.bossHealth = bosses[self.currentBossIndex].maxHealth
    
        
    }
    
    func decreaseBossHealth() {
        bossHealth -= 30
        updateProgressViewColor()
        if bossHealth <= 0 {
            if currentBossIndex == totalBosses - 1 {
                isGameWon = true
            } else {
                isRoundEnd = true
            }
        }
    }

    func increaseLives(){
        remainingLives += 1
    }
    func resetLives() {
        remainingLives = 3
    }
    
    func decreaseLives() {
        remainingLives -= 1
    }

    private func updateProgressViewColor() {
        if bossHealth <=  30  && bossHealth > 1{
            progressViewColor = .red
        } else if bossHealth < 50  && bossHealth > 1{
            progressViewColor = .orange
        } else if bossHealth < 70 && bossHealth > 1{
            progressViewColor = .yellow
        } else {
            progressViewColor = .green
        }
    }
}
