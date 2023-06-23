//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 23/06/2023.
//

import Firebase

class AuthViewModel: NSObject, ObservableObject {
    
    
    func login() {
        
        print("Handle login...")
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            let data: [String: Any] = [
                "email": email,
                "username": username,
                "fullname": fullname
            ]
            
            Firestore
                .firestore()
                .collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Successfully updated user info in firestore...")
                }
        }
    }
    
    func uploadProfileImage() {
        
    }
    
    func signout() {
        
    }
}
