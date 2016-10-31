//
//  Workshop.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 31/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

import ObjectMapper

public class Workshop: Mappable, CustomStringConvertible {
    
    /// The id of the workshop
    var id: String? = nil
    /// The order of the workshop in the schedule
    var order: Int? = 0
    /// The name of the workshop
    var name: String? = nil
    /// The `id` of the speaker as declared in Firebase
    var speakerId: String? = nil
    /// Whether the workshop takes the whole day
    var isAllDay: Bool = false
    /// The location where the workshop takes place
    var location: String? = nil
    
    var speaker: Speaker? = nil
    
    public var description: String {
        return name!
    }
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        
        self.id <- map["id"]
        self.order <- map["order"]
        self.name <- map["name"]
        self.speakerId <- map["speaker_id"]
        self.isAllDay <- map["is_all_day"]
        self.location <- map["location"]
        
    }
}
