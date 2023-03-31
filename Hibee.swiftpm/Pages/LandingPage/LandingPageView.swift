//
//  LandingPageView.swift
//  Hibee
//
//  Created by Ha Jong Myeong on 2023/03/26.
//
import SwiftUI
import AVFoundation
struct LandingPageView: View {
    @State private var clickCount = 0
    @State private var isCardFlipViewActive = false
    @State private var showStoryView = false
    @State var player : AVAudioPlayer?
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgrounds_landing")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all).onAppear{
                        guard let path = Bundle.main.path(forResource: "Main", ofType: "mp3") else {return}
                        let url = URL(fileURLWithPath: path)
                        do{
                            player = try AVAudioPlayer(contentsOf: url)
                        }catch{
                            print("error")
                        }
                        player?.play()
                    }
                VStack(spacing: 0) {
                    Spacer()
                    Button("Start") {
                        clickCount += 1
                        if clickCount == 1 {
                            showStoryView = true
                        }else if clickCount == 2 {
                            player?.stop()

                            isCardFlipViewActive = true
                        }
                    }
                    .buttonStyle(GrayButton())
                    .padding(.bottom, 50)
                    NavigationLink(destination: GameView(), isActive: $isCardFlipViewActive) {
                        EmptyView()
                    }
                }
            }
            .fullScreenCover(isPresented: $showStoryView, content: {
                StoryView(introName: round[0].title, finalText: round[0].notion)
            })
//            .background(
//                NavigationLink(destination: GameView(), isActive: $isCardFlipViewActive) {
//                    EmptyView()
//                }
//            )
//
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

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

struct LandingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().previewInterfaceOrientation(.landscapeLeft)
    }
}
