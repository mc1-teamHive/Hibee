//
//  SwiftUIView.swift
//  
//
//  Created by 김예림 on 2023/03/30.
//

import SwiftUI

struct StoryView: View {
    var introName: String
    var finalText: String
    @State var isTouched: Bool = false
    @State var text: String = ""
    @State var currentIndex: Int = 0
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Image("background_intro")
            Image(introName)
                .offset(y: -400)
            Text(text)
                .font(.custom(.oneMobilePop, size: 30))
                .foregroundColor(.brown)
                .padding(.top, 50)
                .foregroundColor(.white)
                .animation(
                        Animation.easeOut(duration: 1).delay(2),
                        value: text
                    )        }
        .background(
            ZStack {
                BackgroundBlurView(isTouched: self.$isTouched)
                    .ignoresSafeArea()
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
            let timer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
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



