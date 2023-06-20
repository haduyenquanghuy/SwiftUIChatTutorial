//
//  NewMessageView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 19/06/2023.
//

import SwiftUI

struct NewMessageView: View {
    
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(0 ... 10, id: \.self) { _ in
                    Button(action: {
                        showChatView.toggle()
                        mode.wrappedValue.dismiss()
                    }) {
                        UserCell()
                    }
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(showChatView: .constant(false))
    }
}
