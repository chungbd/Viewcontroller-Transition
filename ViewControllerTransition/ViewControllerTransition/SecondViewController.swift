//
//  SecondViewController.swift
//  ViewControllerTransition
//
//  Created by Chung BD on 12/19/16.
//  Copyright © 2016 Chung BD. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

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
        
    }
    // MARK: - Public Methods
    class func instantiate() -> SecondViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
    }
    
    // MARK: - IB Outlet Action
    @IBAction func touchUpInside_btn(sender: UIButton) {
        
    }

    @IBAction func touchUpInside_btnBack(sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Touch handle
    //    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    //    {
    //        self.view.endEditing(true)
    //        super.touchesBegan(touches, withEvent: event)
    //    }
    
    // MARK: -

}
