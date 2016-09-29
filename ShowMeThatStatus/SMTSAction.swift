//
//  SMTSAction.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

open class SMTSAction: NSObject {

    var title: String
    var actionBlock: (() -> ())
    var visibleStates: [SMTSProgressStatus]
    var type: SMTSActionType
    
    var button: UIButton
    
    
    init(title: String, actionBlock: @escaping () -> (), visibleStates: [SMTSProgressStatus],
         type: SMTSActionType = .default) {
        
        self.title = title
        self.actionBlock = actionBlock
        self.visibleStates = visibleStates
        self.type = type
        
        button = UIButton()
        
        super.init()
        
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(performActionBlock),
                          for: .touchUpInside)
        button.setTitle(title, for: UIControlState())
        
        button.titleLabel?.font = type == .default ?
            SMTSConstants.smtsStyle.defaultButtonFont : SMTSConstants.smtsStyle.cancelButtonFont
        button.setTitleColor(type == .default ?
            SMTSConstants.smtsStyle.defaultButtonTextColor : SMTSConstants.smtsStyle.cancelButtonTextColor,
                              for: UIControlState())
        button.backgroundColor = type == .default ?
            SMTSConstants.smtsStyle.defaultButtonBackgroundColor :
            SMTSConstants.smtsStyle.cancelButtonBackgroundColor
        button.layer.cornerRadius = SMTSConstants.smtsStyle.buttonsCornerRadius
        button.layer.borderWidth = 1.0
        button.layer.borderColor = type == .default ?
            SMTSConstants.smtsStyle.defaultButtonBorderColor :
            SMTSConstants.smtsStyle.cancelButtonBorderColor
        
    }
    
    func performActionBlock() {
        
        actionBlock()
        
    }

}
