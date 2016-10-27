//
//  Attendee.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 27/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

import ObjectMapper

public class Attendee: Mappable, CustomStringConvertible {
    
    var email: String? = nil
    var isLoggedIn: Bool = false
    
    public var description: String {
        return email!
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.email <- map["email"]
        self.isLoggedIn <- map["isLoggedIn"]

    }
}
