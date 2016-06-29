//
//  MainViewController.swift
//  Testing
//
//  Created by Alexandra Norcross on 6/10/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
  
  //MARK: Properties
  
  var textFieldCost: CurrencyTextField!
  
  var labelPercentage: UILabel!
  var sliderPercentage: PercentageSlider!
  
  private var buttonCompute: UIButton!
  
  
  //MARK: View Controller
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buttonCompute.addTarget(self, action: #selector(pressedCompute(_:)), forControlEvents: .TouchUpInside)
  }
  
  
  //MARK: Selectors
  
  func pressedCompute(sender: AnyObject) {
    
    textFieldCost.validate({ [weak self] in
      
      if self != nil {
        let eat = Meal(cost: self!.textFieldCost.text!.floatValue, tipPercent: self!.sliderPercentage.value)
        let messageAlertController = AlertControllerWithMessage(title: "tip", message: "Add \(eat.tip.currencyFormat) for tip.")
        self!.presentViewController(messageAlertController.alertController, animated: true, completion: nil)
      }
    
    }) { [weak self] in
      
      if self != nil {
        let errorAlertController = AlertControllerWithMessage(title: "oops", message: "Please enter a valid number for\nthe total cost of your meal.")
        self!.presentViewController(errorAlertController.alertController, animated: true, completion: nil)
      }
    }
  }
  
  
  //MARK: View Controller - Load View
  
  override func loadView() {
    
    let rootView = UIView(frame: UIScreen.mainScreen().bounds)
    rootView.backgroundColor = UIColor.whiteColor()
    
    
    textFieldCost = CurrencyTextField(placeholder: "meal total")
    textFieldCost.translatesAutoresizingMaskIntoConstraints = false
    rootView.addSubview(textFieldCost)
    
    labelPercentage = UILabel()
    labelPercentage.translatesAutoresizingMaskIntoConstraints = false
    rootView.addSubview(labelPercentage)
    
    sliderPercentage = PercentageSlider(minVal: 0, maxVal: 30, initVal: 15, percentageLabel: labelPercentage)
    sliderPercentage.translatesAutoresizingMaskIntoConstraints = false
    rootView.addSubview(sliderPercentage)
    
    buttonCompute = UIButton()
    buttonCompute.setTitle("compute tip", forState: .Normal)
    buttonCompute.setTitleColor(UIColor.blueColor(), forState: .Normal)
    buttonCompute.translatesAutoresizingMaskIntoConstraints = false
    rootView.addSubview(buttonCompute)
    

    let hCost = NSLayoutConstraint(item: textFieldCost, attribute: .CenterX, relatedBy: .Equal, toItem: rootView, attribute: .CenterX, multiplier: 1, constant: 0)
    let vCost = NSLayoutConstraint(item: textFieldCost, attribute: .Top, relatedBy: .Equal, toItem: rootView, attribute: .Top, multiplier: 1, constant: 100)
    rootView.addConstraints([hCost, vCost])
    
    let hPercentageSlider = NSLayoutConstraint(item: sliderPercentage, attribute: .CenterX, relatedBy: .Equal, toItem: rootView, attribute: .CenterX, multiplier: 1, constant: 0)
    let vPercentageSlider = NSLayoutConstraint(item: sliderPercentage, attribute: .Top, relatedBy: .Equal, toItem: textFieldCost, attribute: .Bottom, multiplier: 1, constant: 50)
    let lPercentageSlider = NSLayoutConstraint(item: sliderPercentage, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .Width, multiplier: 1, constant: 250)
    let hPercentageLabel = NSLayoutConstraint(item: labelPercentage, attribute: .Trailing, relatedBy: .Equal, toItem: sliderPercentage, attribute: .Trailing, multiplier: 1, constant: 0)
    let vPercentageLabel = NSLayoutConstraint(item: labelPercentage, attribute: .Top, relatedBy: .Equal, toItem: sliderPercentage, attribute: .Bottom, multiplier: 1, constant: 5)
    rootView.addConstraints([hPercentageLabel, vPercentageLabel, hPercentageSlider, vPercentageSlider, lPercentageSlider])
    
    let hTotal = NSLayoutConstraint(item: buttonCompute, attribute: .CenterX, relatedBy: .Equal, toItem: rootView, attribute: .CenterX, multiplier: 1, constant: 0)
    let vTotal = NSLayoutConstraint(item: buttonCompute, attribute: .Top, relatedBy: .Equal, toItem: labelPercentage, attribute: .Top, multiplier: 1, constant: 100)
    rootView.addConstraints([hTotal, vTotal])
    
    self.view = rootView
  }
}