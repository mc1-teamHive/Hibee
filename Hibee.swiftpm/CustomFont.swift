//
//  CustomFont.swift
//  Hibee
//
//  Created by 정회승 on 2023/03/31.
//

//
//  CustomFont.swift
//  Hibee
//
//  Created by 김예림 on 2023/03/30.
//

import SwiftUI

enum MyCustomFonts: String, CaseIterable {
    
    //e.g, the fonts below:
    case oneMobilePop = "ONE Mobile POP OTF.otf"
    case poppins = "Poppins-Bold.ttf"
    
    
    var fontName: String { String(self.rawValue.dropLast(4)) }
    var fileExtension: String { String(self.rawValue.suffix(3)) }
}


struct CustomFonts {
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

extension Font {
    static func custom(_ font: MyCustomFonts, size: CGFloat) -> Font {
        custom(font.fontName, size: size)
    }
}
