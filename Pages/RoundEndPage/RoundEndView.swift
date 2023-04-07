import SwiftUI

// 라운드 종료 뷰 구조체
struct RoundEndView: View {
    @EnvironmentObject var gameState: GameState
    @State private var isButtonActive = false
    var body: some View {
        VStack {
            // 텍스트 "YOU WIN!"
            Text("YOU WIN!")
                .endingTextStyle()
                .padding(.top, 200)
            
            VStack(spacing: 0) {
                // 다음으로 이동 버튼
                Button("Go Next") {
                    isButtonActive = true
                    gameState.moveToNextBoss()
                    gameState.isRoundEnd = false
                }
                .buttonStyle(GrayButtonEndingStyle())
                .padding(.top, 15)
                
                // 네비게이션 링크
                NavigationLink(destination: GameView(), isActive: $isButtonActive) {
                    EmptyView()
                }
            }
            
            FaceAnimation()
            Spacer()
        }
        .background(Image("blurback").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
    }
}

// 텍스트 스타일 확장
extension Text {
func endingTextStyle() -> Text {
self.font(.system(size: 100, weight: Font.Weight.bold))
}
}

// 회색 버튼 스타일 구조체
struct GrayButtonEndingStyle: ButtonStyle {
func makeBody(configuration: Configuration) -> some View {
configuration.label
.font(.system(size: 30, weight: Font.Weight.bold))
.padding([.leading, .trailing], 100)
.padding([.top, .bottom], 20)
.background(Color(red: 74/255, green: 92/255, blue: 109/255))
.foregroundColor(.white)
.clipShape(Capsule())
.scaleEffect(configuration.isPressed ? 1.2 : 1)
.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
}
}
