//
//  SMTSConstants.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import Foundation

public typealias StatusIndicatorBlock = () -> Void

public enum SMTSProgressStatus {
    case Unknown, Loading, Progress, Failure, Success, All
}

public enum SMTSActionType {
    case Default, Cancel
}

struct SMTSConstants {
    
    static let SMTSVCNibName = "SMTSViewController"
    static let tm = SMTSTransitionManager()
    static let smtsStyle = SMTSStyle()
    
    static let ringStrokeAnimationKey = "StatusIndicator.stroke"
    static let ringRotationAnimationKey = "StatusIndicator.rotation"
    static let completionAnimationDuration: NSTimeInterval = 0.3
    static let hidesWhenCompletedDelay: NSTimeInterval = 0.5
    
}

