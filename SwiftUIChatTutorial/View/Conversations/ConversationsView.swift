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
    @State private var selectedUser: User?
    @ObservedObject var viewModel = ConversationsViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let user = selectedUser {
                NavigationLink(destination: ChatsView(user: user), isActive: $showChatView) {}
            }
            
            ScrollView {
                VStack(alignment: .leading) {

                    ForEach(viewModel.recentMessages) { message in
                        
                        ConversationsCell(viewModel: ConversationCellViewModel(message))
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
                NewMessageView(showChatView: $showChatView, user: $selectedUser)
            }
        }
        .navigationTitle("Chats")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            viewModel.fetchRecentMessages()
        }
    }
}

struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}
