import SwiftUI

struct TopPanelView: View {
@EnvironmentObject var gameState: GameState
    var body: some View {
        HStack {
            // 상단 패널 뷰
            topPanelContent
            Spacer()
        }
    }

    // 상단 패널 뷰 내용
    private var topPanelContent: some View {
        VStack {
            // 라운드 표시
            roundText
            Spacer().frame(width: 10)
            // 생명 표시
            lifeInfo
        }
        .frame(height: 20)
        .padding(.top, 30)
        .padding(.horizontal, 10)
    }

    // 라운드 텍스트 뷰
    private var roundText: some View {
        Text("Round \(gameState.currentBossIndex + 1)/3")
            .panelTextStyle()
            .multilineTextAlignment(.leading)
    }

    // 생명 정보 뷰
    private var lifeInfo: some View {
        HStack {
            Text("Life")
                .panelTextStyle()
            ForEach(0..<max(1, gameState.remainingLives), id: \.self) { _ in
                Image("Heart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 35, height: 35)
            }
        }
    }
}

// 텍스트 스타일 확장
extension Text {
func panelTextStyle() -> Text {
self.font(.system(size: 30, weight: .heavy))
.foregroundColor(Color(.white))
}
}
