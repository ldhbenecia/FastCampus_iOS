# I learned this from this project
#### 2022.02.15 ~ 2022.03.01

## :: FastCampus_iOS

- Sixth Project :: Pomodoro

##### 30 projects for Practicing iOS


* Pomodoro 기법
    - 타이머를 이용하여 25분간 집중하여 일을 한 다음 5분간 휴식을 취하는 방식
    - Pomodoro는 이탈리아어로 토마토를 뜻함
    
* 꼭 25분이 아닌 타이머에서 원하는 시간을 설정해서 시간이 지나면 알림이 울리는 타이머를 만들 것
* DispatchSourceTimer, UIView Animation을 활용할 것

* countDownDuration: 시간을 초로 가져올 수 있음

* timerLabel에 시간 초 줄어들게 설정
* self.progreeView.progress = Float(self.currentSeconds) / Float(self.duration)를 작성하여 progreeView도 시간이 줄어듦에 따라 줄어듦
* import AudioToolbox
    - AudioServicesPlaySystemSound(1005) // 1005번 알림음 출력
    
* DispatchSourceTimer
* UIView Animation
    - UIView.animate(withDuration: 0.5, animation: {  
    self.timerLabel.alpha = 0  
    self.progreeView.alpha = 0  
    self.datePicker.alpha = 1  
})
    - .alpha 코드를 통해 UIView 모습을 숨기거나 나타낼 수 있으며
    - imageView.transform 메서드를 통해 2D 그래픽을 구현 가능
