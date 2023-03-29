//
//  SwiftUIView.swift
//  
//
//  Created by 김예림 on 2023/03/28.
//

import SwiftUI


struct CardImage: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double
    @Binding var offset: CGSize
    @Binding var isToggled: Bool
    
    var body: some View {
        ZStack {
            
            if !isToggled {
                Image("Card(B)")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: width, height: height)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 12)
                    .frame(width: width-10, height: height-10)
                    .shadow(color: Color(red: 0.29, green: 0.36, blue: 0.43).opacity(0.15), radius: 5, x: 0, y: 0)
            }else{
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white)
                    .frame(width: width, height: height)
                    .shadow(color: Color(red: 0.29, green: 0.36, blue: 0.43).opacity(0.15), radius: 5, x: 0, y: 0)
                
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white, lineWidth: 10)
                    .frame(width: width-10, height: height-10)
            }
        
        }.rotation3DEffect(Angle(degrees: -degree), axis: (x: 0, y: 0, z: -1))
            .offset(offset)
            .onTapGesture {
                withAnimation(.spring()) {
                    isToggled = true
                }
            }
    }
}


struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(width: 215, height: 300, degree: .constant(0), offset: .constant(.zero), isToggled: .constant(false))
    }
}

