//
//  SMTSStyle.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

public class SMTSStyle: NSObject {
    
    //Colors
    var backgroundColor = UIColor(red: 237.0/255.0, green: 237.0/255.0,
                                  blue: 237.0/255.0, alpha: 1.0)
    var successColor = UIColor(red: 30.0/255.0, green: 205.0/255.0,
                               blue: 151.0/255.0, alpha: 1.0)
    var failureColor = UIColor(red: 194.0/255.0, green: 59.0/255.0,
                               blue: 34.0/255.0, alpha: 1.0)
    var progressColor = UIColor.grayColor()
    var defaultButtonTextColor = UIColor.whiteColor()
    var cancelButtonTextColor = UIColor.whiteColor()
    var defaultButtonBackgroundColor = UIColor(red: 162.0/255.0, green: 164.0/255.0,
                                               blue: 165.0/255.0, alpha: 1.0)
    var cancelButtonBackgroundColor = UIColor(red: 162.0/255.0, green: 164.0/255.0,
                                              blue: 165.0/255.0, alpha: 1.0)
    var borderColor = UIColor.clearColor().CGColor
    
    //Fonts
    var statusFont = UIFont.systemFontOfSize(17)
    var progressFont = UIFont.systemFontOfSize(19)
    var defaultButtonFont = UIFont.systemFontOfSize(15)
    var cancelButtonFont = UIFont.boldSystemFontOfSize(15)
    
    //Corners
    var buttonsCornerRadius: CGFloat = 4.0
    var viewCornerRadius: CGFloat = 4.0
    
    //Size
    var width = floor(UIScreen.mainScreen().bounds.size.width * 0.8)
    var lineWidth: CGFloat = 6.0
    var borderWidth: CGFloat = 1.0
    

}
