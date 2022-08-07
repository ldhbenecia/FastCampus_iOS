# I learned this from this project
#### 2022.06.24 ~ 2022.08.06

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
    - Firebase의 API-Key는 Google 서버에서 Firebase 프로젝트만 식별하기 때문에 보안에 문제가 되지 않는다가 결론
    
* LogOut 에러처리를 do-try-catch문으로 처리

* Google 로그인을 사용하려면 맞춤 URL Schems를 구성해야함
    - 처음 Firebase에서 가져온 GoogleService-Info에서 reverse client id를 복사해서  
    프로젝트 target info에서 URL Types을 추가하고 URL Schemes에 붙여넣기 하면 사전작업 끝

* Xcode 버전에 따라 Cocoapod 설치 등 오류가 너무 많이 나서 06.29(수)에 친 코드 전부 Reset
    - 화가 난다..,
* 구글 로그인 기능을 위해 podfile에 pod 'GoogleSignIn' 이후 터미널에서 pod install을 하면  
    - [!] Unable to read the license file `LICENSE` for the spec `GoogleUtilities (7.7.0)` 에러 발생
    -> podfile.lock 삭제 이후 pod install 하였더니 해결 됨



* 지속되는 오류로 인해 잠시 중단 - 2022.08.06(토)

* 구글 로그인 기능을 전부 다시 리셋 시킨 이후에도 No such module FirebaseAuth와 Command EmitSwiftModule failed with a nonzero exit code 오류가 발생
    - shift, command, k 버튼을 통해서 정리 한번 하니 다시 이 오류가 해결되고 빌드 실행 되어 다시 기능 구현 시도
    - 2022.08.07(일)
* import GoogleSignIn이 자동완성이 되지 않아 Xcode에 적용이 되지않았음을 깨달음
    - podfile에서 pod 'GoogleSignIn', '5.0.2'를 하고 pod install을 할 시 에러가 발생하고 계속해서 import가 되지 않음
    - pod 'GoogleSignIn'을 하여 GoogleSignIn을 해서 pod에 설치를 한 후 '5.0.2'을 했으나 그래도 해결되지 않음
    - pod update를 함. Firebase 버전들이 9.2.0에서 9.4.0으로 업데이트 되고 pod이 정돈 된 것 같음
    - 그 후 pod install을 하였더니 해결됨
* 이메일 로그인 구현 코드 작성이 끝났고 드디어 해결했나 싶었더니 또 다시 arm64 오류 발생
    - SpotifyLoginSampleApp/Pods/GoogleSignIn/Frameworks/GoogleSignIn.framework/GoogleSignIn' for architecture arm64
    - 이 오류를 고쳐야 다음 단계로 넘어갈 수 있음
