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

public struct SMTSConstants {
    
    static let tm = SMTSTransitionManager()
    
    public static let SMTSVCNibName = "SMTSViewController"
    public static let smtsStyle = SMTSStyle()
    
    public static let ringStrokeAnimationKey = "StatusIndicator.stroke"
    public static let ringRotationAnimationKey = "StatusIndicator.rotation"
    public static let completionAnimationDuration: NSTimeInterval = 0.3
    public static let hidesWhenCompletedDelay: NSTimeInterval = 0.5
    
}

