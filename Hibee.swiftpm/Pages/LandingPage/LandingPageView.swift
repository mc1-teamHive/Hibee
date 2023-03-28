//
//  LandingPageView.swift
//  Hibee
//
//  Created by Ha Jong Myeong on 2023/03/26.
//
import SwiftUI

struct LandingPageView: View {
    @State private var isCardFlipViewActive = false
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Spacer()
                Button("Start") {
                    // action when press buttons
                    isCardFlipViewActive = true
                }
                .buttonStyle(GrayButton())
                .padding(.bottom, 150)

                NavigationLink(destination: GameView(), isActive: $isCardFlipViewActive){
                    EmptyView()
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct GrayButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 74/255, green: 92/255, blue: 109/255))
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
