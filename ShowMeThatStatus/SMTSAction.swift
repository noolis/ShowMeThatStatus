//
//  SMTSAction.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

public class SMTSAction: NSObject {

    var title: String
    var actionBlock: (() -> ())
    var visibleStates: [SMTSProgressStatus]
    var type: SMTSActionType
    
    var button: UIButton
    
    
    init(title: String, actionBlock: () -> (), visibleStates: [SMTSProgressStatus],
         type: SMTSActionType = .Default) {
        
        self.title = title
        self.actionBlock = actionBlock
        self.visibleStates = visibleStates
        self.type = type
        
        button = UIButton()
        
        super.init()
        
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(performActionBlock),
                          forControlEvents: .TouchUpInside)
        button.setTitle(title, forState: .Normal)
        
        button.titleLabel?.font = type == .Default ?
            style.defaultButtonFont : style.cancelButtonFont
        button.setTitleColor(type == .Default ?
            style.defaultButtonTextColor : style.cancelButtonTextColor,
                              forState: .Normal)
        button.backgroundColor = type == .Default ?
            style.defaultButtonBackgroundColor : style.cancelButtonBackgroundColor
        button.layer.cornerRadius = style.buttonsCornerRadius
        
    }
    
    func performActionBlock() {
        
        actionBlock()
        
    }

}
