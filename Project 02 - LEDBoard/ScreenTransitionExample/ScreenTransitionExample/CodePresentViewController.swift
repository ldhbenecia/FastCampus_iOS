//
//  CodePresentViewController.swift
//  ScreenTransitionExample
//
//  Created by 임동혁 on 2022/01/26.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePresentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    weak var delegate: SendDataDelegate? // delegate 변수 사용할 때는 weak var 사용
    
    // present로 이동했을 시 dismiss를 통해 Back Button 뒤로 가기 가능
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Benecia")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
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
