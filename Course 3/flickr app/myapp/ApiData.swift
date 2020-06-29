//
//  ApiData.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.


import SwiftUI

struct Response: Codable, Identifiable, Hashable{
    let id = UUID()
    let items: Post
}

struct Media: Codable, Identifiable, Hashable{
    let id = UUID()
    let imageName:String
    private enum CodingKeys: String, CodingKey{
        case imageName="m"
    }
}

struct Post: Codable, Identifiable, Hashable{
    let id = UUID()
    var name: String //title
//    var userId: Int
    var imageName:String
    var category: Category
    var description: String
    
    enum Category:String, CaseIterable,Codable, Hashable{
        case hot="hot"
        case cold="cold"
    }
}

class Api{
    func getPosts(completion: @escaping ([Post])->()){
        guard let url = URL(string : "https://jsonplaceholder.typicode.com/posts") else {return}
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
//            if let response = try! JSONDecoder().decode([Response]?.self, from: data!){
//
//                print(response)
//
////                DispatchQueue.main.async{
////                    print(posts)
////                    completion(posts)
////                }
//            }
//            else{
//                print("error occured")
//            }
//            var str = String(data: data!, encoding: .utf8)
//            print(str)
            let json = try? JSONSerialization.jsonObject(with: data!, options: [])
            let x = json! as? [String:Any]
            print(x)
        }
    .resume()
        
    }
}
