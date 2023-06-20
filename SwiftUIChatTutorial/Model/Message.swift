//
//  Message.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import Foundation

struct Message: Identifiable {
    
    let id = NSUUID().uuidString
    let isFromCurrentUser: Bool
    let messageText: String
}
