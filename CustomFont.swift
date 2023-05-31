import SwiftUI

enum MyCustomFonts: String, CaseIterable {
    
    // e.g, the fonts below:
    case oneMobilePop = "ONE Mobile POP OTF.otf"
    
    // 뒤 네글자 제거(ex-.otf, .ttf)
    var fontName: String { String(self.rawValue.dropLast(4)) }
    // 뒤 세글자 가져옴(file extension)
    var fileExtension: String { String(self.rawValue.suffix(3)) }
}

    // 커스텀 폰트 등록에 관한 구조체 선언
struct CustomFonts {
    
    // 폰드 등록
    static func register() {
        MyCustomFonts.allCases.forEach {
            registerFont(fontName: $0.fontName,
                         fontExtension: $0.fileExtension)
        }
    }
    
    private static func registerFont(fontName: String, fontExtension: String) {

        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Couldn't create \(fontName) from data")
            return
        }
        
        var error: Unmanaged<CFError>?
        
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
    
}

// 사용자 지정 글꼴 더 쉽게 사용하기 위한 확장자
extension Font {
    static func custom(_ font: MyCustomFonts, size: CGFloat) -> Font {
        custom(font.fontName, size: size)
    }
}
