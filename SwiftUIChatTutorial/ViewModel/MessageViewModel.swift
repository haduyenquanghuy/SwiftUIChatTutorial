//
//  MessageViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 25/06/2023.
//

import Foundation

class MessageViewModel: ObservableObject {
    
    @Published var user: User?
    let message: Message
    
    init(_ message: Message) {
        self.message = message
//        fetchUser()
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
    
    var isFromCurrentUser: Bool {
        return message.fromId == currentUid
    }
    
    var profileImageUrl: URL? {
        guard let profileImageUrl = message.user?.profileImageUrl else { return nil }
        
        return URL(string: profileImageUrl)
    }
}
