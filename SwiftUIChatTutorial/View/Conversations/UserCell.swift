//
//  UserCell.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 19/06/2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                
                Image("pikachu")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Eddie Brock")
                        .applyFont(with: .body)
                    
                    Text("This is some test message for now...")
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

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
