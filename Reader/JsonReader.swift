//
//  JsonReader.swift
//  ElementalSpace
//
//  Created by Lewis Briffa on 27/04/2018.
//  Copyright © 2018 Lewis Briffa. All rights reserved.
//

import Foundation

class JsonReader {
    
    public static func parse(resource: String, type: String)->[Any]? {
        
        var json: [Any]?
        
        if let path = Bundle.main.path(forResource: resource, ofType: type) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [Any]
                return json
            } catch let error {
                print("error parsing \(error)")
            }
        }
        
        return json
    }
}
