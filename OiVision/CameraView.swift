//
//  CameraView.swift
//  OiVision
//
//  Created by Patrick Choi on 9/6/23.
//

import Foundation
import UIKit
import SwiftUI

struct CameraView: UIViewControllerRepresentable{
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    @Binding var image:UIImage?
    typealias UIViewControllerType = UIImagePickerController
    
    func makeUIViewController(context: Context) -> UIViewControllerType {
        let viewController = UIViewControllerType()
        viewController.delegate = context.coordinator
        viewController.sourceType = .camera
        viewController.cameraDevice = .rear
        viewController.cameraOverlayView = .none
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
}

extension CameraView{
    class Coordinator : NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        
        var parent : CameraView
        
        init(_ parent:CameraView){
            self.parent = parent
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {}
        
        func resizeImage(image: UIImage, targetSize: CGSize)->UIImage?{
            return nil
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let availableModes = UIImagePickerController.availableCaptureModes(for: .rear)
            
            if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                print("Image taken")
                print("Width: " + selectedImage.size.width.description)
                print("Height: " + selectedImage.size.height.description)
                
                if selectedImage.size.width > selectedImage.size.height {
                    self.parent.image = selectedImage.imageResized(to: CGSize(width: 3000, height: 2250))
                }
                else {
                        // Handle resizing error
                    self.parent.image = selectedImage.imageResized(to: CGSize(width: 3000, height: 2250))
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

extension UIImage{
    func imageResized(to size: CGSize)-> UIImage{
        return UIGraphicsImageRenderer(size: size).image{ _ in draw(in:CGRect(origin: .zero, size: size))}
    }
}

