//
//  SwiftUIView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/28.
//

import SwiftUI

struct EndingView: View {
    @State private var isButtonActive = false
    @State private var isRotating = -10.0
    var body: some View {
        VStack {
            //            Spacer()
            //            Image("victory")
            //                .padding(.top,100)
            Button {
                isButtonActive = true
            } label: {
                Image("victory")
                    .padding(.top,100)
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
            
            Text("그대에게 주어지는 합격목걸이")
                .font(.system(size: 80, weight: .bold))
                .padding(.top,50)
            FaceAnimation()
            Spacer()
        }
        .background(Image("blurback").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
        .fullScreenCover(isPresented: $isButtonActive, content: {
                StoryView(introName: round[4].title, finalText: round[4].notion)
            })
    }
}


struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
