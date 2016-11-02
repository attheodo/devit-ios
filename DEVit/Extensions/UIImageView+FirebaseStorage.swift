//
//  UIImageView+FirebaseStorage.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 02/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation
import UIKit

import Kingfisher
import FirebaseStorage

extension UIImageView {
    
    func setImageFromFirebaseStorage(withFilename filename: String,
                                    andStorageReferece reference: FIRStorageReference) {
        
        if ImageCache.default.isImageCached(forKey: reference.name).cached {
            self.image = ImageCache.default.retrieveImageInDiskCache(forKey: reference.name)
            return
        }
        
        reference.child("\(filename).png").downloadURL { url, error in
        
            guard let url = url else {
                self.image = nil
                return
            }
        
            let resource = ImageResource(downloadURL: url, cacheKey: reference.name)
            self.kf.setImage(with: resource)
        }
        
    }
    
}
