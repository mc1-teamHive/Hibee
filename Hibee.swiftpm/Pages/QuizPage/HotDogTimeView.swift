import SwiftUI
struct HotDogTimeView: View {
    var body: some View {
        VStack{
            Text("핫도그 타임")
                .font(.system(size: 80, weight: .bold))
                .padding(.top, 100)
                .padding(.bottom, 50)
            Text("목숨이 하나 남으셨군요? 저는 핫도그를 좋아하는 시저라고 합니다 문제를 맞추시면 목숨과도 같은 핫도그를 드립니다")
                .font(.system(size: 30, weight: .medium))
                .frame(maxWidth: .infinity, maxHeight: 200)
                .lineLimit(3)
            Spacer()
            Image("wrong_caesar")
                .resizable()
                .frame(width: 400, height: 400)
        }
    }
}

struct HodDogTimeView_Previews: PreviewProvider {
    static var previews: some View {
        HotDogTimeView()
    }
}
