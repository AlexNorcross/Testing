//
//  PercentageSlider.swift
//  Testing
//
//  Created by Alexandra Norcross on 6/24/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

class PercentageSlider: UISlider {
  
  //MARK: Properties
  
  private var percentageLabel: UILabel?
  
  
  //MARK: Initializers
  
  init(minVal: Float, maxVal: Float, initVal: Float, percentageLabel: UILabel?) {
    super.init(frame: CGRectZero)
    
    self.minimumValue = minVal
    self.maximumValue = maxVal
    self.value = initVal
    
    self.percentageLabel = percentageLabel
    updatePercentageLabel()
    
    self.addTarget(self, action: #selector(self.slid(_:)), forControlEvents: .ValueChanged)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: Selectors
  
  func slid(sender: AnyObject) {
    
    self.value = roundf(self.value)
    
    updatePercentageLabel()
  }
  
  
  //MARK: Functionality
  
  private func updatePercentageLabel() {
    
    if let label = percentageLabel {
      let sliderVal = String(format: "%.0f", self.value)
      label.text = "@ \(sliderVal)%"
    }
  }
}