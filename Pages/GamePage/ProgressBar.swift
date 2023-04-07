import SwiftUI

struct ProgressBar: View {
@EnvironmentObject var gameState: GameState
    var body: some View {
        VStack {
            // 진행률 바
            healthProgressView
            // 보스 이름과 함께 HP 감소 버튼
            decreaseHealthButton
        }
    }

    // 진행률 바 뷰
    private var healthProgressView: some View {
        ProgressView("HP", value: gameState.bossHealth, total: bosses[gameState.currentBossIndex].maxHealth)
            .progressViewStyle(RoundedRectProgressViewStyle())
            .foregroundColor(gameState.progressViewColor)
    }

    // 보스 이름과 함께 HP 감소 버튼 뷰
    private var decreaseHealthButton: some View {
        Button {
            gameState.decreaseBossHealth() // 노바의 이스터에그
        } label: {
            Text("\(bosses[gameState.currentBossIndex].name)")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.white)
        }
    }
}

// 둥근 진행률 바 스타일
struct RoundedRectProgressViewStyle: ProgressViewStyle {
func makeBody(configuration: Configuration) -> some View {
ZStack(alignment: .leading) {
RoundedRectangle(cornerRadius: 14)
.frame(width: 250, height: 25)
.foregroundColor(.gray.opacity(0.25))
RoundedRectangle(cornerRadius: 14)
.frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 25)
}
.padding()
}
}
