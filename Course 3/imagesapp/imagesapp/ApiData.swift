//
//  ApiData.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.

import SwiftUI

struct Response: Decodable, Hashable, Identifiable {
    let id = UUID()
    var items: [myItem]
}

struct myItem: Decodable,Identifiable, Hashable {
    let id = UUID()
    let title, link: String
    let media: Media
    let dateTaken, description, published, author: String
    let authorId, tags: String
}

struct Media: Codable, Identifiable, Hashable {
    let id = UUID()
    let m: String
}

class Api{
    func getPosts(completion: @escaping ([myItem])->()){
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
            
        }
    .resume()
    }
}
