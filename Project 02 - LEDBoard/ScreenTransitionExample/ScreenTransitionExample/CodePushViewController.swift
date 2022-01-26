//
//  CodePushViewController.swift
//  ScreenTransitionExample
//
//  Created by 임동혁 on 2022/01/26.
//

import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    // Segue로 이동했을 시 popViewController을 통해 Back Button 뒤로 가기 가능
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 전달받은 name 프로퍼티를 nameLabel에 표시
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // size 안 짤리게 하는 함수
        }

        // Do any additional setup after loading the view.
    }

}
