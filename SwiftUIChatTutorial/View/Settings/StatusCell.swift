//
//  StatusCell.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct StatusCell: View {
    
    var viewModel: UserStatus
    
    var body: some View {
        Text(viewModel.title)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .applyFont(with: .body)
            .foregroundColor(.black)
    }
}

