# I learned this from this project
#### 2022.01.30 ~

## :: FastCampus_iOS

- Fifth Project :: Diary

##### 30 projects for Practicing iOS


* 01.30 ~ 진행 중

* 2022.02.03 일기 작성, 삭제 기능구현
* tabBarController로 사용
* UICollectionView 사용
* DatePicker 코드로 구현
* UserDefaults 사용
* 코드에 주석 설명 처리

* 2022.02.04 일기장 수정 기능 구현
* Notification 사용

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
