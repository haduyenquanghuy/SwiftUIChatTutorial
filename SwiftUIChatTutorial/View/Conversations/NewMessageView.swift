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
    @State private var searchText = ""
    @State private var isEditing = false
    @Binding var user: User?
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var body: some View {
        ScrollView {
            
            SearchBar(text: $searchText, isEditing: $isEditing)
                .padding()
                .onTapGesture {
                    withAnimation(.linear(duration: 0.15)) {
                        isEditing = true
                    }
                }
                
            
            VStack(alignment: .leading) {
                ForEach(viewModel.users) { user in
                    Button(action: {
                        showChatView.toggle()
                        self.user = user
                        mode.wrappedValue.dismiss()
                    }) {
                        UserCell(user: user)
                    }
                }
            }
        }
    }
}
