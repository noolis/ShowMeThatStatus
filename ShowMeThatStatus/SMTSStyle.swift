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
    public var backgroundColor = UIColor(red: 237.0/255.0, green: 237.0/255.0,
                                  blue: 237.0/255.0, alpha: 1.0)
    public var successColor = UIColor(red: 30.0/255.0, green: 205.0/255.0,
                               blue: 151.0/255.0, alpha: 1.0)
    public var failureColor = UIColor(red: 194.0/255.0, green: 59.0/255.0,
                               blue: 34.0/255.0, alpha: 1.0)
    public var progressColor = UIColor.grayColor()
    public var defaultButtonTextColor = UIColor.whiteColor()
    public var cancelButtonTextColor = UIColor.whiteColor()
    public var defaultButtonBackgroundColor = UIColor(red: 162.0/255.0, green: 164.0/255.0,
                                               blue: 165.0/255.0, alpha: 1.0)
    public var cancelButtonBackgroundColor = UIColor(red: 162.0/255.0, green: 164.0/255.0,
                                              blue: 165.0/255.0, alpha: 1.0)
    
    //Borders
    public var backgroundBorderColor = UIColor.clearColor().CGColor
    public var defaultButtonBorderColor = UIColor.clearColor().CGColor
    public var cancelButtonBorderColor = UIColor.clearColor().CGColor
    
    //Fonts
    public var statusFont = UIFont.systemFontOfSize(17)
    public var progressFont = UIFont.systemFontOfSize(19)
    public var defaultButtonFont = UIFont.systemFontOfSize(15)
    public var cancelButtonFont = UIFont.boldSystemFontOfSize(15)
    
    //Corners
    public var buttonsCornerRadius: CGFloat = 4.0
    public var viewCornerRadius: CGFloat = 4.0
    
    //Size
    public var width = floor(UIScreen.mainScreen().bounds.size.width * 0.8)
    public var lineWidth: CGFloat = 6.0
    public var borderWidth: CGFloat = 1.0
    
    //Shadow
    public var shadowColor = UIColor.clearColor().CGColor
    public var shadowOpacity: Float = 0.5
    

}
