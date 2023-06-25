//
//  AuthViewModel.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 23/06/2023.
//

import Firebase
import UIKit

class AuthViewModel: NSObject, ObservableObject {
    
    @Published var didAuthenticateUser = false
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    private var tempCurrentUser: FirebaseAuth.User?
    
    static let shared = AuthViewModel()
    
    override init() {
        super.init()
        userSession = Auth.auth().currentUser
        
        fetchUser()
    }
    
    func login(withEmail email: String, password: String) {
        
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            
            if let error = error {
                print("fail to login with error \(error.localizedDescription)")
                return
            }
            
            self.userSession = result?.user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self?.tempCurrentUser = user
            
            let data: [String: Any] = [
                "email": email,
                "username": username,
                "fullname": fullname
            ]
            
            Firestore
                .firestore()
                .collection("users")
                .document(user.uid)
                .setData(data) { [weak self] _ in
                    self?.didAuthenticateUser = true
                }
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        
        guard let uid = tempCurrentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            COLLECTION_USERS.document(uid)
                .updateData(["profileImageUrl": imageUrl]) { _ in
                    self.userSession = self.tempCurrentUser
                    
                }
        }
    }
    
    func signout() {
        userSession = nil
        currentUser = nil
        try? Auth.auth().signOut()
    }
    
    func fetchUser() {
        guard let uid  = userSession?.uid else { return }
        
        COLLECTION_USERS.document(uid)
            .getDocument { snapshot, _ in
                
                guard let user = try? snapshot?.data(as: User.self) else { return }
                
                self.currentUser = user
            }
    }
}
