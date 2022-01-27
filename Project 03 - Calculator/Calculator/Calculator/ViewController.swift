//
//  ViewController.swift
//  Calculator
//
//  Created by 임동혁 on 2022/01/27.
//

import UIKit

enum Operation {
    case Add
    case Subtract
    case Divide
    case Multiply
    case unknown
}

class ViewController: UIViewController {

    @IBOutlet weak var numberOutputLabel: UILabel!
    
    // 계산기 버튼을 누를때마다 numberOutputLabel에 표시될 숫자
    var displayNumber = ""
    
    // 이전 계산 값을 저장하는 프로퍼티
    var firstOperand = ""
    
    // 새롭게 입력된 값을 저장하는 프로퍼티
    var secondOperand = ""
    
    // 계산 결과 값
    var result = ""
    
    // 현재 계산기에 어떤 연산자가 입력되었는 지 알 수 있게 연산자 값을 저장하는 프로퍼티
    var currentOperation: Operation = .unknown
    
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutputLabel.text = self.displayNumber
            // numberOutputLabel에 displayNumber 값 나타남
        }
    }
    
    
    @IBAction func tapClearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutputLabel.text = "0"
        // 전부 다 빈 문자열로 바꾸고 0이 출력되게 함, 모든 값 초기화
    }
    
    @IBAction func tapDotButton(_ sender: UIButton) {
        if self .displayNumber.count < 8, self.displayNumber.contains(".") {
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            // 입력된 값이 비어있으면 0. 으로 시작하고 값이 있으면 그 뒤에 소수점 .이 붙음
            self.numberOutputLabel.text = self.displayNumber
        }
    }
    
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    @IBAction func tapMultiplyButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtract)
    }
    
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    func operation(_ operation: Operation) {
        if self.currentOperation != .unknown {
            if !self.displayNumber.isEmpty {
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                // 연산을 위해 저장해둔 값 Double형으로 변환
                guard let firstOperand = Double(self.firstOperand) else { return }
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtract:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                    
                default:
                    break
                }
                
                // 결과 값을 1로 나누어 소수가 아니라면 소수점이 표시 안되게 함
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0 {
                    self.result = "\(Int(result))"
                }
                
                self.firstOperand = self.result
                self.numberOutputLabel.text = self.result
            }
            
            self.currentOperation = operation
        } else {
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

