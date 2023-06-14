//
//  CustomTextField.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 14/06/2023.
//

import SwiftUI

struct CustomTextField: View {
    
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: 16) {
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.init(uiColor: .gray))
                
                if isSecureField {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }
            
            Divider()
                .background(Color(uiColor: .darkGray))
        }
    }
}
