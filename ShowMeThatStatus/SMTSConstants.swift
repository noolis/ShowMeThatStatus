//
//  SMTSConstants.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import Foundation

let SMTSVCNibName = "SMTSViewController"
let tm = SMTSTransitionManager()
let smtsStyle = SMTSStyle()

public typealias StatusIndicatorBlock = () -> Void

public enum SMTSProgressStatus {
    case Unknown, Loading, Progress, Failure, Success, All
}

public enum SMTSActionType {
    case Default, Cancel
}

let ringStrokeAnimationKey = "StatusIndicator.stroke"
let ringRotationAnimationKey = "StatusIndicator.rotation"
let completionAnimationDuration: NSTimeInterval = 0.3
let hidesWhenCompletedDelay: NSTimeInterval = 0.5


