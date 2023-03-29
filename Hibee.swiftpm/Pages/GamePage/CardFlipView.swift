// CardFlipView.swift
// Hibee
// Created by Hibee on 2023/03/25.

import SwiftUI
//
//<<<<<<< HEAD
//// MARK: Card Front View
//struct CardFront: View {
//    let width: CGFloat
//    let height: CGFloat
//    let num: Int
//    let cardColors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .blue, .yellow, .purple, .orange]
//    @Binding var degree: Double
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 20)
//                .fill(cardColors[num % cardColors.count])
//                .frame(width: width, height: height)
//                .shadow(color: .gray, radius: 2, x: 0, y: 0)
//        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
//    }
//}
//
//// MARK: Card Back View
//struct CardBack: View {
//    let width: CGFloat
//    let height: CGFloat
//    @Binding var degree: Double
//    var body: some View {
//        ZStack {
//            RoundedRectangle(cornerRadius: 20)
//                .stroke(.gray.opacity(0.7), lineWidth: 3)
//                .frame(width: width, height: height)
//
//            RoundedRectangle(cornerRadius: 20)
//                .foregroundColor(.clear)
//            Image(uiImage: UIImage(named: "cards.png")!)
//                .frame(width: width, height: height)
//                .shadow(color: .gray, radius: 2, x: 0, y: 0)
//        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
//    }
//}
//
//// MARK: Card Flip View
//struct CardFlipView: View {
//    @State private var backDegrees = Array(repeating: 0.0, count: 10)
//    @State private var frontDegrees = Array(repeating: -90.0, count: 10)
//    @State private var isFlipped = Array(repeating: false, count: 10)
//    @State private var cardFlip = false
//    @State private var degrees: Double = 0
//    let width: CGFloat = 200
//    let height: CGFloat = 300
//    let durationAndDelay: CGFloat = 0.3
//    func flipCard(_ num: Int) {
//        if isFlipped[num] == false{
//            isFlipped[num] = true
//            withAnimation(.linear(duration: Double(durationAndDelay))) {
//                backDegrees[num] = 90
//            }
//            withAnimation(.linear(duration: Double(durationAndDelay)).delay(Double(durationAndDelay))) {
//                frontDegrees[num] = 0
//            }
//        }
//    }
//
//    var body: some View {
//        HStack(spacing: -10) {
//            ForEach(0..<10) {
//                num in
//                ZStack {
//                    CardFront(width: width, height: height, num: num, degree: $frontDegrees[num])
//                    CardBack(width: width, height: height, degree: $backDegrees[num])
//                }.onTapGesture {
//                    if isFlipped[num]==false{
//                        flipCard(num)
//                        self.cardFlip.toggle()}
//                }.fullScreenCover(isPresented: self.$cardFlip) {
//                    ZStack {
//                        VStack {
//                            QuizView(cardFlip: $cardFlip)
//                                .rotation3DEffect(
//                                    .degrees(degrees),
//                                    axis: (x: 0, y: 1, z: 0),
//                                    anchor: .center,
//                                    perspective: 1
//                                )
//                                .onAppear {
//                                    withAnimation {
//                                        self.degrees += 360
//                                    }
//                                }
//                        }
//                    }.background(BackgroundBlurView())
//                }
//                .frame(width: 150, height: 400)
//            }
//            .navigationBarBackButtonHidden(true)
//        }
//    }
//
//    struct BackgroundBlurView: UIViewRepresentable {
//        func makeUIView(context: Context) -> some UIView {
//            let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//            DispatchQueue.main.async {
//                view.superview?.superview?.backgroundColor = .clear
//            }
//            return view
//        }
//        func updateUIView(_ uiView: UIViewType, context: Context) {}
//=======
struct CardFlipView: View {
    private let nCardsInPack = 10
    @State private var degrees: [Double] = [-40, -30, -25, -15, -5, 5, 15, 25, 30, 40].map { $0 }
    @State private var yLocation: [Double] = [80, 50, 20, -8, -25, -25, -8, 20, 50, 80]
    @State private var xLocation: [Double] = [270, 190, 120, 70, 10, -30, -70, -100, -160, -230]
    @State private var offsets: [CGSize] = Array(repeating: .zero, count: 10)
    @State private var isToggle: [Bool] = Array(repeating: false, count: 10)
    private let cardWidth: CGFloat = 215
    private let cardHeight: CGFloat = 300
    
    @State private var isShowingCards = false
    
    var body: some View {
        
        HStack(spacing: 0) {
            ForEach(degrees.indices, id: \.self) { index in
                CardImage(width: cardWidth, height: cardHeight, degree: $degrees[index], offset: $offsets[index], isToggled: $isToggle[index])
                    .offset(x: xLocation[index], y: yLocation[index])
                    .opacity(isShowingCards ? 1 : 0)
                    .animation(Animation.linear.delay(Double(index) * 0.08), value: isShowingCards)
            }
            .padding(.bottom, 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .padding(.horizontal)
        .onAppear {
            for index in offsets.indices {
                let offset = index - 4
                offsets[index] = CGSize(width: CGFloat(offset) * -40, height: CGFloat(offset * offset * 5))
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isShowingCards = true
                
            }}}
    
   
}
