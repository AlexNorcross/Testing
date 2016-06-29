//
//  CurrencyTextField.swift
//  Testing
//
//  Created by Alexandra Norcross on 6/24/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

class CurrencyTextField: UITextField, UITextFieldDelegate {

  //MARK: Constants
  
  private let characterSetForCost = NSCharacterSet(charactersInString: "0123456789.")
  
  
  //MARK: Initializers
  
  init(placeholder: String) {
    super.init(frame: CGRectZero)
    
    self.delegate = self
    
    self.placeholder = placeholder
    self.textAlignment = .Right
    self.borderStyle = UITextBorderStyle.RoundedRect
    self.keyboardType = .NumbersAndPunctuation
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  //MARK: Text Field Delegate
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
    return string.rangeOfCharacterFromSet(characterSetForCost) != nil
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    
    textField.resignFirstResponder()
    return true
  }
  
  
  //MARK: Functionality
  
  func validate(validValueHandler: () -> (), invalidValueHandler: () -> ()) {
    
    if self.text!.validateCurrencyValue {
      validValueHandler()
      
    } else {
      invalidValueHandler()
    }
  }
}