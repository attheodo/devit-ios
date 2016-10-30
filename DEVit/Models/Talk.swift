//
//  Talk.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 28/10/2016.
//  Copyright © 2016 devitconf. All rights reserved.
//

import Foundation

import ObjectMapper

public class Talk: Mappable, CustomStringConvertible {
    
    /// The type of talk:
    /// - `devit` stands for devit related sessions (i.e Coffee Break)
    /// - `speaker` stands for talks by speakers
    public enum TalkType: String {
        case devit = "devit"
        case speaker = "speaker"
    }
    
    /// The id of the talk
    var id: String? = nil
    /// The order of the talk in the schedule
    var order: Int? = 0
    /// The name of the talk
    var name: String? = nil
    /// The type of the talk
    var type: TalkType? = .devit
    /// The tags of the talk
    var tags: [String]? = nil
    /// The starting date of the talk
    var startTime: Date? = nil
    /// The duration of the talk in minutes
    var duration: Int? = nil
    /// The `id` of the speaker as declared in Firebase
    var speakerId: String? = nil
    
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
        self.type <- (map["type"],EnumTransform<TalkType>())
        self.startTime <- (map["start_time"], DateFormatterTransform(dateFormatter: DateFormatterManager.sharedFormatter.dateFormatterForISO8601Date()))
        self.tags <- map["tags"]
        self.duration <- map["duration"]
        self.speakerId <- map["speaker_id"]
        
    }
}
