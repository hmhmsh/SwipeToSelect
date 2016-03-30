//
//  Circle.swift
//  SwipeToSelect
//
//  Created by 長谷川瞬哉 on 2015/07/17.
//  Copyright (c) 2015年 長谷川瞬哉. All rights reserved.
//

import Foundation
import UIKit

protocol CircleDelegate
{
  func selectKeep()
  func selectDelete()
}

class Circle: UIView {
  
  private var view_Select: SelectView!
  private var size: CGSize!
  private var length: CGFloat!
  private var left: CGFloat!
  private var right: CGFloat!
  
  var delegate: CircleDelegate?
  
  internal func initWithCircle (viewSize: CGSize)
  {
    self.frame = CGRectMake(0, 0, viewSize.width, viewSize.width)
    self.center = CGPointMake(viewSize.width/2, viewSize.height/2)
    self.layer.masksToBounds = true
    self.layer.cornerRadius = viewSize.width / 2
    self.layer.borderColor = UIColor.blackColor().CGColor
    self.layer.borderWidth = 2.0
    
    let keep = UILabel(frame: CGRectMake(0, 0, viewSize.width/6, viewSize.width/6))
    keep.center = CGPointMake(viewSize.width/6, self.frame.size.height/2)
    keep.backgroundColor = UIColor.yellowColor()
    keep.layer.masksToBounds = true
    keep.layer.cornerRadius = keep.frame.size.width/2
    keep.text = "KEEP"
    keep.textAlignment = NSTextAlignment.Center
    self.addSubview(keep)
    
    let delete = UILabel(frame: CGRectMake(0, 0, viewSize.width/6, viewSize.width/6))
    delete.center = CGPointMake(viewSize.width - viewSize.width/6, self.frame.size.height/2)
    delete.backgroundColor = UIColor.grayColor()
    delete.layer.masksToBounds = true
    delete.layer.cornerRadius = keep.frame.size.width/2
    delete.text = "DELETE"
    delete.textAlignment = NSTextAlignment.Center
    self.addSubview(delete)
    
    view_Select = SelectView()
    view_Select.initWithSelectView(self.frame.size)
    self.addSubview(view_Select)
    
    let pan = UIPanGestureRecognizer(target: self, action: "pan:")
    self.addGestureRecognizer(pan)
    
    size = viewSize
    length = viewSize.width/2
    left = viewSize.width/6
    right = viewSize.width - viewSize.width/6
  }
  
  internal func setImage (image: UIImage)
  {
    view_Select.image = image
  }
  
  internal func addSubviewToSelectView(view: UIView) {
    view_Select.addSubview(view)
  }
  
  func pan(gesture: UIPanGestureRecognizer) {
    let touch = gesture.locationInView(self)
    var scale: CGFloat!
    
    switch (gesture.state) {
    case UIGestureRecognizerState.Ended:
      view_Select.transform = CGAffineTransformMakeScale(1.0, 1.0);
      view_Select.center = CGPointMake(size.width/2, view_Select.center.y)
      if (touch.x < left) {
        delegate?.selectKeep()
      }
      if (touch.x > right) {
        delegate?.selectDelete()
      }
      return
    default:
      if (touch.x < left) {
        view_Select.center = CGPointMake(left, view_Select.center.y)
        
        scale = (left / length);
        
        view_Select.transform = CGAffineTransformMakeScale(scale, scale)
        return
      }
      if (touch.x > right) {
        view_Select.center = CGPointMake(right, view_Select.center.y)
        
        scale = ((size.width - right) / length);
        
        view_Select.transform = CGAffineTransformMakeScale(scale, scale)
        return
      }
      
      view_Select.center = CGPointMake(touch.x, view_Select.center.y)
      
      if (touch.x < size.width/2) {
        scale = (touch.x / length);
      }
      else {
        scale = ((size.width - touch.x) / length);
      }
      
      view_Select.transform = CGAffineTransformMakeScale(scale, scale)
      //    self.transform = CGAffineTransformMakeTranslation(100, 200)
      break
    }
  }
  
}
