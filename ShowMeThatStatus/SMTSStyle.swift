//
//  SMTSStyle.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

open class SMTSStyle: NSObject {
    
    //Colors
    open var backgroundColor = UIColor(red: 237.0/255.0, green: 237.0/255.0,
                                  blue: 237.0/255.0, alpha: 1.0)
    open var successColor = UIColor(red: 30.0/255.0, green: 205.0/255.0,
                               blue: 151.0/255.0, alpha: 1.0)
    open var failureColor = UIColor(red: 194.0/255.0, green: 59.0/255.0,
                               blue: 34.0/255.0, alpha: 1.0)
    open var progressColor = UIColor.gray
    open var defaultButtonTextColor = UIColor.white
    open var cancelButtonTextColor = UIColor.white
    open var defaultButtonBackgroundColor = UIColor(red: 162.0/255.0, green: 164.0/255.0,
                                               blue: 165.0/255.0, alpha: 1.0)
    open var cancelButtonBackgroundColor = UIColor(red: 162.0/255.0, green: 164.0/255.0,
                                              blue: 165.0/255.0, alpha: 1.0)
    
    //Borders
    open var backgroundBorderColor = UIColor.clear.cgColor
    open var defaultButtonBorderColor = UIColor.clear.cgColor
    open var cancelButtonBorderColor = UIColor.clear.cgColor
    
    //Fonts
    open var statusFont = UIFont.systemFont(ofSize: 17)
    open var progressFont = UIFont.systemFont(ofSize: 19)
    open var defaultButtonFont = UIFont.systemFont(ofSize: 15)
    open var cancelButtonFont = UIFont.boldSystemFont(ofSize: 15)
    
    //Corners
    open var buttonsCornerRadius: CGFloat = 4.0
    open var viewCornerRadius: CGFloat = 4.0
    
    //Size
    open var width = floor(UIScreen.main.bounds.size.width * 0.8)
    open var lineWidth: CGFloat = 6.0
    open var borderWidth: CGFloat = 1.0
    
    //Shadow
    open var shadowColor = UIColor.clear.cgColor
    open var shadowOpacity: Float = 0.5
    

}
