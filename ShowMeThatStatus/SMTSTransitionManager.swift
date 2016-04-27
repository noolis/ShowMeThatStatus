//
//  SMTSTransitionManager.swift
//  ShowMeThatStatus
//
//  Created by Tomasz Kopycki on 21/04/16.
//  Copyright © 2016 Noolis. All rights reserved.
//

import UIKit

class SMTSTransitionManager: NSObject,
UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var isPresenting = false
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let transitionContainer = transitionContext.containerView()
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)

        
        let duration = self.transitionDuration(transitionContext)
        
        let bounds = UIScreen.mainScreen().bounds
        let toFrame = toVC!.view.frame
        var endFrame = CGRect(x: (bounds.width - toFrame.width) / 2,
                              y: (bounds.height - toFrame.height) / 2,
                              width: toFrame.width, height: toFrame.height)

        if isPresenting {
            
            fromVC?.view.userInteractionEnabled = false
            
            transitionContainer?.addSubview(fromVC!.view)
            transitionContainer?.addSubview(toVC!.view)
            
            var startFrame = endFrame
            startFrame.origin.y += 1000
            
            toVC?.view.frame = startFrame
            
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 0.8, options: [], animations: {
                    
                    fromVC?.view.tintAdjustmentMode = .Dimmed
                    toVC?.view.frame = endFrame
                                        
                }, completion: { (finished) in
                    transitionContext.completeTransition(true)
            })
            
        } else {
            
            toVC?.view.userInteractionEnabled = true
            
            transitionContainer?.addSubview(toVC!.view)
            transitionContainer?.addSubview(fromVC!.view)
            
            endFrame.origin.y += 1000
            
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 0.8, options: [], animations: {
                                        
                                        toVC?.view.tintAdjustmentMode = .Automatic
                                        fromVC?.view.frame = endFrame
                                        
                }, completion: { (finished) in
                    transitionContext.completeTransition(true)
                    UIApplication.sharedApplication().keyWindow!.addSubview(toVC!.view)
            })
        }
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        
        return self
    }

}
