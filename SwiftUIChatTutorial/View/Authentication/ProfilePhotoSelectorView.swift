//
//  ProfilePhotoSelectorView.swift
//  SwiftUIChatTutorial
//
//  Created by Ha Duyen Quang Huy on 23/06/2023.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            Button(action: {
                imagePickerPresented.toggle()
            }) {
                if let profileImage = profileImage {
                    
                    profileImage
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .padding(.top, 44)
                        .foregroundColor(.black)
                } else {
                    Image(systemName: "plus.viewfinder")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipped()
                        .padding(.top, 44)
                        .foregroundColor(.black)
                }
            }
            .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage) {
                ImagePicker(selectedImage: $selectedImage)
            }
            
            Text(profileImage == nil ? "Selected a profile photo" : "Great! Tap below to continue")
                .font(.system(size: 18, weight: .semibold))
                .padding(.top, 32)
            
            if let image = selectedImage {
                
                Button(action: {
                    viewModel.uploadProfileImage()
                }) {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray, radius: 10, x: 0.0, y: 0.0)
                .padding(.top, 24)
            }
                
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
    
    private func loadImage() {
        guard let selectedImage = selectedImage else { return }
        
        profileImage = Image(uiImage: selectedImage)
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
