//
//  ChatsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var messageText = ""
    @ObservedObject var viewModel: ChatViewModel
    private let user: User
    
    init(user: User) {
        self.user = user
        self.viewModel = ChatViewModel(user: user)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        
                        MessageView(viewModel: MessageViewModel(message))
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessages)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(user.username)
        .padding(.vertical)
//        .toolbar(.hidden, for: .tabBar)
    }
    
    func sendMessages() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}
