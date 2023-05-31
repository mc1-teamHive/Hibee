import SwiftUI
import AVFoundation

// 랜딩 페이지 뷰 구조체
struct LandingPageView: View {
@State private var clickCount = 0
@State private var isCardFlipViewActive = false
@State private var showStoryView = false
@State var player: AVAudioPlayer?

    var body: some View {
        NavigationView {
            ZStack {
                // 배경 이미지
                Image("backgrounds_landing")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                    .onAppear {
                        guard let path = Bundle.main.path(forResource: "Main", ofType: "mp3") else { return }
                        let url = URL(fileURLWithPath: path)
                        do {
                            player = try AVAudioPlayer(contentsOf: url)
                        } catch {
                            print("error")
                        }
                        player?.play()
                    }
                VStack(spacing: 0) {
                    Spacer()
                    
                    // 시작 버튼
                    Button("Start") {
                        clickCount += 1
                        if clickCount == 1 {
                            showStoryView = true
                        } else if clickCount == 2 {
                            player?.stop()
                            isCardFlipViewActive = true
                        }
                    }
                    .buttonStyle(GrayButton())
                    .padding(.bottom, 50)
                    
                    // 네비게이션 링크
                    NavigationLink(destination: GameView(), isActive: $isCardFlipViewActive) {
                        EmptyView()
                    }
                }
            }
            // 전체 화면 커버
            .fullScreenCover(isPresented: $showStoryView, content: {
                StoryView(introName: round[0].title, finalText: round[0].notion)
            })
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

// 회색 버튼 스타일 구조체
struct GrayButton: ButtonStyle {
func makeBody(configuration: Configuration) -> some View {
configuration.label
.padding([.leading, .trailing], 100)
.padding([.top, .bottom], 20)
.font(.system(size: 35, weight: .bold))
.background(Color(red: 70/255, green: 13/255, blue: 22/255))
.foregroundColor(.white)
.clipShape(Capsule())
.scaleEffect(configuration.isPressed ? 1.2 : 1)
.animation(.easeOut(duration: 0.2), value: configuration.isPressed)
}
}
