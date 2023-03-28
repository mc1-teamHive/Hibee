import SwiftUI

struct QuizView: View {
    @Binding var cardFlip : Bool
    @State var round : Int = 1
    @State private var answerO = false
    @State private var btnclick = false
    let randomInt = Int.random(in: 0..<quizs.count)
//    func answercheck() -> some View{
//        if
//    }
    var body: some View {
        HStack(){
            VStack(){
                Button(action: {
                    self.cardFlip.toggle()
                }){
                    Image(systemName: "xmark.circle").resizable().frame(width: 40,height: 40).foregroundColor(.red).padding()
                }
                Spacer()
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 30).fill(Color.white).frame(width: 450   , height: 550)
                VStack{
                    Image("Honey").resizable().frame(width: 450, height: 450)
                    Text("Round\(round)").foregroundColor(.gray)
                    Text("\(quizs[randomInt].titleQuestion)").font(.system(size:40, weight: .semibold, design: .serif)).frame(width: 400, height : 70).minimumScaleFactor(0.5)}
                
            }.frame(alignment: .leading)
            VStack{
                Button(action: {
                    
                    if(quizs[randomInt].answernum == 1){
                        answerO = true
                    }else{answerO = false}
                    
                    btnclick = true
                }){
                    RoundedRectangle(cornerRadius: 100).fill(Color.black).opacity(0.5).frame(width: 400, height: 100).overlay(Text("\(quizs[randomInt].example1)"))
                }
                
                Button(action: {
                    if(quizs[randomInt].answernum == 2){
                        answerO = true
                    }else{answerO = false}
                    btnclick = true
                    
                }){
                    RoundedRectangle(cornerRadius: 100).fill(Color.black).opacity(0.5).frame(width: 400, height: 100).overlay(Text("\(quizs[randomInt].example2)"))}
                Button(action: {
                    if(quizs[randomInt].answernum == 3){
                        answerO = true
                    }else{answerO = false}
                    btnclick = true
                }){
                    RoundedRectangle(cornerRadius: 100).fill(Color.black).opacity(0.5).frame(width: 400, height: 100).overlay(Text("\(quizs[randomInt].example3)"))}
               
            }

          
            
        }.sheet(isPresented: $btnclick){
            switch self.answerO {
            case true :
                VStack{
                    Text("정답입니다").font(.system(size: 80, weight: .bold)).padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                    Text(quizs[randomInt].description).font(.system(size: 30, weight: .medium   ))
                    Spacer()
                    Image("Caesar").resizable().frame(width: 400,height: 400)
                }
            case false:
                VStack{
                    Text("오답입니다.").font(.system(size: 80, weight: .bold)).padding(EdgeInsets(top: 100, leading: 0, bottom: 50, trailing: 0))
                    Text(quizs[randomInt].description).font(.system(size: 30, weight: .medium)).frame(maxWidth: .infinity, maxHeight: 200).lineLimit(5)
                    Spacer()
                    Image("Wrongperson").resizable().frame(width: 400,height: 400)
                }
            }
        }
    }
}

struct FittingFontSizeModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 100))
      .minimumScaleFactor(0.001)
  }
}
