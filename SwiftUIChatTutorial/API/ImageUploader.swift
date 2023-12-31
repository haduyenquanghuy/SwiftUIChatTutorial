//
//  ImageUploader.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 25/06/2023.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploader {
    
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData) { _, error in
            if let error = error {
                print("Debug: Failed to upload image with error \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, _ in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
