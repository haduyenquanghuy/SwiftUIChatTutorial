//
//  TitleModifier.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    
    
    let fontType: TitleFontType
    
    func body(content: Content) -> some View {
        content
            .font(fontType.font)
    }
}

extension View {
    
    func applyFont(with font: TitleFontType) -> some View {
        
        self.modifier(TitleModifier(fontType: font))
    }
}

enum TitleFontType {
    
    static var fontName = "Avenir Next"
    
    case largeTitle
    case title1
    case title2
    case title3
    case headline
    case subHeadline
    case body
    case caption1
    case caption2
    
    var font: Font {
        
        switch self {
            case .largeTitle:
                return .custom(Self.fontName, size: 34)
                    .weight(.bold)
                
            case .title1:
                return .custom(Self.fontName, size: 28)
                    .weight(.bold)
                
            case .title2:
                return .custom(Self.fontName, size: 22)
                    .weight(.bold)
                
            case .title3:
                return .custom(Self.fontName, size: 20)
                    .weight(.semibold)
                
            case .headline:
                return .custom(Self.fontName, size: 17)
                    .weight(.semibold)
                    .italic()
                
            case .subHeadline:
                return .custom(Self.fontName, size: 15)
                    .weight(.semibold)
                
            case .body:
                return .custom(Self.fontName, size: 17)
                    .weight(.semibold)
                
            case .caption1:
                return .custom(Self.fontName, size: 12)
                    .weight(.medium)
                
            case .caption2:
                return .custom(Self.fontName, size: 11)
                    .weight(.semibold)
        }
    }
    
}
