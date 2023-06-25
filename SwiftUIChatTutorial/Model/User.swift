//
//  User.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 25/06/2023.
//

import FirebaseFirestoreSwift
import Foundation

struct User: Identifiable, Decodable {
    
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let email: String
    let profileImageUrl: String
}

let MOCK_USER = User(id: UUID().uuidString, username: "Test", fullname: "Test", email: "test@gmail.com", profileImageUrl: "www.google.com")
