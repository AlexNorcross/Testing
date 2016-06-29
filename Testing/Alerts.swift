//
//  Alerts.swift
//  Testing
//
//  Created by Alexandra Norcross on 6/13/16.
//  Copyright © 2016 Alexandra Norcross. All rights reserved.
//

import UIKit

struct AlertControllerWithMessage {
  
  var title: String
  var message: String
  
  var alertController: UIAlertController {
    
    let controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
    
    controller.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
    
    return controller
  }
}