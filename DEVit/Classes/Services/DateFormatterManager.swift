//
//  DateFormatter.swift
//  DEVit
//
//  Created by Athanasios Theodoridis on 13/10/2016.
//  Copyright © 2016 DEVit. All rights reserved.
//

import Foundation

/**
 Cached NSDateFormatters singleton.
 */
public class DateFormatterManager {
    
    // MARK: - Properties
    /// Singleton
    static let sharedFormatter = DateFormatterManager()
    
    private let dateFormatter: DateFormatter
    
    // MARK: - private init
    private init() {
        
        // init the formatters
        dateFormatter = DateFormatter()
        
    }
    
    // MARK: - Public
    /**
     Formats the passed `NSDate` in "H:m" format
     - parameter date: A `NSDate` object holding the date to format
     - returns: The passed date formatted accordingly as a string
     */
    public func dateWith_Hmm_formatAsString(fromDate date: Date) -> String {
        
        dateFormatter.dateFormat = "H:mm"
        return dateFormatter.string(from: date as Date)
        
    }
    
    /**
        Returns a formatter capable of parsing ISO8601 dates
    */
    public func dateFormatterForISO8601Date() -> DateFormatter {
        
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        dateFormatter.timeZone = NSTimeZone.local
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale!
        return dateFormatter
    
    }
    
    /**
     Retruns whether the current date is withint a certain time range
     
     - parameter startingTime: The start of the time range 
     - parameter duration: The duration to be added in order to mark the end of the range
     - returns: A `Bool` indicating whether the current time is within the range
    */
    public func isCurrentTimeWithinTimeRange(startingTime: Date, duration: Int) -> Bool {
        
        // If we're on Release configuration, take into account the whole date
        // instead of just the timestamp
        #if !DEBUG
            
            let currentTime = Date().timeIntervalSince1970
            let startTime = startingTime.timeIntervalSince1970
            let endTime = startTime + TimeInterval((duration * 60))
            
        // In Debug configuration, just compare timestamps in order to test more easily
        // whether the current time is within the range
        #else
            
            let currentTime = dateWith_Hmm_formatAsString(fromDate: Date())
            let startTime = dateWith_Hmm_formatAsString(fromDate: startingTime)
            let timeInterval = Double(duration * 60)
            let endTime = dateWith_Hmm_formatAsString(fromDate: startingTime.addingTimeInterval(timeInterval))

        #endif
        
        return currentTime >= startTime && currentTime <= endTime ? true : false

    }
    
}

