//
//  MainViewController.swift
//  SpotifyLoginSampleApp
//
//  Created by 임동혁 on 2022/06/25.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        
        // 버튼 클릭 시 첫 화면으로 이동
        self.navigationController?.popToRootViewController(animated: true)
    }
}
