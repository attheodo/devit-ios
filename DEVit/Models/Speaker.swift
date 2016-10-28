//
//  Speaker.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

import ObjectMapper

public class Speaker: Mappable, CustomStringConvertible {
    
    /// The id of the speaker
    var id: String? = nil
    /// The name of the speaker
    var name: String? = nil
    /// The company that the speaker works for
    var company: String? = nil
    /// The bio of the speaker
    var bio: String? = nil
    
    public var description: String {
        return name!
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.id <- map["id"]
        self.name <- map["name"]
        self.company <- map["company"]
        self.bio <- map["bio"]
    
    }
}
