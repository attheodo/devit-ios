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
    /// The filename of the profile pic
    var profilePicFilename: String? = nil
    /// The twitter url of the speaker
    var twitterURL: String? = nil
    /// The linkedIn url of the speaker
    var linkedinURL: String? = nil
    /// The personal website of the speaker
    var websiteURL: String? = nil
    /// The github url of the speaker
    var githubURL: String? = nil
    /// The talk the speaker is associated with
    var talk: Talk? = nil
    /// The workshop the speaker is associated with
    var workshop: Workshop? = nil
    
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
        self.twitterURL <- map["twitter"]
        self.linkedinURL <- map["linkedin"]
        self.websiteURL <- map["website"]
        self.githubURL <- map["github"]
    
    }
}
