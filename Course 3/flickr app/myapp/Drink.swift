//
//  Drink.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct Drink: Hashable, Codable, Identifiable{
    var id:Int
    var name:String
    var imageName:String
    var category: Category
    var description: String
    
    enum Category:String, CaseIterable,Codable, Hashable{
        case hot="hot"
        case cold="cold"
    }
}
