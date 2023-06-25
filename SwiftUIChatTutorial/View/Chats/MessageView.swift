//
//  MessageView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import SwiftUI
import Kingfisher

struct MessageView: View {
    
    let viewModel: MessageViewModel
    
    var body: some View {
        HStack {
            if viewModel.isFromCurrentUser {
                
                Spacer()
                
                Text(viewModel.message.text)
                    .padding(12)
                    .background(Color.blue)
                    .font(.system(size: 15))
                    .clipShape(ChatBubble(isFromCurrentUser: viewModel.isFromCurrentUser))
                    .foregroundColor(.white)
                    .padding(.leading, 100)
                    .padding(.horizontal)
                
            } else {
                HStack(alignment: .bottom) {
                    KFImage(viewModel.profileImageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(Circle())
                    
                    Text(viewModel.message.text)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .font(.system(size: 15))
                        .clipShape(ChatBubble(isFromCurrentUser: viewModel.isFromCurrentUser))
                        .foregroundColor(.black)
                }
                .padding(.horizontal)
                .padding(.trailing, 80)
                
                Spacer()
            }
        }
    }
}
