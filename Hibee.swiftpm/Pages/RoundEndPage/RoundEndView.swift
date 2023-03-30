//
//  SwiftUIView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/28.
//

import SwiftUI
struct RoundEndView: View {
    @EnvironmentObject var gameState: GameState
    @State private var isButtonActive = false
    var body: some View {
        VStack{
//            Spacer()
            Text("YOU WIN!")
                .endingTextStyle()
                .padding(.top, 200)
            NavigationView {
                VStack(spacing: 0) {
                    Button("Go Next") {
                        isButtonActive = true
                        gameState.resetLives()
                        gameState.moveToNextBoss()
                    }
                    .buttonStyle(GrayButtonEndingStyle())
                    .padding(.top, 15)
                    NavigationLink(destination: GameView(), isActive: $isButtonActive){
                        EmptyView()
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            FaceAnimation()
            Spacer()
            
        }
    }
}

extension Text {
    func endingTextStyle() -> Text {
        self.font(.system(size: 100, weight: Font.Weight.bold))
    }
}

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

