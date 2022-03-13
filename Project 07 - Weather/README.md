# I learned this from this project
#### 2022.03.13 ~ 2022.03

## :: FastCampus_iOS

- Seventh Project :: Weather

##### 30 projects for Practicing iOS

* APIKEY가 입력된 코드를 함부로 github에 올리면 안된다는 점을 깨닫고 커밋 전체 삭제
* git에 commit하기 전에 APIKEY를 감추는 것도 학습 후에 숨긴 이후 커밋할 예정

* HTTP 통신
 * URL Session

 * 날씨 API를 서버로부터 입력받기 위해 openweathermap.org에서 API Key를 받고 서울의 날씨를 입력받을 수 있어짐

 * Json 데이터를 가져오기 위해 새로운 swift file -> WeatherInforamtion 파일을 하나 생성
 * Codable 프로토콜 채택
     - Encodable 프로토콜과 Decodable 프로토콜이 합친 타입
     - JSON 데이터 형식을 사용하기 위해서는 구조체를 생성해야 하는데 이때 상속받아 선언하면 됨
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
