//
//  JsonService.swift
//  CryptoCrazy
//
//  Created by Burak Öztopuz on 2.07.2022.
//

import Foundation
import UIKit

class JsonService {
    
    func downloadData(url : URL , completion : @escaping ([CryptoCurrency]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription ?? "Error")
                completion(nil)
            }else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from : data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
    
    
    
}
