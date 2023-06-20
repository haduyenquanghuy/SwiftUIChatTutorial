//
//  ConversationsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct ConversationsView: View {
    
    @State private var showNewMessageView = false
    @State private var showChatView = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            NavigationLink(destination: ChatsView(), isActive: $showChatView) {
                
            }
            
            ScrollView {
                VStack(alignment: .leading) {

                    ForEach(0 ... 10, id: \.self) { _ in
                        
                        NavigationLink(destination: ChatsView()) {
                            ConversationsCell()
                        }
                           
                    }
                }
            }
            
            Button(action: {
                showNewMessageView = true
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
            .sheet(isPresented: $showNewMessageView) {
                NewMessageView(showChatView: $showChatView)
            }
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
