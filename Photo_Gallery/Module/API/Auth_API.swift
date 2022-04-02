//
//  Auth_API.swift
//  Photo_Gallery
//
//  Created by Ahmad Mustafa on 02/04/2022.
//

import Foundation

struct Auth_API{
    static func fetchPhotos(completion: @escaping(Photo?) -> Void){
        
        
        Network.sendGetRequest { data in
            DispatchQueue.main.async {
                do{
                    let response = try JSONDecoder().decode(Photo.self, from: data)
                    completion(response)
                }catch{
                    completion(nil)
                }
            }
        }
    }
}
