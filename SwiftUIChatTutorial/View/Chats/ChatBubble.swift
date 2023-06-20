//
//  ChatBubble.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import SwiftUI

struct ChatBubble: Shape {
    
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight,isFromCurrentUser ? .bottomLeft : .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
    
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isFromCurrentUser: false)
            .fill(Color.blue)
            .frame(width: 200, height: 40)
    }
}
