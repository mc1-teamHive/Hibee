import SwiftUI

struct CardImage: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    @Binding var offset: CGSize
    @Binding var isToggled: Bool
    @State private var isTouched = false
    @State private var isCardClicked = false
    @State private var cardDegrees: Double = 0
    
    // 카드 내용물 뷰
    private var cardContent: some View {
        ZStack {
            if !isToggled {
                // 카드가 뒤집어지지 않은 경우
                Image("Card(B)")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 12)
                    .frame(width: width - 10, height: height - 10)
                    .shadow(color: Color(red: 0.29, green: 0.36, blue: 0.43).opacity(0.15), radius: 5, x: 0, y: 0)
            } else {
                // 카드가 뒤집어진 경우
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: width, height: height)
                    .shadow(color: Color(red: 0.29, green: 0.36, blue: 0.43).opacity(0.15), radius: 5, x: 0, y: 0)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 10)
                    .frame(width: width - 10, height: height - 10)
            }
        }
    }

    var body: some View {
        cardContent
            // 3D 회전 효과 적용
            .rotation3DEffect(Angle(degrees: -degree), axis: (x: 0, y: 0, z: -1))
            // 오프셋 적용
            .offset(offset)
            // 탭 제스처 처리
            .onTapGesture {
                if !isCardClicked {
                    // 카드 뒤집기 애니메이션 실행
                    withAnimation(.spring()) {
                        isToggled = true
                    }
                    // 퀴즈 뷰 표시
                    isTouched = true
                    // 카드 클릭 상태 업데이트
                    isCardClicked = true
                }
            }
            // 퀴즈 뷰 전체 화면 표시
            .fullScreenCover(isPresented: self.$isTouched) {
                ZStack {
                    VStack {
                        QuizView(isPresented: self.$isTouched)
                            .rotation3DEffect(
                                .degrees(cardDegrees),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .center,
                                perspective: 1
                            )
                            .onAppear {
                                // 퀴즈 뷰 회전 애니메이션
                                withAnimation {
                                    self.cardDegrees += 360
                                }
                            }
                    }
                }
                // 배경 블러 뷰
                .background(BackgroundBlurView(isTouched: self.$isTouched).ignoresSafeArea())
            }
    }

}

struct BackgroundBlurView: UIViewRepresentable {
    @Binding var isTouched: Bool
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        view.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.dismiss)))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject {
        var parent: BackgroundBlurView
        
        init(_ parent: BackgroundBlurView) {
            self.parent = parent
        }
        
        @objc func dismiss() {
            parent.isTouched = false
        }
    }
}
