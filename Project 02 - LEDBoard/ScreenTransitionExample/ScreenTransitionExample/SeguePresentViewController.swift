//
//  SeguePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 임동혁 on 2022/01/26.
//

import UIKit

class SeguePresentViewController: UIViewController {

    @IBAction func tapBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
