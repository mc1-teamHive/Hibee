//
//  CardView.swift
//  Practice
//
//  Created by 235 on 2023/03/24.
//

import SwiftUI

struct CardView: View {
    @State private var cardFlip = false
    @State private var degrees : Double = 0
    private var cardColorList : [Color] = [.red, .green, .blue, .brown, .orange]
    private var card2list : [Color] = [.cyan, .yellow, .purple, .pink, .indigo]
    @State private var devisewidth : Double = UIScreen.main.bounds.size.width
    @State private var deviseheight : Double = UIScreen.main.bounds.size.height
    var body: some View{
        ZStack{
                ForEach(Array(cardColorList.enumerated()), id: \.1){ (i, color) in
                    RoundedRectangle(cornerRadius: 30).frame(width: devisewidth / 5 ,height: deviseheight / 4)
                        .offset(x: ((Double(i) + 0.7) * 100), y: -100).rotationEffect(.degrees(Double(i) * 6))
                        .foregroundColor(color).onTapGesture{
                        self.cardFlip.toggle()
                        }
                        .fullScreenCover(isPresented: self.$cardFlip){ //sheet에 popView가 뜨면서 나타날때 degree를 바꿔서 돌아가게함
                            ZStack{
                                VStack{
                                    QuizView(cardFlip: $cardFlip)
                                        .rotation3DEffect(
                                    .degrees(degrees),
                                    axis: (x: 0, y: 1, z: 0),
                                    anchor: .center,
                                    perspective: 1
                                ).onAppear{
                                    withAnimation{
                                        //180도가 좋을 것 같아요!
                                        self.degrees += 360
                                    }
                                }}
                            }.background(BackgroundBlurView())
                        }
                }
                ForEach(Array(card2list.enumerated()), id: \.0){ i, color in
                    RoundedRectangle(cornerRadius: 30).frame(width: devisewidth / 5 ,height: deviseheight / 4)
                        .offset(x: CGFloat((i+1) * -100), y: -100).rotationEffect(.degrees(-Double(i * 6)))
                        .foregroundColor(color).onTapGesture{
                    
                        self.cardFlip.toggle()

                        }.sheet(isPresented: self.$cardFlip){
                            ZStack{
                                VStack{
                                        QuizView(cardFlip: $cardFlip).rotation3DEffect(
                                            .degrees(degrees),
                                            axis: (x: 0, y: 1, z: 0),
                                            anchor: .center,
                                            perspective: 1
                                        ).onAppear{
                                            withAnimation{
                                                //180도가 좋을 것 같아요!
                                                self.degrees += 360
                                            }
                                        }
               }
                            }.background(BackgroundBlurView())}
                }
        }}
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        DispatchQueue.main.async {
            //색상 4A5B6D 0.7 가능?
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
