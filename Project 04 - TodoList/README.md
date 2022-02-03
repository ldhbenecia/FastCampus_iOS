# I learned this from this project
#### 2022.01.29

## :: FastCampus_iOS

- Fourth Project :: TodoList

##### 30 projects for Practicing iOS


* TableView를 사용하여 TodoList 만듦
* 할 일을 추가할 때 UIAlertViewController를 이용해 알럿창 구성함 
* addTextField(configuration) 메서드를 이용하여 알럿에 텍스트필드 추가 (placeholder 사용)
* dequeueReusableCell 메서드는 지정된 재사용 식별자에 대한 재사용 가능한 테이블 뷰 셀 객체를 반환하고 이를 테이블 뷰에 추가하는 역할을 함
    - 지정된 재사용 식별자 = withIdentifier 파라미터는 idendifier값을 넘겨주면 이 값을 가지고 재사용할 셀을 찾는다. for 파라미터에는 indexPath를 넘겨주었음. 그 이유는 indexpath 위치의 해당 셀을 재사용하기 위해 indexPath를 넘겨주는 것
    - 이 메서드를 사용하는 이유는 수 많은 셀을 각각 만들어서 메모리에 할당 하면 메모리 낭비가 심하고 과부화가 올 수 있기 때문에 메모리 낭비를 방지하기 위해 사용하는 재사용 메서드. 
* UserDefaults
    - 런타임 환경에서 동작하면서 앱이 실행되는 동안 기본 저장소에 접근해 데이터를 기록하고 가져오는 역할을 하는 인터페이스  
        - 할일 저장, 앱을 재실행 했을 때 로컬에 저장한 할 일들을 불러오는 기능 구현
    - userDefaults.object(forKey: ) 메서드로 저장된 데이터 로드 가능, object 메서드는 Any타입으로 리턴되기 때문에 타입캐스팅을 해줘야 하며 타입 캐스팅에 실패하면 nil이 될 수 있으므로 guard let 구문 사용
    - func saveTask()로 userdefaults 할 일 저장
    - func load Task()로 userdefaults에 저장된 할 일들을 로드
    할 일 들이 추가될 때마다 saveTask() 메서드를 호출하여 할 일들을 저장하고 앱을 재실행 했을 때 저장된 할일들을 로드하는 코드 -> var tasks 프로퍼티에 프로퍼티 옵저버를 만듦  
    didSet을 통해 saveTasks 호출하고 viewDidLoad 시점에서 self.loadTasks() 메서드를 호출하여 저장된 할 일들을 불러오는 것 구현
    - didselectRowAt 메서드는 셍를 선택했을 때 어떤 셀이 선택되었는 지 알려줌
    
