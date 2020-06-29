//
//  ApiData.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.


import SwiftUI

struct Response: Decodable {
    var items: [Item]
}

struct Item: Decodable {
    let title, link: String
    let media: Media
    let dateTaken, description, published, author: String
    let authorId, tags: String
}

struct Media: Codable {
    let m: String
}

//struct Response: Codable, Identifiable, Hashable{
//    let id = UUID()
//    let items: Post
//}
//
//struct Media: Codable, Identifiable, Hashable{
//    let id = UUID()
//    let imageName:String
//    private enum CodingKeys: String, CodingKey{
//        case imageName="m"
//    }
//}
//
//struct Post: Codable, Identifiable, Hashable{
//    let id = UUID()
//    var name: String //title
////    var userId: Int
//    var imageName:String
//    var category: Category
//    var description: String
//
//    enum Category:String, CaseIterable,Codable, Hashable{
//        case hot="hot"
//        case cold="cold"
//    }
//}

class Api{
    func getPosts(completion: @escaping ([Item])->()){
        guard let url = URL(string : "https://api.flickr.com/services/feeds/photos_public.gne?tags=kitten&format=json&nojsoncallback=1") else {return}
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            if let response = try! decoder.decode(Response?.self, from: data!){

                DispatchQueue.main.async{
//                    print(response.items)
                    completion(response.items)
                }
            }
            else{
                print("error occured")
            }
            
//            var str = String(data: data!, encoding: .utf8)
//            print(str)
            
//            let json = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
//            print(json)
//            let x = json! as? [String:Any]
//            print(x)
        }
    .resume()
        
    }
}
