//
// NEED REFACTOR ON LOCATION FOR AUTO LAYOUT 22/4/7

import SwiftUI

struct CardFlipView: View {
    @EnvironmentObject var gameState: GameState // 게임 상태에 대한 공유 객체
    @State private var degrees: [Double] = [-40, -30, -25, -15, -5, 5, 15, 25, 30, 40].map { $0 } // 카드 회전 각도 배열
    @State private var yLocation: [Double] = [20, -10, -40, -78, -85, -85, -78, -40, -10, 20] // 카드의 Y 위치 배열
    @State private var xLocation: [Double] = [270, 190, 120, 70, 10, -30, -70, -100, -160, -230] // 카드의 X 위치 배열
    @State private var offsets: [CGSize] = Array(repeating: .zero, count: 10) // 카드 위치 오프셋 배열
    @State private var isToggle: [Bool] = Array(repeating: false, count: 10) // 카드 토글 여부 배열
    @State private var isShowingStoryView = false // 스토리 뷰 표시 여부
    @State private var isShowingCards = false // 카드 표시 여부
    private let nCardsInPack = 10 // 팩 안의 카드 수
    private let cardWidth: CGFloat = 215 // 카드 너비
    private let cardHeight: CGFloat = 300 // 카드 높이
    // 카드 뷰 생성 함수
    
    private func createCards() -> some View {
        ForEach(degrees.indices, id: \.self) { index in
            CardImage(width: cardWidth, height: cardHeight, degree: $degrees[index], offset: $offsets[index], isToggled: $isToggle[index])
                .offset(x: xLocation[index], y: yLocation[index])
                .opacity(isShowingCards ? 1 : 0)
                .animation(Animation.linear.delay(Double(index) * 0.08), value: isShowingCards)
        }
    }
    
    // 본문 뷰
    var body: some View {
        HStack(spacing: 0) {
            createCards()
                .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(.horizontal)
        .onAppear {
            for index in offsets.indices {
                let offset = index - 4
                offsets[index] = CGSize(width: CGFloat(offset) * -40, height: CGFloat(offset * offset * 5))
            }
            // 게임시작 1초 후, 카드 플립과 동시에, 스토리 표시
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isShowingCards = true
                isShowingStoryView = true
            }
        }
        .fullScreenCover(isPresented: $isShowingStoryView) {
            StoryView(introName: round[gameState.currentBossIndex + 1].title, finalText: round[gameState.currentBossIndex + 1].notion)
        }
    }
}
