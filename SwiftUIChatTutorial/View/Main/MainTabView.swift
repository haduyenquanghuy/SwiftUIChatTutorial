//
//  MainTabView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 15/06/2023.
//

import SwiftUI

struct MainTabView: View {
    
    // MARK: - PROPERTIES
    @State private var selectedTab: MainTabViewType = .conversations
    @State private var tabTitles: String = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    // MARK: - BODY
    var body: some View {
        
        if let user = viewModel.currentUser {
            TabView(selection: $selectedTab) {
                
                ForEach(MainTabViewType.allTabs, id: \.self) { type in
                    
                    Group {
                        NavigationView {
                            switch type {
                            case .conversations:
                                ConversationsView()
                            case .channels:
                                ChannelsViews()
                            case .settings:
                                SettingsView(user: user)
                            }
                        }
                    }
                    .tabItem {
                        Image(systemName: type.imageName)
                    }
                    .tag(type)
                }
                // END: FOR EACH
            }
            .navigationTitle(tabTitles)
            .onChange(of: selectedTab) {
                tabTitles = $0.title
            }
            .onAppear {
                tabTitles = selectedTab.title
            }
        } else {
            // show failed login view
        }
        
        
        // END: TabView
    }
    
    
    // MARK: - FUNCTIONS
    
}

enum MainTabViewType {
    
    case conversations
    case channels
    case settings
    
    var title: String {
        
        switch self {
        case .conversations:
            return "Chats"
        case .channels:
            return "Channels"
        case .settings:
            return "Settings"
        }
    }
    
    var imageName: String {
        
        switch self {
        case .conversations:
            return "bubble.left"
        case .channels:
            return "bubble.left.and.bubble.right"
        case .settings:
            return "gear"
        }
    }
    
    static var allTabs: [MainTabViewType] {
        
        return [.conversations, .channels, .settings]
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
