//
//  SwiftUIView.swift
//
//
//  Created by Ha Jong Myeong on 2023/03/28.
//
import SwiftUI



struct BossView: View {
    var body: some View {
        Image("Isaac_1").resizable()
            .frame(width: 500, height: 500)
//            .padding(.bottom, -50)
    }
}

struct BossView_Previews: PreviewProvider {
    static var previews: some View {
        BossView()
    }
}
