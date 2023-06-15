//
//  AddHeaderViewModifier.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct AddHeaderViewModifier: ViewModifier {
    
    var headerTitle: String
    var leading: CGFloat = 0
    
    func body(content: Content) -> some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Text(headerTitle.uppercased())
                    .lineLimit(1)
                    .padding(.horizontal, leading)
                    .applyFont(with: .title3)
                    .foregroundColor(.black.opacity(0.5))
                
                Spacer()
            }
            .background(.clear)
            
            content
                .padding(4)
//                .padding(.top, 0)
        }
    }
}

extension View {
    
    func addHeader(with title: String, leading: CGFloat = 0) -> some View {
        self.modifier(AddHeaderViewModifier(headerTitle: title, leading: leading))
    }
}

struct AddHeaderViewModifier_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Text("Hello world!")
                
            Spacer()
        }
        .background(Color.blue)
        .modifier(AddHeaderViewModifier(headerTitle: "Select your status"))
    }
}
