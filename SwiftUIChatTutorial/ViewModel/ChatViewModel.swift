//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    
    init() {
        messages = mockMessages
        
    }
    
    private var mockMessages: [Message] {
        
        [
            .init(isFromCurrentUser: true, messageText: "Hey what's up man"),
            .init(isFromCurrentUser: false, messageText: "Not much how are you?"),
            .init(isFromCurrentUser: true, messageText: "I'm doing fine. Have fun building this app"),
            .init(isFromCurrentUser: false, messageText: "Are you learning alot?"),
            .init(isFromCurrentUser: true, messageText: "Yeah i am, i love this course"),
            .init(isFromCurrentUser: false, messageText: "That 's awesome, i'm glad i bought it"),
            .init(isFromCurrentUser: true, messageText: "Talk to you later")
        ]
    }
    
    func sendMessage(_ messageText: String) {
        
        let message = Message(isFromCurrentUser: true, messageText: messageText)
        messages.append(message)
//        message
    }
}
