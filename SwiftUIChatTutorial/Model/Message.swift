//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import FirebaseFirestoreSwift
import Firebase

struct Message: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let fromId: String
    let toId: String
    let read: Bool
    let text: String
    let timestamp: Timestamp
    
    var user: User?
}
