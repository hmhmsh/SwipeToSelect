//
//  ViewController.swift
//  SwipeToSelect
//
//  Created by 長谷川瞬哉 on 2015/07/16.
//  Copyright (c) 2015年 長谷川瞬哉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CircleDelegate {

  private var circle: Circle!
  private var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = UIColor.whiteColor()
    
    circle = Circle()
    circle.initWithCircle(self.view.frame.size)
    var image = UIImage(named: "neko.png")
    circle.setImage(image!)
    circle.delegate = self
    self.view.addSubview(circle)
    
    label = UILabel()
    label.frame = CGRectMake(0, 0, circle.frame.size.width/3, circle.frame.size.width/3)
    label.text = ""
    label.textAlignment = NSTextAlignment.Center
    label.tag = 1
    circle.addSubviewToSelectView(label)
    
    for i in 0..<5 {
      println("\(i)")
    }
    for (var i = 0; i < 5; i++) {
      var printLabel = UILabel()
      printLabel.frame = CGRectMake(self.view.frame.size.width  * CGFloat(i) / 5.0, 15, self.view.frame.size.width / 5, 30);
      printLabel.layer.masksToBounds = true
      printLabel.layer.borderColor = UIColor.blackColor().CGColor
      printLabel.layer.borderWidth = 2.0
      self.view.addSubview(printLabel)
    }
  }
  
  func selectKeep()
  {
    println("Keep")
    switch (label.tag) {
    case 1:
      
      break
    case 2:
      break
    case 3:
      break
    case 4:
      break
    case 5:
      break
    default:
      break
    }
  }
  
  func selectDelete()
  {
    println("Delete")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

