//
//  SelectView.swift
//  SwipeToSelect
//
//  Created by 長谷川瞬哉 on 2015/07/17.
//  Copyright (c) 2015年 長谷川瞬哉. All rights reserved.
//

import Foundation
import UIKit

class SelectView: UIImageView {
  
  internal func initWithSelectView (viewSize: CGSize)
  {
    self.frame = CGRectMake(0, 0, viewSize.width/3, viewSize.width/3)
    self.center = CGPointMake(viewSize.width/2, viewSize.height/2)
    self.backgroundColor = UIColor.whiteColor()
    self.layer.masksToBounds = true
    self.layer.borderColor = UIColor.blackColor().CGColor
    self.layer.borderWidth = 2.0
    self.userInteractionEnabled = true    
  }
  
}
