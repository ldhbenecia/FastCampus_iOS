//
//  DiaryDetailViewController.swift
//  Diary
//
//  Created by 임동혁 on 2022/01/30.
//

import UIKit

protocol DiaryDetailViewDelegate: AnyObject {
    func didSelectDelete(indexPath: IndexPath)
}

class DiaryDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateLabel: UILabel!
    weak var delegate: DiaryDetailViewDelegate?
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
        self.delegate?.didSelectDelete(indexPath: indexPath)
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func tapStarButton() {
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    } // 관찰이 필요 없을때는 observer 없앨 수 있음
}
