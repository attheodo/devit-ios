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
    public func dateWith_Hmm_formatAsStringFromDate(date: Date) -> String {
        
        dateFormatter.dateFormat = "H:mm"
        return dateFormatter.string(from: date as Date)
        
    }
    
    public func dateFormatterWith_Hmm_Format() -> DateFormatter {
        dateFormatter.dateFormat = "H:mm"
        dateFormatter.timeZone = NSTimeZone.local
        return dateFormatter
    }
    
}

