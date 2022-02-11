//
//  Diary.swift
//  Diary
//
//  Created by 임동혁 on 2022/01/30.
//

import Foundation

struct Diary {
    var uuidString: String // 일기를 생성할 때마다 일기를 특정할 수 있는 고유한 uuid값, indexPath가 아닌 uuid로 수정
    var title: String // 제목
    var contents: String // 내용
    var date: Date // 날짜
    var isStar: Bool // 즐겨찾기 여부
}
