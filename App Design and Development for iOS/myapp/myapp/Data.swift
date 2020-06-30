//
//  Data.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import Foundation

let drinkData:[Drink] = load("drinks.json")

func load<T:Decodable> (_ filename:String, as type:T.Type = T.self)->T{
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else{
            fatalError("Couldn't find the \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't read the \(filename) from main bundle.")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from:data)
    }catch{
        fatalError("Couldn't parse the \(filename) from main bundle.")
    }
}
