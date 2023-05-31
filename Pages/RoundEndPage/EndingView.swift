import SwiftUI

// 종료 화면 뷰 구조체
struct EndingView: View {
    // 버튼 활성화 상태 변수
    @State private var isButtonActive = false
    // 회전 효과 변수
    @State private var isRotating = -10.0
    var body: some View {
        VStack {
            // 버튼과 회전 이미지
            Button {
                isButtonActive = true
            } label: {
                Image("victory")
                    .padding(.top, 100)
                    .rotationEffect(.degrees(isRotating))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation(
                                Animation.easeInOut(duration: 0.5)
                                    .delay(0.001)
                                    .repeatForever(autoreverses: true)
                            ) {
                                isRotating = 10.0
                            }
                        }
                    }
            }
            
            // 텍스트 레이블
            Text("그대에게 주어지는 합격목걸이")
                .font(.system(size: 80, weight: .bold))
                .padding(.top, 50)
            FaceAnimation()
            Spacer()
        }
        // 배경 이미지 설정
        .background(Image("blurback").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
        // 전체 화면 커버 표시 설정
        .fullScreenCover(isPresented: $isButtonActive, content: {
            StoryView(introName: round[4].title, finalText: round[4].notion)
        })
    }
}
