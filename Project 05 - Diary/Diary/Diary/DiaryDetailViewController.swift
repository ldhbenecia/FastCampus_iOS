//
//  DiaryDetailViewController.swift
//  Diary
//
//  Created by 임동혁 on 2022/01/30.
//

import UIKit

/*
 일기장 상세화면에서 삭제 또는 즐겨찾기 토글이 일어나게 되면 델리게이트를 통해 일기장 화면의 indexPath와 즐겨찾기 여부를 전달하고 있음
 이렇게 되면 일대일로만 데이터를 전달할 수 있기 때문에 일기장 화면에서 일기장 상세화면으로 이동했을 때는 일기장 화면에만 델리게이트가 전달할 수 있고 즐겨찾기 화면에서 상세화면으로 이동했을 때는 즐겨찾기 화면에만 델리게이트를 전달할 수 있음
 그래서 이 델리게이트를 다 걷어내고 노티피케이션센터를 이용해서 일기장 상세화면에서 삭제 또는 즐겨찾기 토글 행위가 발생하면
 일기장 화면과 즐겨찾기 화면의 이벤트가 모두 전달되도록 로직을 변경
 */

// delegate를 notification으로 전부 로직 수정
// 1. 즐겨찾기 토글이 일어났을 때 indexPath와 즐겨찾기 여부를 노티피케이션센터로 전달하는 코드 작성
// 2. 삭제 기능
// 3. 즐겨찾기 수정 삭제 노티피케이션 이벤트를 즐겨찾기 화면에 옵저빙 해서 이벤트가 일어나면 일기장 화면과 즐겨찾기 화면 모두 동기화
// 4. 즐겨찾기 한 일기 즐겨찾기 화면에 추가

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    var starButton: UIBarButtonItem? // 일기 상세화면에서 right bar 버튼에 즐겨찾기 버튼 추가
    
    var diary: Diary?
    var indexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    private func configureView() {
        guard let diary = self.diary else { return }
        self.titleLabel.text = diary.title
        self.contentsTextView.text = diary.contents
        self.dateLabel.text = self.dateToString(date: diary.date)
        self.starButton = UIBarButtonItem(image: nil, style: .plain, target: self, action: #selector(tapStarButton))
        self.starButton?.image = diary.isStar ? UIImage(systemName: "star.fill") : UIImage(systemName: "star") // image에 즐겨찾기가 되어있으면 userimage에 system이미지를 star.fill로 색칠된 별로 표시를 해주고 false 이면 userimage에 system이미지를 테두리만 있는 별을 표시
        self.starButton?.tintColor = .orange
        self.navigationItem.rightBarButtonItem = self.starButton // rightBarButton에 star표시 나옴
    }
    
    // date타입을 전달받으면 문자열로 만드는 함수
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 mm월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko-KR")
        return formatter.string(from: date)
    }
    
    @objc func editDiaryNotification(_ notification: Notification){
        guard let diary = notification.object as? Diary else { return }
        guard let row = notification.userInfo?["indexPath.row"] as? Int else { return }
        self.diary = diary
        self.configureView() // 수정된 내용으로 view 업데이트
    } // 수정된 diary 객체를 전달받아 뷰에 업데이트 되도록, post에서 보낸 수정된 diary 객체를 가져옴
    
    @IBAction func tapEditButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(identifier: "WriteDiaryViewController") as? WriteDiaryViewController else { return }
        guard let indexPath = self.indexPath else { return }
        guard let diary = self.diary else { return }
        viewController.diaryEditorMode = .edit(indexPath, diary)
        
        //노티피케이션 옵저빙
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(editDiaryNotification(_:)), name: NSNotification.Name("editDiary"), object: nil)
        self.navigationController?.pushViewController(viewController, animated: true)
    } // 수정버튼을 누르면 일기 상세화면에서 WriteDiaryViewController로 이동
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        guard let indexPath = self.indexPath else { return }
        NotificationCenter.default.post(name: NSNotification.Name("deleteDiary"), object: indexPath, userInfo: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapStarButton() {
        guard let isStar = self.diary?.isStar else { return }
        guard let indexPath = self.indexPath else { return } // 옵셔널 바인딩
        if isStar {
            self.starButton?.image = UIImage(systemName: "star")
        } else {
            self.starButton?.image = UIImage(systemName: "star.fill") // 꽉찬 별
        }
        self.diary?.isStar = !isStar // true이면 false 대입, false이면 true 대입
        NotificationCenter.default.post(name: Notification.Name("starDiary"), object: [
            "diary": self.diary,
            "isStar": self.diary?.isStar ?? false,
            "indexPath": indexPath
        ],
                                        userInfo: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    } // 관찰이 필요 없을때는 observer 없앨 수 있음
}
