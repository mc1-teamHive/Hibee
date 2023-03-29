//
//  SwiftUIView.swift
//  
//
//  Created by Ha Jong Myeong on 2023/03/28.
//

import SwiftUI

struct RoundEndView: View {
    @State private var isButtonActive = false
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 100)
            Text("YOU WIN!")
                .endingTextStyle()
            NavigationView {
                VStack(spacing: 0) {
                    Spacer()
                    Button("Go Next") {
                        // action when press buttons
                        isButtonActive = true
                        // need reset games func
                    }
                    .buttonStyle(GrayButtonEndingStyle())
                    .padding(.bottom, 100)
                    NavigationLink(destination: GameView(), isActive: $isButtonActive){
                        EmptyView()
                    }
                }
            }.navigationViewStyle(StackNavigationViewStyle())
            Image(uiImage: UIImage(named: "ending.png")!)
            Spacer()
                .frame(height: 50)
        }
    }
}

extension Text {
    func endingTextStyle() -> Text {
        self.font(.system(size: 80, weight: Font.Weight.bold))
    }
}

struct GrayButtonEndingStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 50, weight: Font.Weight.bold))
            .padding([.leading, .trailing], 150)
            .padding([.top, .bottom], 40)
            .background(Color(red: 74/255, green: 92/255, blue: 109/255))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

