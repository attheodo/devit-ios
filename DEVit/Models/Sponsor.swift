//
//  Sponsor.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 09/12/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

import ObjectMapper

public class Sponsor: Mappable, CustomStringConvertible {

    /// The id of the sponsor
    var id: String? = nil
    /// The logo filename of the sponsor
    var imageFilename: String? = nil
    /// The url of the sponsor
    var url: String? = nil
    
    public var description: String {
        return id!
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.id <- map["id"]
        self.imageFilename <- map["image"]
        self.url <- map["url"]
        
    }

}
