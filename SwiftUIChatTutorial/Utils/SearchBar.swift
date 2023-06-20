//
//  SearchBar.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 20/06/2023.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var isEditing: Bool
    
    var body: some View {
        HStack {
            
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal, 28)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            
            if isEditing {
                Button(action: {
                    withAnimation(.linear(duration: 0.15)) {
                        isEditing = false
                    }
                    text = ""
                    UIApplication.shared.endEditing()
                }) {
                    Text("Cancel")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(false))
    }
}
