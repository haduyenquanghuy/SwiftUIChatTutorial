//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 19/06/2023.
//

import SwiftUI
import Kingfisher

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        VStack {
            HStack {
                
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.username)
                        .applyFont(with: .body)
                    
                    Text(user.fullname)
                        .applyFont(with: .caption1)
                }
                .foregroundColor(.black)
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .padding(.top)
    }
}
