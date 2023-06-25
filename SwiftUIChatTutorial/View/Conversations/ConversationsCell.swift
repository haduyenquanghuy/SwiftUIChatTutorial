//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 19/06/2023.
//

import SwiftUI
import Kingfisher

struct ConversationsCell: View {
    
    @ObservedObject var viewModel: ConversationCellViewModel
    
    var body: some View {
        if let user = viewModel.message.user {
            NavigationLink(destination: ChatsView(user: user)) {
                VStack {
                    HStack {
                        
                        KFImage(viewModel.chatPartnerProfileImageUrl)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(viewModel.fullname)
                                .applyFont(with: .body)
                            
                            Text(viewModel.message.text)
                                .applyFont(with: .caption1)
                        }
                        .foregroundColor(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    Divider()
                }
                .padding(.top)
            }
        }
    }
}
