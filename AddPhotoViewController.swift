//
//  AddPhotoViewController.swift
//  viewFinder
//
//  Created by Apple on 7/29/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class AddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    

    var imagePicker = UIImagePickerController()

    @IBOutlet weak var newImage: UIImageView!
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        imagePicker.delegate = self
    }
    
    

    @IBAction func takePhotoTapped(_ sender: Any) {
    imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoLibraryTapped(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func photoAlbumTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    

    @IBAction func savePhotoTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = textField.text
            
            if let userImage = newImage.image {
                if let userImageData = userImage.pngData() {
                    photoToSave.imageData = userImageData
                    
                }
                
            }
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        
            navigationController?.popViewController(animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
            newImage.image = selectedImage
            
        }
        imagePicker.dismiss(animated: true, completion: nil)
        
    }
}
