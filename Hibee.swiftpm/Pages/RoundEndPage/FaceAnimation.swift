
//  SwiftUIView.swift
//
//
//  Created by 김예림 on 2023/03/30.
//
import SwiftUI

struct FaceAnimation: View {
    @State private var isRotating = 0.0
    private let teamHive: [String] = ["jamie", "Nova", "yerimee", "sunday", "caesar", "hajime"]
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: -108) {
                ForEach(teamHive.indices, id: \.self){ index in
                    Image(teamHive[index])
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width / CGFloat(teamHive.count + 1) * 1.7, height: geometry.size.height)
                        .zIndex(-Double(index))
                        .rotationEffect(.degrees(isRotating))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation(
                                    Animation.easeInOut(duration: 0.5)
                                        .delay(0.001)
                                        .repeatForever(autoreverses: true)
                                ) {
                                    isRotating = 30.0
                                }
                                withAnimation(
                                    Animation.easeInOut(duration: 0.5)
                                        .delay(0.1)
                                        .repeatForever(autoreverses: true)
                                ) {
                                    isRotating = 0.0
                                }
                            }
                        }
                }
            }
        }
    }
}

struct FaceAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FaceAnimation()
    }
}
