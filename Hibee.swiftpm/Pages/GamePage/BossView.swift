//
//  SwiftUIView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/28.
//
import SwiftUI

// set Boss Info
struct Boss{
    let names : [String] = ["Issac", "Gommin", "Lingo"]
    let healths : [Int] = [3, 4, 6]
}

struct BossView: View {
    let boss = Boss()
    var body: some View {
        Image(uiImage: UIImage(named: "Issac_1.png")!)
            .frame(height: 230)
            .padding(.bottom, 50)
    }
}

struct BossView_Previews: PreviewProvider {
    static var previews: some View {
        BossView()
    }
}
