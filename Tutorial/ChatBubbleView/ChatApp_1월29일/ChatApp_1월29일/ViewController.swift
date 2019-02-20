//
//  ViewController.swift
//  ChatApp_1월29일
//
//  Created by 흠냐방구 on 29/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextViewDelegate {

    
    @IBOutlet weak var myTableView: UITableView!
    
    //        { didSet{
//            mainTableView.delegate = self
//            mainTableView.dataSource = self
//        }
//    }
    
    @IBOutlet weak var mainTextView: UITextView!
    //         { didSet{
//            mainTextView.delegate = self
//        }
//    }
    
    @IBOutlet weak var mainTextViewBottom: NSLayoutConstraint!
    @IBOutlet weak var mainTextViewHeight: NSLayoutConstraint!
    
    var dataList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.register(UINib(nibName: "Mycell", bundle: nil), forCellReuseIdentifier: "myCell_ID")
        myTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell_ID")
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        
        let keyboardHeight = keyboardFrame.size.height
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            
            self.mainTextViewBottom.constant = keyboardHeight - self.view.safeAreaInsets.bottom
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            
            self.mainTextViewBottom.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell_ID", for: indexPath) as! MyCell
            
            myCell.myCellTextView.text = dataList[indexPath.row]
            
            return myCell
            
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell_ID", for: indexPath) as! YourCell
            
            yourCell.yourCellTextView.text = dataList[indexPath.row]
            
            return yourCell
            
        }
    }
    
    @IBAction func sendAction(_ sender: Any) {
        dataList.append(mainTextView.text)
        
        let lastIndexPath = IndexPath(row: dataList.count - 1, section: 0)
        myTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        myTableView.insertRows(at: [lastIndexPath], with: .automatic)
        mainTextView.text = ""
        mainTextViewHeight.constant = 40
    }
    
    func textViewDidChange(_ textView: UITextView) {
        // 입력할 때 마다 텍스트뷰의 정보를 가져올 수 있음. 입력받는 텍스트뷰의 크기를 계속 갱신할 때 사용.
        
        if textView.contentSize.height <= 40 {
            // 내부 컨텐츠의 높이가 40보다 작으면
            mainTextViewHeight.constant = 40
            // 전체 텍스트뷰의 높이는 40으로 픽스
        } else if textView.contentSize.height >= 100 {
            mainTextViewHeight.constant = 100
        } else {
            mainTextViewHeight.constant = textView.contentSize.height

}
}
}
