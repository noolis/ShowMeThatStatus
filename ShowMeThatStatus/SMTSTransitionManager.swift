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
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let transitionContainer = transitionContext.containerView
        let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)

        
        let duration = self.transitionDuration(using: transitionContext)
        
        let bounds = UIScreen.main.bounds
        let toFrame = toVC!.view.frame
        var endFrame = CGRect(x: (bounds.width - toFrame.width) / 2,
                              y: (bounds.height - toFrame.height) / 2,
                              width: toFrame.width, height: toFrame.height)

        if isPresenting {
            
            fromVC?.view.isUserInteractionEnabled = false
            
            transitionContainer.addSubview(fromVC!.view)
            transitionContainer.addSubview(toVC!.view)
            
            var startFrame = endFrame
            startFrame.origin.y += 1000
            
            toVC?.view.frame = startFrame
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 0.8, options: [], animations: {
                    
                    fromVC?.view.tintAdjustmentMode = .dimmed
                    toVC?.view.frame = endFrame
                                        
                }, completion: { (finished) in
                    transitionContext.completeTransition(true)
            })
            
        } else {
            
            toVC?.view.isUserInteractionEnabled = true
            
            transitionContainer.addSubview(toVC!.view)
            transitionContainer.addSubview(fromVC!.view)
            
            endFrame.origin.y += 1000
            
            UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5,
                                       initialSpringVelocity: 0.8, options: [], animations: {
                                        
                                        toVC?.view.tintAdjustmentMode = .automatic
                                        fromVC?.view.frame = endFrame
                                        
                }, completion: { (finished) in
                    transitionContext.completeTransition(true)
                    UIApplication.shared.keyWindow!.addSubview(toVC!.view)
            })
        }
        
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = true
        
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresenting = false
        
        return self
    }

}
