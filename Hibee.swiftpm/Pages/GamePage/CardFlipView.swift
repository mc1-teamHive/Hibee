// CardFlipView.swift
// Hibee
// Created by Hibee on 2023/03/25.

import SwiftUI
struct CardFlipView: View {
    private let nCardsInPack = 10
    @State private var degrees: [Double] = [-40, -30, -25, -15, -5, 5, 15, 25, 30, 40].map { $0 }
    @State private var yLocation: [Double] = [20, -10, -40, -78, -85, -85, -78, -40, -10, 20]
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
