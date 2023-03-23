//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation
import Alamofire

protocol Parameterable: Codable {
    func toParameters() -> Parameters
}

extension Parameterable {
    func toParameters() -> Parameters {
        guard let jsonData = try? JSONEncoder().encode(self),
              let serializedData = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else { fatalError("Could not convert to JSON") }
        
        return serializedData
    }
}
