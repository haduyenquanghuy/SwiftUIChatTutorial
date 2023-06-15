//
//  StatusSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct StatusSelectorView: View {
    
    @ObservedObject var viewModel = StatusViewModel()
    
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    HStack() {
                        StatusCell(viewModel: viewModel.status)
                        
                        Spacer()
                    }
                    .background(Color.white)
                    .addHeader(with: "Currently set to", leading: 12)
                    
                    LazyVStack(alignment: .leading, spacing: 0) {
                        ForEach(UserStatus.allCases.filter { $0 != .notConfigured}, id: \.self) { item in
                            
                            Button(action: {
                                viewModel.updateStatus(item)
                            }) {
                                StatusCell(viewModel: item)
                            }
                        }
                    }
                    .background(Color.white)
                    .addHeader(with: "SELECT YOUR STATUS", leading: 12)
                }
            }
            
        }
    }
}

struct StatusSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView()
    }
}
