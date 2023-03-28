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
        Text("✌🏻")
            .emojiTextStyle()
        Text("그대에게 주어지는 합격목걸이")
            .endingTextStyle()
        Image(uiImage: UIImage(named: "ending.png")!)
        Spacer()
    }
}

extension Text {
    func emojiTextStyle() -> Text {
        self.font(.largeTitle)
    }
}

struct EndingView_Previews: PreviewProvider {
    static var previews: some View {
        EndingView()
    }
}
