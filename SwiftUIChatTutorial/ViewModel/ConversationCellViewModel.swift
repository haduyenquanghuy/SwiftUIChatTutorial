//
//  ConversationCellViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 25/06/2023.
//

import SwiftUI

class ConversationCellViewModel: ObservableObject {
    
    @Published var message: Message
    
    init(_ message: Message) {
        self.message = message
        fetchUser()
    }
    
    var chartParterId: String {
        return message.fromId == currentUid ? message.toId : message.fromId
    }
    
    func fetchUser() {
     
        COLLECTION_USERS.document(chartParterId)
            .getDocument { snapshot, _ in
                
                self.message.user = try? snapshot?.data(as: User.self)
            }
    }
    
    var chatPartnerProfileImageUrl: URL? {
        guard let user = message.user else { return nil}
        
        return URL(string: user.profileImageUrl)
    }
    
    var fullname: String {
        guard let user = message.user else { return ""}
        
        return user.fullname
    }
    
    var currentUid: String {
        return AuthViewModel.shared.userSession?.uid ?? ""
    }
}
