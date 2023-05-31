import SwiftUI

// 얼굴 애니메이션 뷰 구조체
struct FaceAnimation: View {
    // 회전 효과 변수
    @State private var rotationAmount = -10.0
    // 이미지 팀 배열
    private let teamHive: [String] = ["jamie", "yerimee", "caesar"]
    private let teamHive1: [String] = ["Nova", "sunday", "hajime"]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                createImageStack(team: teamHive, geometry: geometry, rotationAmount: rotationAmount)
                createImageStack(team: teamHive1, geometry: geometry, rotationAmount: -rotationAmount).offset(x: 200)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(
                        Animation.easeInOut(duration: 0.5)
                            .delay(0.001)
                            .repeatForever(autoreverses: true)
                    ) {
                        rotationAmount = 30.0
                    }
                }
            }
        }
    }
    
    // 팀 이미지 생성
    private func createImageStack(team: [String], geometry: GeometryProxy, rotationAmount: Double) -> some View {
        return HStack(spacing: 80) {
            ForEach(team.indices, id: \.self) { index in
                Image(team[index])
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / CGFloat(team.count + 4) * 1.7, height: geometry.size.height)
                    .zIndex(-Double(index))
                    .rotationEffect(.degrees(rotationAmount))
            }
        }
    }
}
