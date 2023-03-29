import SwiftUI


struct RoundedRectProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 14)
                .frame(width: 250, height: 25)
                .foregroundColor(.gray.opacity(0.25))
            RoundedRectangle(cornerRadius: 14)
                .frame(width: CGFloat(configuration.fractionCompleted ?? 0) * 250, height: 25)
        }
        .padding()
    }
}
 

struct ContentView: View {
    
    @State private var healthPoint : Double = 100.0
    @State private var progressViewColor : Color = .green
    
    var body: some View {
        VStack {                                    //총 HP
            ProgressView("HP", value: healthPoint, total: 100)
                .progressViewStyle(RoundedRectProgressViewStyle())
                .foregroundColor(progressViewColor)
            Button("문제 맞추면...") {
                if healthPoint > 0 {
                    healthPoint -= 20
                }
                if healthPoint < 30 {
                    progressViewColor = .red
                }
                else if healthPoint < 50 {
                    progressViewColor = .orange
                }
                else if healthPoint < 70 {
                    progressViewColor = .yellow
                }
            }
        }
        .padding()
    }
}

