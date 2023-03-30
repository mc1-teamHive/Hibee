//
//  SwiftUIView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/28.
//

import SwiftUI

struct EndingView: View {
    @State private var isButtonActive = false
    var body: some View {
        VStack {
//            Spacer()
            Image("victory")
                .padding(.top,100)
            Text("그대에게 주어지는 합격목걸이")
                .font(.system(size: 80, weight: .bold))
                .padding(.top,50)
            FaceAnimation()
            Spacer()
        }.background(Image("blurback").resizable().scaledToFit().frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.all))
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
