//
//  GameModel.swift
//  
//
//  Created by Ha Jong Myeong on 2023/03/28.
//

import Foundation

// MARK: - Structs

// Quiz Model
struct QuizModel {
    let question: String
    let options: [String]
    let answer: Int
    let description: String
}

// Boss Model
struct BossModel {
    let name: String
    let maxHealth: Int
    var currentHealth: Int
    
    mutating func takeDamage(_ damage: Int) {
        currentHealth -= damage
        if currentHealth < 0 {
            currentHealth = 0
        }
    }
    
    var isDefeated: Bool {
        return currentHealth == 0
    }
}

// Game Stats
struct GameStats {
    let totalRounds: Int
    var currentRound: Int
    var remainingLives: Int
}

// MARK: - Game Model

class GameModel {
    private(set) var quizzes: [QuizModel]
    private(set) var bosses: [BossModel]
    private(set) var gameStats: GameStats
    private(set) var currentIndex: Int
    
    init(quizzes: [QuizModel], bosses: [BossModel], gameStats: GameStats) {
        self.quizzes = quizzes
        self.bosses = bosses
        self.gameStats = gameStats
        self.currentIndex = 0
    }
    
    func getCurrentQuiz() -> QuizModel {
        return quizzes[currentIndex]
    }
    
    func getCurrentBoss() -> BossModel {
        return bosses[currentIndex]
    }
    
    func answerQuiz(optionIndex: Int) -> Bool {
        let isCorrect = quizzes[currentIndex].answer == optionIndex
        
        if !isCorrect {
            gameStats.remainingLives -= 1
        } else {
            var currentBoss = bosses[currentIndex]
            currentBoss.takeDamage(1)
            bosses[currentIndex] = currentBoss
        }
        
        return isCorrect
    }
    
    func moveToNextQuiz() -> Bool {
        if currentIndex < quizzes.count - 1 {
            currentIndex += 1
            return true
        }
        return false
    }
    
    func isGameOver() -> Bool {
        return gameStats.remainingLives == 0 || currentIndex == quizzes.count - 1 && bosses[currentIndex].isDefeated
    }
    
    func isGameWon() -> Bool {
        return currentIndex == quizzes.count - 1 && bosses[currentIndex].isDefeated
    }
}
