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
    @State var isTouched : Bool = false
    @State private var degrees: Double = 0
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
                withAnimation(.spring()){
                    isToggled = true
                }
                isTouched = true
            }
            .fullScreenCover(isPresented: self.$isTouched) {
                ZStack {
                    VStack {
                        QuizView(isPresented: self.$isTouched)
                            .rotation3DEffect(
                                .degrees(degrees),
                                axis: (x: 0, y: 1, z: 0),
                                anchor: .center,
                                perspective: 1
                            )
                            .onAppear {
                                withAnimation {
                                    self.degrees += 360
                                }
                            }
                    }
                }
                .background(BackgroundBlurView(isTouched: self.$isTouched).ignoresSafeArea())
            }
        
    }
}


struct CardImage_Previews: PreviewProvider {
    static var previews: some View {
        CardImage(width: 215, height: 300, degree: .constant(0), offset: .constant(.zero), isToggled: .constant(false))
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    @Binding var isTouched: Bool
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterialDark))
        view.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.dismiss)))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    final class Coordinator: NSObject {
        var parent: BackgroundBlurView
        
        init(_ parent: BackgroundBlurView) {
            self.parent = parent
        }
        
        @objc func dismiss() {
            parent.isTouched = false
        }
    }
}
