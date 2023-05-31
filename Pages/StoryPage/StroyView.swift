import SwiftUI

// 스토리 뷰 구조체
struct StoryView: View {
    var introName: String
    var finalText: String
    @State var isTouched: Bool = false
    @State var text: String = ""
    @State var currentIndex: Int = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            // 배경 이미지
            Image("background_intro")
            
            // 스토리 이미지
            Image(introName)
                .offset(y: -400)
            
            // 텍스트
            Text(text)
                .font(.custom(.oneMobilePop, size: 35))
                .frame(maxWidth: 700, alignment: .center)
                .foregroundColor(.brown)
                .padding(.top, 50)
                .foregroundColor(.white)
                .animation(
                    Animation.easeOut(duration: 1).delay(2),
                    value: text
                )
        }
        .multilineTextAlignment(.center)
        .background(
            ZStack {
                // 배경 블러 뷰
                BackgroundBlurView(isTouched: self.$isTouched)
                    .ignoresSafeArea()
                
                // 검은색 반투명 배경
                Color.black.opacity(isTouched ? 0.5 : 0)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        isTouched = false
                    }
            }
        )
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        .onAppear {
            // 글자 하나씩 나타내기
            let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
                withAnimation {
                    if currentIndex < finalText.count {
                        text.append(finalText[finalText.index(finalText.startIndex, offsetBy: currentIndex)])
                        currentIndex += 1
                    } else {
                        timer.invalidate()
                    }
                }
            }
            timer.fire()
        }
    }
}
