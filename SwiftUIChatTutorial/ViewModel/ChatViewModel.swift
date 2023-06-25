//
//  ChatViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import Firebase

class ChatViewModel: ObservableObject {
    
    @Published var messages = [Message]()
    let user: User
    
    init(user: User) {
        self.user = user
        fetchMessages()
    }
    
    func fetchMessages() {
        
        guard let currentUiD = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let query = COLLECTION_MESSAGES
            .document(currentUiD)
            .collection(chatPartnerId)
            .order(by: "timestamp", descending: false)
        
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added
            }) else { return }
            
            var messages = changes.compactMap {
                try? $0.document.data(as: Message.self)
            }
            
            for (index, message) in messages.enumerated() where message.fromId != currentUiD {
                messages[index].user = self.user
            }
            
            self.messages.append(contentsOf: messages)
        }

    }
    
    func sendMessage(_ messageText: String) {
        guard let currentUiD = AuthViewModel.shared.userSession?.uid else { return }
        guard let chatPartnerId = user.id else { return }
        
        let currentUserRef = COLLECTION_MESSAGES.document(currentUiD).collection(chatPartnerId).document()
        let chatParterRef = COLLECTION_MESSAGES.document(chatPartnerId).collection(currentUiD)
        
        let recentCurrentRef = COLLECTION_MESSAGES.document(currentUiD).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef = COLLECTION_MESSAGES.document(chatPartnerId).collection("recent-messages").document(currentUiD)
        
        let messageId = currentUserRef.documentID
        
        let data: [String: Any] = [
            "text": messageText,
            "fromId": currentUiD,
            "toId": chatPartnerId,
            "read": false,
            "timestamp": Timestamp(date: Date())
        ]
        
        currentUserRef.setData(data)
        chatParterRef.document(messageId).setData(data)
        
        recentCurrentRef.setData(data)
        recentPartnerRef.setData(data)
    }
}
