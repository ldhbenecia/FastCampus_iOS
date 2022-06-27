# I learned this from this project
#### 2022.06.24 ~ 2022.

## :: FastCampus_iOS

- Ninth Project :: Spotify-Login-Sample-App

##### 30 projects for Practicing iOS

* 애플 정책에 따라 어플 로그인 화면에 애플 계정 로그인 기능도 넣어야 함
* Firebase 연결 이후 pod init, pod install을 하게 되는데 pod이 설치된 이후에는 workspace파일에서 작업을 진행해야 설치한 pod을 연결해서 사용할 수 있음
* pod 파일에 pod 'Firebase/Auth' 명령어 추가해준 후 pod install
* 마지막으로 AppDelegate.swift 파일에 들어가서 Firebase를 Import해준 이후  
  FirebaseApp.configure() // Firebase 초기화 코드 작성

* Firebase 서버로 이메일 아이디를 받는데 이미 등록된 이메일일 경우, 이메일이 아닐 경우 등등 에러처리
* 에러일 경우 self.errorMessageLabel.text = error.localizedDescription 코드를 통해 자동으로 에러메세지 출력

* Firebase를 백엔드로 사용하여 API Key가 그대로 올라와있다는 메일을 또 받음
    - 다시 커밋 히스토리를 전부 지워야하나 생각해보고 문서 서칭
    - Firebase의 API-Key는 Google 서버에서 Firebase 프로젝트만 식별하기 때문에 본안에 문제가 되지 않는다가 결론
