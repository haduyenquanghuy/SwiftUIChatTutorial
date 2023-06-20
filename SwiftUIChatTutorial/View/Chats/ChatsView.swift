//
//  ChatsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct ChatsView: View {
    
    @State private var messageText = ""
    @ObservedObject var viewModel = ChatViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                
                VStack(alignment: .leading, spacing: 12) {
                    ForEach(viewModel.messages) { message in
                        
                        MessageView(isFromCurrentUser: message.isFromCurrentUser, messageText: message.messageText)
                    }
                }
            }
            
            CustomInputView(text: $messageText, action: sendMessages)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Pikachu")
        .padding(.vertical)
        .toolbar(.hidden, for: .tabBar)
    }
    
    func sendMessages() {
        viewModel.sendMessage(messageText)
        messageText = ""
    }
}

struct ChatsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsView()
    }
}
