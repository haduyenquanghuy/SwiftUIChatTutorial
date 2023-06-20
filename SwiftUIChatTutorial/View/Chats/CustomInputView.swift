//
//  CustomInputView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import SwiftUI

struct CustomInputView: View {
    
    @Binding var text: String
    
    var action: () -> Void
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width: UIScreen.main.bounds.width, height: 0.75)
            
            HStack {
                TextField("Message..", text: $text)
                    .textFieldStyle(PlainTextFieldStyle())
                    .font(.body)
                    .frame(minHeight: 30)
                
                Button(action: {
                    action()
                    
                    UIApplication.shared.endEditing()
                    
                }) {
                    Text("Send")
                        .bold()
                        .foregroundColor(.black)
                }
                .padding(.bottom, 8)
                .padding(.horizontal)
            }
        }
    }
}

struct CustomInputView_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputView(text: .constant("I love you")) {
            
        }
    }
}
