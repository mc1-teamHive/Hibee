import SwiftUI
import Combine

class GameState: ObservableObject {
    // 속성
    @Published var bossHealth: Double // 보스의 현재 체력
    @Published var remainingLives: Int // 플레이어의 남은 목숨
    @Published var progressViewColor: Color // 보스 체력에 따른 진행 상황 뷰 색상
    @Published var isRoundEnd: Bool = false // 현재 라운드가 끝났는지 여부
    @Published var isHotdogtime = false // 사용자 정의 속성, 목적 불분명
    @Published var howmanyattack = 1 // 공격 횟수를 추적
    @Published var isGameWon: Bool = false // 게임에서 이긴 것인지 여부
    @Published var currentBossIndex: Int = 0 // 현재 보스 인덱스
    @Published var answerarr: [Int] = [] // 중복을 방지하기 위해 답변된 질문의 인덱스를 저장하는 배열
    let totalBosses: Int // 게임의 전체 보스 수
    @Published var randnum: Int = 0 // 무작위 숫자
    
    // 초기화
    init(bossHealth: Double, remainingLives: Int, progressViewColor: Color = .green, totalBosses: Int = 3) {
        self.bossHealth = bossHealth
        self.remainingLives = remainingLives
        self.totalBosses = totalBosses
        self.progressViewColor = progressViewColor
    }
    
    // 다음 보스로 이동
    func moveToNextBoss() {
        howmanyattack = 1
        currentBossIndex += 1
        self.bossHealth = bosses[self.currentBossIndex].maxHealth
    }
    
    // 보스 체력을 30 감소시키고, 진행률 뷰 색상 업데이트, 필요한 경우 isRoundEnd 또는 isGameWon 설정
    func decreaseBossHealth() {
        bossHealth -= 1
        howmanyattack += 1
        updateProgressViewColor()
        if bossHealth <= 0 {
            if currentBossIndex == totalBosses - 1 {
                isGameWon = true
            } else {
                isRoundEnd = true
            }
        }
    }
    
    // 플레이어의 목숨을 1 증가시킴
    func increaseLives() {
        remainingLives += 1
    }
    
    // 플레이어의 목숨을 3으로 초기화
    func resetLives() {
        remainingLives = 3
    }
    
    // 플레이어의 목숨을 1 감소시킴
    func decreaseLives() {
        remainingLives -= 1
    }
    
    // 보스 체력에 따라 진행률 뷰 색상 업데이트
    private func updateProgressViewColor() {
        if bossHealth <= 1 && bossHealth > 0 {
            progressViewColor = .red
        } else if bossHealth < 3 && bossHealth > 0 {
            progressViewColor = .orange
        } else if bossHealth < 4 && bossHealth > 0 {
            progressViewColor = .yellow
        } else {
            progressViewColor = .green
        }
    }
}
