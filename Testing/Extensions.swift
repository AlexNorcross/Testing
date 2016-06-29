//
//  Extensions.swift
//  Testing
//
//  Created by Alexandra Norcross on 6/24/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import Foundation

extension Float {
  
  var currencyFormat: String {
    
    let formatter = NSNumberFormatter()
    formatter.numberStyle = .CurrencyStyle
    
    return formatter.stringFromNumber(self)!
  }
}

extension String {
  
  var floatValue: Float {
    return (self as NSString).floatValue
  }
  
  var validateCurrencyValue: Bool {
    
    let entry = self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    
    if entry == "" {
      return false
      
    } else {
      var regex: NSRegularExpression?
      do {
        regex = try NSRegularExpression(pattern: "^[0-9]+(?:\\.[0-9]{1,2})?$", options: [])
        let range = NSMakeRange(0, entry.characters.count)
        
        if let regex = regex {
          if regex.numberOfMatchesInString(entry, options: .Anchored, range: range) == 1 {
            return true
          }
        }
      
      } catch _ {
        regex = nil
      }
      
      return false
    }
  }
}