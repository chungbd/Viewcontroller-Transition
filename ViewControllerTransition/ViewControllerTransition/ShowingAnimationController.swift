//
//  CustomizeAnimationController.swift
//  ViewControllerTransition
//
//  Created by Chung BD on 12/19/16.
//  Copyright © 2016 Chung BD. All rights reserved.
//

import UIKit

class ShowingAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    var originFrame = CGRect.zero
    
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
        
//        let initialFrame = originFrame
//        let finalFrame = transitionContext.finalFrame(for: toVC)
        
        containerView.addSubview(toVC.view)
        containerView.addSubview(snapshoot)
        toVC.view.isHidden = true
        
        let duration = transitionDuration(using: transitionContext)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: { 
            snapshoot.transform = CGAffineTransform(scaleX: 4, y: 4)
        }) { (_) in
            toVC.view.isHidden = false
            snapshoot.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
