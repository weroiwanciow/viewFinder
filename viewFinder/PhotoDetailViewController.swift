//
//  PhotoDetailViewController.swift
//  viewFinder
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo : Photos? = nil
    
  
    @IBOutlet weak var newImage2: UIImageView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let realPhoto = photo {
            title = realPhoto.caption
            
            if let cellPhotoImageData = realPhoto.imageData {
                if let cellPhotoImage = UIImage(data: cellPhotoImageData) {
                    newImage2.image = cellPhotoImage
                
            }
            
            
        }

        // Do any additional setup after loading the view.
        
        
        
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
