//
//  imageCache.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 30/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

//class JsonCache{
//    var cache = NSCache<NSString,Data>()
//    func setJsonResponse(forKey:String, res: Data){
//        cache.setObject(res, forKey: NSString(string: forKey))
//    }
//    func getJsonResponse(forKey: String) -> Data{
//        return cache.object(forKey: NSString(string: forKey))
//    }
//}

class imageCache{
    var cache = NSCache<NSString, UIImage>()
    
    func getImage(forKey: String) -> UIImage?{
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func setImage(forKey: String, image: UIImage){
        cache.setObject(image, forKey: NSString(string: forKey))
    }
    
    
}

extension imageCache{
    private static var imgCache = imageCache()
    static func getImageCache()->imageCache{
        return imgCache
    }
}
