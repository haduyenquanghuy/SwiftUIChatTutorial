//
//  SettingsView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {

            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                VStack(spacing: 32) {
                    
                    NavigationLink(destination: EditProfileView()) {
                        SettingsHeaderView()
                            .padding(.top, 1)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    VStack(spacing: 1) {
                        ForEach(SettingsCellViewModel.allCases, id: \.title) {
                            SettingsCell(viewModel: $0)
                        }
                    }
                    
                    Button(action: {
                        print("Handle log out here")
                    }) {
                        Text("Log out")
                            .foregroundColor(.red)
                            .font(.system(size: 16, weight: .semibold))
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                            .background(Color.white)
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)

    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
