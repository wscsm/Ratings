//
//  Meal.swift
//  Ratings
//
//  Created by suyanlu on 16/6/9.
//  Copyright © 2016年 suyanlu. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}