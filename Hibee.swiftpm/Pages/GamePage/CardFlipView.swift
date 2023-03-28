//
//  CardFlipView.swift
//  Hibee
//
//  Created by Hibee on 2023/03/25.
//

import SwiftUI

// MARK: Card Front View
struct CardFront : View {
    let width : CGFloat
    let height : CGFloat
    let num : Int
    let cardColors: [Color] = [.red, .green, .blue, .yellow, .purple, .orange, .blue, .yellow, .purple, .orange]
    
    @Binding var degree : Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cardColors[num % cardColors.count])
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
            
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

// MARK: Card Back View
struct CardBack : View {
    //MARK: Variables
    let width : CGFloat
    let height : CGFloat
    @Binding var degree : Double
    
    var body: some View {
        ZStack {RoundedRectangle(cornerRadius: 20)
                .stroke(.gray.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)
            
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.clear)
            Image(uiImage: UIImage(named: "cards.png")!)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)
        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
        
    }
}

// MARK: Card Flip View
struct CardFlipView: View {
    // MARK: Variables
    @State var backDegrees = Array(repeating: 0.0, count: 10)
    @State var frontDegrees = Array(repeating: -90.0, count: 10)
    @State var isFlipped = Array(repeating: true, count: 10)
    let width : CGFloat = 200
    let height : CGFloat = 300
    let durationAndDelay : CGFloat = 0.3
    
    // MARK: Flip Card Function
    func flipCard(_ num: Int) {
        if isFlipped[num] {
            isFlipped[num] = true
            withAnimation(.linear(duration: durationAndDelay)){
                backDegrees[num] = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegrees[num] = 0
            }
        }
    }
    
    // MARK: View Body
    var body: some View {
        HStack(spacing: -10) {
            ForEach(0..<10) { num in
                        ZStack {
                            CardFront(width: width, height: height, num: num, degree: $frontDegrees[num])
                            CardBack(width: width, height: height, degree: $backDegrees[num])
                        }.onTapGesture {
                            flipCard(num)
                        }
                        .frame(width: 150, height: 400)
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
