# I learned this from this project
#### 2022.03.13 ~ 2022.03.16

## :: FastCampus_iOS

- Seventh Project :: Weather

##### 30 projects for Practicing iOS

* APIKEY가 입력된 코드를 함부로 github에 올리면 안된다는 점을 깨닫고 커밋 전체 삭제
* git에 commit하기 전에 APIKEY를 감추는 것도 학습 후에 숨긴 이후 커밋할 예정

* HTTP 통신
    - 클라이언트가 서버에 요청 하면 그에 맞는 응답결과를 돌려주고 클라이언트는 사용자에게 서버로부터 응답받은 결과를 보여줌
    - 현재 도시의 날씨 정보를 서버에 요청하면 서버가 현재 도시 날씨를 응답해주고 앱에서 사용자에게 서버로부터 응답받은 날씨 정보를 화면에 표시되게 함
 * URL Session
    - 애플에서 서버와 데이터를 주고받기 위해 만든 프로토콜
    - currentWeatherAPI를 호출하여 서버로부터 현재 날씨를 호출받을 수 있었음

 * 날씨 API를 서버로부터 입력받기 위해 openweathermap.org에서 API Key를 받고 서울의 날씨를 입력받을 수 있어짐

 * Json 데이터를 가져오기 위해 새로운 swift file -> WeatherInforamtion 파일을 하나 생성
 * Codable 프로토콜 채택
     - Encodable 프로토콜과 Decodable 프로토콜이 합친 타입
     - JSON 데이터 형식을 사용하기 위해서는 구조체를 생성해야 하는데 이때 상속받아 선언하면 됨
     - WeatherInformation 구조체와 ErrorMessage 구조체의 codable을 채택해서 서버로부터 응답받은 json 데이터가 weatherinformaton, errormessage 객체에 매핑되게함
 * CodingKey
  - struct 구조체 안에 enum CodingKey 열거형을 선언하고 그 안에 값을 할당하여 변경할 수 있음
  - enum CodingKeys: String, CodingKey {  
         // 구조체에서 정의한 프로퍼티와 서버에서 내려주는 Jaon데이터 값이 달라도 정상적으로 연결해줄 수 있응  
         case temp  
         case feelsLike = "feels_like"  
         case minTemp = "temp_min"  
         case maxTemp = "temp_max"  
     }  
 * self.view.endEditing(true) // 버튼이 눌리면 키보드 사라짐

* 네트워크 작업은 별도의 쓰레드에서 진행되고 응답이 온다해도 자동으로 메인 쓰레드로 돌아오지 않기 때문에 컴플리션 핸들러 클로저에서 유아이 작업을 한다면 메인 쓰레드에서 작업을 할 수 있도록 만들어 줘야함. 메인쓰레드에서 작업을 할 수 있기 위한 코드
    - DispatchQueue.main.async {  
                self?.weatherStackView.isHidden = false  
                self?.configureView(weatherInformation:   weatherInformation) }  
                
* 잘못된 도시 이름을 입력했을 시 에러메세지를 알럿으로 표현 - 404 error
