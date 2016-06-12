//
//  Meal.swift
//  Ratings
//
//  Created by suyanlu on 16/6/9.
//  Copyright © 2016年 suyanlu. All rights reserved.
//

import UIKit

class Meal : NSObject, NSCoding{
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        if (name.isEmpty || rating < 0) {
            return nil
        }
    }
    
    // MARK: NSCoding
    required convenience init?(coder aDecoder: NSCoder) {
        self.init(name: aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String,
                  photo: aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage,
                  rating: aDecoder.decodeIntegerForKey(PropertyKey.ratingKey))
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    
}