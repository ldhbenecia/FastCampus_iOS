# I learned this from this project
#### 2022.01.30 ~ 2022.02.11

## :: FastCampus_iOS

- Fifth Project :: Diary

##### 30 projects for Practicing iOS


* 2022.02.03 일기 작성, 삭제 기능구현
* UITabBarController 사용
    - 일기장 탭, 즐겨찾기 탭을 만들어 각각 다른 화면 구현
* UICollectionView 사용
    - TableView처럼 scrollView를 상속 받고 있음
    - 다양한 레이아웃을 보여줄 때 사용
* 프로토콜 채택
    - UIViewController 옆에 프로토콜 채택 코드를 작성하는 것 보다 ViewController를 밑에 extension하여 따로 만들어주면 가독을 높일 수 있음
* 2022.02.04 일기장 수정 기능 구현
* 2022.02.07 일기장 즐겨찾기 기능 구현

* UserDefaults
    - 처음에 사용하기 위해선 let userDefaults = UserDefaults.standard 같은 경우로 접근
    - 가져올 것 object를 사용할 때는 todoList때와 같이 Any 타입이므로 타입캐스팅을 해주며 타입캐스팅에 실패하면 nil이 될 수 있으므로 guard let 구문 사용하여 옵셔널 바인딩
    - 불러온 데이터를 diaryList 배열에 넣어주기 위해 compactMap 사용
* collectionView(_: didSelectItemAt:) 
    - 지정된 인덱스 경로에 있는 항목이 선택되었음을 알리는 메서드
    
* NotificationCenter로 로직을 변경하게 된 이유
    - 일기장 상세화면에서 삭제 또는 즐겨찾기 토글이 일어나게 되면 델리게이트를 통해 일기장 화면의 indexPath와 즐겨찾기 여부를 전달하고 있음
    이렇게 되면 일대일로만 데이터를 전달할 수 있기 때문에 일기장 화면에서 일기장 상세화면으로 이동했을 때는 일기장 화면에만 델리게이트가 전달할 수 있고 즐겨찾기 화면에서 상세화면으로 이동했을 때는 즐겨찾기 화면에만 델리게이트를 전달할 수 있음
    그래서 이 델리게이트를 다 걷어내고 노티피케이션센터를 이용해서 일기장 상세화면에서 삭제 또는 즐겨찾기 토글 행위가 발생하면 일기장 화면과 즐겨찾기 화면의 이벤트가 모두 전달되도록 로직을 변경
    
* delegate를 notification으로 전부 로직 수정
    1. 즐겨찾기 토글이 일어났을 때 indexPath와 즐겨찾기 여부를 노티피케이션센터로 전달하는 코드 작성
    2. 삭제 기능
    3. 즐겨찾기 수정 삭제 노티피케이션 이벤트를 즐겨찾기 화면에 옵저빙 해서 이벤트가 일어나면 일기장 화면과 즐겨찾기 화면 모두 동기화
    4. 즐겨찾기 한 일기 즐겨찾기 화면에 추가

* 2022.02.10 Notification 수정 끝

* Notification
    - var name: Notification.Name // 알림 식별 태그
    - var object: Any? // 발송자가 옵저버에게 보내려고 하는 객체. 주로 발송자 객체를 전달하는데 쓰임
    - var userInfo: [AnyHashable : Any]? // Notification과 관련된 값 또는 객체의 저장소
* NotificationCenter
    - 등록된 이벤트가 발생하면 해당 이벤트들에 대한 행동을 취함
    - 앱 내에서 아무데서나 메세지를 던지면 앱 내의 아무데서나 메세지를 받을 수 있게 함
    - 각 화면에서 일기 수정, 삭제, 즐겨찾기를 관찰하고 있다가 이벤트가 발생하면 그에 따른 처리를 해줌
    - NoticationCenter.default.post(name: , object: )
        - name에 해당되는 것들을 처리 바라는 코드(노티피게이션 발송)
    - NoticationCenter.default.addObserver(self, selcetor, name, object)
        - addObserver: 관찰자 대기, selector: 관찰자가 수행해야할 업무
        - 옵저버 등록
    - #selector를 위해 @objc 함수 많이 만듦

* 2022.02.11 에러처리 끝

<img width="1116" alt="스크린샷 2022-02-11 오후 8 02 34" src="https://user-images.githubusercontent.com/77393976/153582659-7a54f1aa-cfb6-4f08-91f5-34c0b1148426.png">
