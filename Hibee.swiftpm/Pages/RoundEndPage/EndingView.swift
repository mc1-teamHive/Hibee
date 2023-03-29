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
        Spacer()
        Image(uiImage: UIImage(named: "emoji_v.svg")!)
        Text("그대에게 주어지는 합격목걸이")
            .endingViewTextStyle()
        Image(uiImage: UIImage(named: "ending.png")!)
        Spacer()
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
extension Text {
    func endingViewTextStyle() -> Text {
        self.font(.system(size: 80, weight: Font.Weight.bold))
    }
}
