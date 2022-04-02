//
//  Network.swift
//  Photo_Gallery
//
//  Created by Ahmad Mustafa on 02/04/2022.
//

import UIKit

class Network{
    class func sendGetRequest(completion: @escaping(Data) -> Void){
        let api = "https://api.unsplash.com/photos/?client_id=\(Access_Key)"
        
        guard let url = URL(string: api) else {return}
                
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                completion(Data())
                return
            }
            
            print("======================")
            print("Response \(data.prettyPrintedJSONString ?? "")")
            guard (200 ... 299) ~= response.statusCode else {completion(Data());return}
            
            completion(data)
        }.resume()
    }
}

extension Data {
    var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
        
        return prettyPrintedString
    }
}
