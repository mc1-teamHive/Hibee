// CardFlipView.swift
// Hibee
// Created by Hibee on 2023/03/25.

import SwiftUI

// MARK: Card Front View
struct CardFront: View {
    let width: CGFloat
    let height: CGFloat
    let num: Int
    let cardColors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .blue, .yellow, .purple, .orange]
    @Binding var degree: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cardColors[num % cardColors.count])
                .frame(width: width, height: height)
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

// MARK: Card Back View
struct CardBack: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width, height: height)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.clear)
            Image(uiImage: UIImage(named: "card.svg")!)
                .frame(width: width, height: height)
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

// MARK: Card Flip View
struct CardFlipView: View {
    @State private var backDegrees = Array(repeating: 0.0, count: 10)
    @State private var frontDegrees = Array(repeating: -90.0, count: 10)
    @State private var isFlipped = Array(repeating: false, count: 10)
    @State private var cardFlip = false
    @State private var degrees: Double = 0
    let width: CGFloat = 200
    let height: CGFloat = 300
    let durationAndDelay: CGFloat = 0.3
    func flipCard(_ num: Int) {
        if isFlipped[num] == false{
            isFlipped[num] = true
            withAnimation(.linear(duration: Double(durationAndDelay))) {
                backDegrees[num] = 90
            }
            withAnimation(.linear(duration: Double(durationAndDelay)).delay(Double(durationAndDelay))) {
                frontDegrees[num] = 0
            }
        }
    }
    
    var body: some View {
        HStack(spacing: -10) {
            ForEach(0..<10) {
                num in
                ZStack {
                    CardFront(width: width, height: height, num: num, degree: $frontDegrees[num])
                    CardBack(width: width, height: height, degree: $backDegrees[num])
                }.onTapGesture {
                    if isFlipped[num]==false{
                        flipCard(num)
                        self.cardFlip.toggle()}
                }.fullScreenCover(isPresented: self.$cardFlip) {
                    ZStack {
                        VStack {
                            QuizView(cardFlip: $cardFlip)
                                .rotation3DEffect(
                                    .degrees(degrees),
                                    axis: (x: 0, y: 1, z: 0),
                                    anchor: .center,
                                    perspective: 1
                                )
                                .onAppear {
                                    withAnimation {
                                        self.degrees += 360
                                    }
                                }
                        }
                    }.background(BackgroundBlurView())
                }
                .frame(width: 150, height: 400)
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    struct BackgroundBlurView: UIViewRepresentable {
        func makeUIView(context: Context) -> some UIView {
            let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
            DispatchQueue.main.async {
                view.superview?.superview?.backgroundColor = .clear
            }
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) {}
    }
}
