//
//  MessageView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import SwiftUI

struct MessageView: View {
    
    var isFromCurrentUser: Bool
    var messageText: String
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                
                Spacer()
                
                Text(messageText)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
                
            } else {
                HStack(alignment: .bottom) {
                    Image("pikachu")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(messageText)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            
            MessageView(isFromCurrentUser: true, messageText: "I love you")
            
            MessageView(isFromCurrentUser: false, messageText: "Em nghĩ chúng ta chỉ là bạn")
        }
    }
}
