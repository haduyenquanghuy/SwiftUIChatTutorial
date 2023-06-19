//
//  ConversationsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct ConversationsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                VStack(alignment: .leading) {
                    

                    ForEach(0 ... 10, id: \.self) { _ in
                        ConversationsCell()
                           
                    }
                }
            }
            
            Button(action: {
                print("Show user list sheet...")
            }) {
              Image(systemName: "square.and.pencil")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .padding()
            }
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
        }
        .navigationTitle("Chats")
        .navigationBarTitleDisplayMode(.large)
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
