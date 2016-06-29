//
//  Meal.swift
//  Testing
//
//  Created by Alexandra Norcross on 6/21/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import Foundation

struct Meal {
  
  var cost: Float!
  var tipPercent: Float!
  
  var tip: Float {
    get {
      return cost * tipPercent / 100
    }
  }
}