//
//  ViewController.swift
//  Expand_Cell
//
//  Created by 흠냐방구 on 09/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    // 1. 셀 안에 들어갈 텍스트가 필요함.
    // 2. expand 된 상태 or 일반 상태값 선언하는게 필요함.
    // 3. Model을 만들어서 값을 담아주기.
    
    struct ExpandDataModel {
        var description: String
        var isExpand : Bool
    }
    
    var dataList = [ExpandDataModel]()
    // 데이터들을 담는 배열을 만들어 놓은거임. 구조체를 배열에 담은거임.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        // 코드로 프로토콜 연결해주는거임. TalbeView Outlet으로 연결해주고 선언하기!
        
        let textArray = ["short text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long text",
                         "short text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long text",
                         "short text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long text",
                         "short text",
                         "long long long long long long long long long long long long long long long long long long long long long long long long text"
                         ]
        for (_, value) in textArray.enumerated() {
            // enumerated : textArray 내부에 있는 index와 value 데이터들을 한번에 다 가져와서 사용하는거.

            dataList.append(ExpandDataModel.init(description: value, isExpand: true))
            // struct 초기화 하는 방법 : struct이름.init(value, false)
            // index는 지금 여기서 사용하지 않기 때문에 _(언더 스코어) 해줬음.
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expandCell_ID", for: indexPath) as! ExpandCell
        // 형변환(Type Casting을 통해서 ExpandCell에 접근했음. 그래서 IBOutlet 가져올 수 있었음.
        
        cell.descriptionLabel.text = dataList[indexPath.row].description
        
        if dataList[indexPath.row].isExpand == false {
            // 맨 처음에 나타나는 Cell의 상태는 축소된 상태임. true 해주면 맨 처음에 나타나는 Cell의 상태는 확장된 상태라는거임.
            cell.descriptionLabel.numberOfLines = 0
            // 0이면 dataList에 들어있는 데이터 개수만큼 라인을 늘리라는거임.
        } else {
            cell.descriptionLabel.numberOfLines = 1
        }
        
        cell.selectionStyle = .none
        // 텍스트가 많은 Cell이 확장되었다가 줄어들 때 회색깔이 생기면서 줄어듦. 이 코드를 사용하면 회색깔 안 나타나게 해줌.
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        <#code#>
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 특정 row를 클릭했을 때 작동하는 메써드
        
        dataList[indexPath.row].isExpand = !dataList[indexPath.row].isExpand
        // dataList의 Cell이 확장되어 있지 않으면 확장시켜주고, 확장 되어있으면 축소시키라는뜻.
        // toggleButton 같은 개념임. FlightBooking 강의 할 때도 이거 했었음.
        
        
//        tableView.reloadRows(at: [indexPath], with: .none)
        // tableView는 자동으로 갱신되지 않음. 그래서 reload해줘야함
        // 여기서 at은 didSelectRow, 그러니까 클릭된 row의 indexPath임. 애니메이션은 필요 없으니까 .none 해주면 됨.
        // 근데 이렇게 하면 Cell이 확장 되거나 축소 될 때 렉이 걸림. 애니메이션 효과가 뻑이 남. 오토 레이아웃으로 구성된 크기, 좌표들은 TableViewCell을 만나면 변형되기 쉬움. 그래서 변형이 일어났을 때 애니메이션 효과가 뻑이남. 이런 이슈들을 해결하기위해서 아래 방법들을 사용해야함.
        
        // 1️⃣ 위에 선언한 heightForRowAt 메써드로 직접 하이트 값 입력해주기 -> 애니메이션 뻑나는 이슈 확실히 해결 가능!
        // 2️⃣ tableView.reloadData() -> 뻑나는 이슈 어느정도 해결! 이게 제일 좋은거 같다. 근데 Cell이 확장 될 때 좀 뻑뻑하게 됨.
        // 3️⃣ tableView.estimatedSectionFooterHeight = 0 tableView.estimatedSectionFooterHeight = 0 테이블뷰의 위쪽 부분과 아래쪽 부분에 estimated 값을 없애주면 뻑나는 이슈 해결 가능함.
        // 4️⃣ 애니메이션 효과 없애는 코드(지금 활성화 된 코드) -> 확실히 해결 ( tableView.reloadData()이랑 비슷하게 해결되는거같음 )
        UIView.setAnimationsEnabled(false)
        tableView.reloadRows(at: [indexPath], with: .none)
        UIView.setAnimationsEnabled(true)
        // 맨 처음에는 애니메이션 꺼준 상태에서 reload 해서 데이터 불러와야함. reload 다 되면 다시 true로 해줘야 테이블 뷰 쎌을 제외한 다른 객체들도 애니메이션이 정상작동함.
        
    }
    
}

