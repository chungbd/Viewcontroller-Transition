//
//  ViewController.swift
//  ViewControllerTransition
//
//  Created by Chung BD on 12/19/16.
//  Copyright © 2016 Chung BD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var touchView: UIView!
    
    let showingAnimation = ShowingAnimationController()
    let dismissAnimationController = DismissAnimationController()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods
    private func initView() -> () {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handlingWhenTouchingOn(gesture:)))
        touchView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Public Methods
    //    class func instantiate() -> SpeakerVC {
    //        return UIStoryboard(name: "", bundle: nil).instantiateInitialViewController() as! SpeakerVC
    //    }
    
    func handlingWhenTouchingOn(gesture:UIGestureRecognizer)  {
        let secondVC = SecondViewController.instantiate()
        secondVC.transitioningDelegate = self
        present(secondVC, animated: true, completion: nil)
    }
    
    // MARK: - IB Outlet Action
    @IBAction func touchUpInside_btn(sender: UIButton) {
        
    }
    
    // MARK: - Touch handle
    //    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    //    {
    //        self.view.endEditing(true)
    //        super.touchesBegan(touches, withEvent: event)
    //    }
    
    // MARK: -

}

extension ViewController:UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return showingAnimation
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        dismissAnimationController.destinationFrame = touchView.frame
        return dismissAnimationController
    }
}
