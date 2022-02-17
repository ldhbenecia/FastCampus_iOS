//
//  ViewController.swift
//  pomodoro
//
//  Created by 임동혁 on 2022/02/15.
//

import UIKit

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progreeView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    
    var duration = 60
    var timerStatus: TimerStatus = .end // Timer의 상태, enum에 열거되어있음
    var timer: DispatchSourceTimer?
    var currentSeconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    func setTimerInfoViewVisble(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progreeView.isHidden = isHidden
    }
    
    // 시작버튼을 눌렀을 때 일시정지가 되도록 구현
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main)
            self.timer?.schedule(deadline: .now(), repeating: 1)
            self.timer?.setEventHandler(handler: { [weak self] in
                self?.currentSeconds -= 1
                debugPrint(self?.currentSeconds)
                
                if self?.currentSeconds ?? 0 <= 0 {
                    self?.startTimer()
                    // 타이머가 종료
                }
            })
            self.timer?.resume()
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false //취소버튼 비활성화
        self.setTimerInfoViewVisble(isHidden: true) // TimerLabel, progreeView 표시 x
        self.datePicker.isHidden = false
        self.toggleButton.isSelected = false //시작
        self.timer?.cancel()
        self.timer = nil
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.stopTimer()
        
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        self.duration = Int(self.datePicker.countDownDuration) // datePicker에서 설정한 타이머 시간을 초로 가져올 수 있음
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            self.setTimerInfoViewVisble(isHidden: false) // timerLabel, progreeView 나타남
            self.datePicker.isHidden = true
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false //시작
            self.timer?.suspend() // 타이머 일시정지
        
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true //일시정지
            self.timer?.resume() // 타이머 재시작
        }
    }
}

