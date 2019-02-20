//
//  ViewController.swift
//  ChattingApp_진도1월26일
//
//  Created by 흠냐방구 on 26/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextViewDelegate {

    
    
    
    @IBOutlet weak var chattingTableView: UITableView! {
        didSet{
            chattingTableView.delegate = self
            chattingTableView.dataSource = self
            // storyboard에서 연결해줘도 되는데, 이렇게 코드로 연결하는게 확실함.
            
            chattingTableView.separatorStyle = .none
            // Cell이 한 칸 한 칸씩 구분되어서 UI에 나타나는걸 없애주는거임.
        }
    }
    
    var chatData = [String]()
    // 내 데이터랑 상대방 데이터는 구분하지않고 chatData 한 개의 array에 넣어줌.
    
    
    @IBOutlet weak var inputTextView: UITextView! {
        didSet{
            inputTextView.delegate = self
            // storyboard 에서 해줘도 되는데, 이렇게 코드로 하는게 확실함.
    
        }
    }
    @IBOutlet weak var inputTextViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 외부 소스파일로 만든 Cell을 내부 TableView에서 사용할려면 Register 해줘야함. 공식 같은거임. 꼭 해줘야하는거임.
        
        chattingTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell_ID")
        chattingTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell_ID")
        
        
        // 키보드 관련 옵저버가 필요함 - 옵저버 패턴은 상태가 변하는것을 알려주는거임. 아래 코드는 옵저버 패턴을 선언해주는거임.
        // 키보드가 올라올때, 내려갈 때 옵저버가 필요함.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        // self : 상태변화를 파악하는 대상이 현재 ViewController이면 self를 사용.
        // Selector : 호출되는 상태가 변경됐을때 사용할 function이 필요함. #selector 해주고 아래 선언한 함수 입력하기.
        // name : 키보드가 나타날 때, 옵저버가 작동되게 설정해준 코드임.
        // object: 연결해서 전달할 객체가 있으면 설정해주는거임. 없으니까 nil.
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    // 💥💥 키보드 관련된 객체 사용할 때 아래 함수 사용함. 잘 숙지할것!
    @objc func keyboardWillShow(noti: Notification) {
        // 키보드 올라올 때, 이 함수 호출됨.
        let notiInfo = noti.userInfo!
        // noti는 파라미터이고 userInfo는 관련된 정보를 받는다는 뜻임. userInfo는 딕셔너리 타입임
        
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        // keyboardFrameEndUserInfoKey -> 전체 크기의 완전한 키보드를 가져오는 코드임.
        // alt누르고 keyboardFrame 눌러보니까 타입이 Any? 이렇게 나왔음. 이건 타입을 제대로 못 가져온거임. 그래서 CGRect라는 프레임 형태로 Type Casting(형변환)을 해줬음.
        
        let keyboardHeight = keyboardFrame.size.height
        // 키보드의 높이를 가져온거임.
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        // 정확하게 키보드가 움직이는 시간을 가져오는 코드. 아래 코드 withDuration값에 0.5초 애니메이션 값을 주는것도 가능한데, 위 코드처럼 해주는게 정확함.
        // animationDuration 타입이 Any? 이거 라서, TimeInterval로 형변환 해줬음.
        
        
        UIView.animate(withDuration: animationDuration) {
            // 키보드에 애니메이션을 설정하여 부드럽게 나타나게 해주는거임.
            
            self.inputTextViewBottomConstraint.constant = keyboardHeight - self.view.safeAreaInsets.bottom
            // 키보드 높이랑 constraint 값을 동일하게 설정해줘야 키보드가 constraint 값(=키보드 크기)만큼 위로 올라오는거임.
            // 아이폰X 계열의 경우 safeArea를 기준으로 키보드 UI가 잡히기 때문에,safeAreaInsets.bottom을 빼줘야함. 안 빼주면 키보드 위에 작은공백이 생김.
            
            self.view.layoutIfNeeded()
            // 뷰를 갱신하는 코드
        }
        
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        
        UIView.animate(withDuration: animationDuration) {
            self.inputTextViewBottomConstraint.constant = 0
            // 키보드 나타나게 하는 함수랑은 다르게, constraint값 0으로 설정해줘야 키보드가 없어짐.
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    @IBAction func sendAction(_ sender: Any) {
        
        chatData.append(inputTextView.text)
        // inputTextView에 입력되는 텍스트들은 chatData안에 저장되어야함.
        
        let lastIndexPath = IndexPath(row: chatData.count - 1, section: 0)
        // 가장 최근에 입력한 말풍선 텍스트가 가장 최신(가장 밑으로)으로 내려오게 하는 코드. 원하는 위치(indexPath)로 이동하는 코드. 자연스럽게 대화가 이어지면서 스크롤 내리게하는 효과를 주는 코드임.
        // row 개수는 chatData의 숫자만큼 넣어주는거임. section은 현재 섹션을 1개밖에 사용하지 않으니 0값을 주는거임. 섹션값은 0,1,2... 이렇게 증가함.
        // row의 개수는 0부터 시작하니까 총 개수에 -1을 해줘야 마지막 row의 위치값을 설정해줄 수 있음.
        
        chattingTableView.scrollToRow(at: lastIndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
        // 가장 최근에 입력한 말풍선 텍스트가 가장 최신(가장 밑으로)으로 내려오게 하는 코드. 원하는 위치(indexPath)로 이동하는 코드. 자연스럽게 대화가 이어지면서 스크롤 내려주는 효과주는 코드임.
        // 해당 Cell이 아래까지 나와야 하므로 UITableView.ScrollPosition.bottom 입력.
        
        
        chattingTableView.insertRows(at: [lastIndexPath], with: UITableView.RowAnimation.automatic)
        // 추가하는 로우(추가되는 말풍선)만 갱신하는 개념임. 테이블뷰 전체를 갱신하는 개념이 아님.
        // at: [lastIndexPath] -> 배열 개념이라서 여러 인자 들어갈 수 있는데, 지금은 한개만 넣을거니까 [lastIndexPath] 써줌.
        // with: UITableView.RowAnimation.automatic -> .automatic 써주는게 일반적임.
        
//        chattingTableView.reloadData()
        // 테이블뷰를 갱신하는 코드. 데이터에 맞춰서 테이블 뷰를 로드해서 뿌려주는 코드.
        // 테이블뷰 전체를 갱신하는 코드이기 때문에, 테이블뷰의 애니메이션이 이상하게 적용됨(말풍선이 튕기는 효과). 그래서 잘 사용안함.
        
        inputTextView.text = ""
        // 메세지 전송한 후에 메세지 내용이 사라지고 inputTextView에 있던 텍스트들이 빈칸(초기화)이 됨.
        
        inputTextViewHeight.constant = 40
        // inputTextViewHeight의 기본값을 40으로 설정. 이렇게 해야 항상 기본 사이즈를 유지함. 이렇게 안하면 이전에 전송한 텍스트가 엄청 길었을 경우 그 크기의 텍스트뷰 하이츠가 그대로 나옴.
        
        
        
     
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            
            // 짝수 일 때는 myCell 구현, 홀수 일 때는 yourCell 구현 시켜라!
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell_ID", for: indexPath) as! MyCell
            // 형변환 해줘야 MyCell 클래스에 접근 가능 & 프로퍼티 가져올 수 있음.
            
            myCell.myCellTextView.text = chatData[indexPath.row]
            // chatData안에 있는 인덱스 팻쓰 로우의 위치에 가서 텍스트를 myCellTextView로 가져오는거임.
            
            myCell.selectionStyle = .none
            // cell을 클릭했을때, 회색이 나오는데 이 코드 쓰면 회색이 없어짐.
            
            return myCell
            
        } else {
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell_ID", for: indexPath) as! YourCell
            yourCell.yourCellTextView.text = chatData[indexPath.row]
            
            yourCell.selectionStyle = .none
            // cell을 클릭했을때, 회색이 나오는데 이 코드 쓰면 회색이 없어짐.
            
            return yourCell
    }
    
}
    func textViewDidChange(_ textView: UITextView) {
        // 입력할 때 마다 텍스트 뷰의 정보를 가져올 수 있음. 입력받는 텍스트뷰의 크기를 계속 갱신할 때 사용함.
        
        
        
        // 💥 textView = 텍스트가 써지는 텍스트뷰의 내부. 내부 텍스트뷰에 여러 줄을 쓰면 내부 텍스트가 써지면서, 그 때 생기는 내부 높이를 가져올 수 있음.
        // 💥 inputTextViewHegiht = IBOutlet으로 연결해준 TextView의 외부 높이. textView.contentSize.height랑 비교하면서 텍스트 길이에 따라 textView의 Height(높이)를 조절해줌.
        if textView.contentSize.height <= 40 {
            // 내부 텍스트의 높이가 40보다 작다면
            inputTextViewHeight.constant = 40
            // inputTextViewHeight(외부 컨텐츠뷰 높이)를 40으로 고정시켜라.
        } else if textView.contentSize.height >= 100 {
            inputTextViewHeight.constant = 100
        } else {
            inputTextViewHeight.constant = textView.contentSize.height
            // 컨텐츠 높이가 40~100 사이일 경우 내부 컨텐츠 높이랑 외부 TextView 높이가 같이 늘어났다 줄어들었다해줄거임.
        }
    }

}
