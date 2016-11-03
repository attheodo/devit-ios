//
//  Rating.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 03/11/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

import ObjectMapper

public class Rating: Mappable, CustomStringConvertible {
    
    var id: String? = nil
    var presentation: Double? = nil
    var topic: Double? = nil
    
    public var description: String {
        return "id: \(id) topicRating: \(topic) presentationRating: \(presentation)"
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.presentation <- map["presentation"]
        self.topic <- map["topic"]
        
    }
    
}
