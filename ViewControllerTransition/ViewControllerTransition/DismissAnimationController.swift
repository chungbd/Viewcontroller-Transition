//
//  DismissAnimationController.swift
//  ViewControllerTransition
//
//  Created by Benjamin on 12/20/16.
//  Copyright © 2016 Chung BD. All rights reserved.
//

import UIKit

class DismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning{
    var destinationFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromVC = transitionContext.viewController(forKey: .from),
            let snapshoot = fromVC.view.snapshotView(afterScreenUpdates: false),
            let toVC = transitionContext.viewController(forKey: .to) else {
                return
        }
        
        let containerView = transitionContext.containerView
        
        let finalFrame = destinationFrame
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshoot)
        toVC.view.isHidden = true
        fromVC.view.backgroundColor = UIColor.white
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseIn, animations: {
            snapshoot.frame = finalFrame
        }) { (_) in
            toVC.view.isHidden = false
            fromVC.view.isHidden = false
            snapshoot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
}
