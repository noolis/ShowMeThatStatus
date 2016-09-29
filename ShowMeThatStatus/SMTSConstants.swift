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
    case unknown, loading, progress, failure, success, all
}

public enum SMTSActionType {
    case `default`, cancel
}

public struct SMTSConstants {
    
    static let tm = SMTSTransitionManager()
    
    public static let SMTSVCNibName = "SMTSViewController"
    public static let smtsStyle = SMTSStyle()
    
    public static let ringStrokeAnimationKey = "StatusIndicator.stroke"
    public static let ringRotationAnimationKey = "StatusIndicator.rotation"
    public static let completionAnimationDuration: TimeInterval = 0.3
    public static let hidesWhenCompletedDelay: TimeInterval = 0.5
    
}

