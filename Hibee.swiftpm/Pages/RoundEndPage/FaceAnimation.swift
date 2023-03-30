import SwiftUI
struct FaceAnimation: View {
    @State private var isRotating = -10.0
    @State private var isRotating1 = +10.0
    private let teamHive: [String] = ["jamie", "yerimee", "caesar"]
    private let teamHive1: [String] = ["Nova", "sunday", "hajime"]
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                HStack(spacing: 80) {
                    ForEach(teamHive.indices, id: \.self){ index in
                        Image(teamHive[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / CGFloat(teamHive.count + 4) * 1.7, height: geometry.size.height)
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
                                }
                            }
                    }
                }
                HStack(spacing: 80) {
                    ForEach(teamHive1.indices, id: \.self){ index in
                        Image(teamHive1[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width / CGFloat(teamHive1.count + 4) * 1.7, height: geometry.size.height)
                            .zIndex(-Double(index))
                            .rotationEffect(.degrees(isRotating1))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                    withAnimation(
                                        Animation.easeInOut(duration: 0.5)
                                            .delay(0.001)
                                            .repeatForever(autoreverses: true)
                                    ) {
                                        isRotating1 = -30.0
                                    }
                                    //
                                }
                            }
                    }
                }.offset(x: 200)
            }
        }
    }
}

struct FaceAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FaceAnimation()
    }
}
