//
//  RoundButton.swift
//  Calculator
//
//  Created by 임동혁 on 2022/01/27.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var isRound: Bool = false {
        didSet {
            if isRound {
                self.layer.cornerRadius = self.frame.height / 2
                // 정사각형 버튼은 원이 되고 정사각형이 아닌 버튼은 모서리가 둥글게 변함
            }
        }
    }
}
