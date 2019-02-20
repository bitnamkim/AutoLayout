//
//  ViewController.swift
//  XMLParser_12월25일
//
//  Created by 흠냐방구 on 25/12/2018.
//  Copyright © 2018 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITableViewDataSource {
    
    var datallist = [[String:String]]()
    var detaildata = [String:String]()
    // 배열에 딕셔너리 값을 넣는 방식을 사용하면 Table View에서 사용하기 쉬움.
    // local과 /local 사이에 있는  "국가, 날씨, 온도"가 한개의 딕셔너리임.
    var elementTemp:String = ""
    var blank:Bool = false
    // element 끝나는 부분에 blank(빈칸)가 값으로 잡혀서 원래 들어가야할 값이 자꾸 갱신돼서 안들어가짐. 그래서 blank 선언해준거임.
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        guard let baseURL = URL(string: urlString) else {
            print("URL error")
            return
            // guard 구문은 값이 항상 참일때 사용. if문이랑 비슷한 용도인데, 통신할 때 guard문을 주로 많이 사용함.
        }
        guard let parser = XMLParser(contentsOf: baseURL) else {
            print("Can't read data")
            return
            // return 써줘야 오류안남.
        }
        parser.delegate = self
        if !parser.parse() {
            print("Parse failure")
        }
        // parse() 이 메써드는 파싱을 최초 시작하게 하는 메서드
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datallist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        var dicTemp = datallist[indexPath.row]
        cell.countryLabel.text = dicTemp["country"]
        cell.temperatureLabel.text = dicTemp["temperature"]
        var weatherStr = dicTemp["weather"]
        cell.weatherLabel.text = weatherStr
        cell.imgView.image = UIImage(named: dicTemp["image"]!)
        
        if weatherStr == "맑음" {
            cell.imgView.image = UIImage(named: "sunny.png")
        } else if weatherStr == "흐림" {
            cell.imgView.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "비" {
            cell.imgView.image = UIImage(named: "rainy.png")
        } else if weatherStr == "눈" {
            cell.imgView.image = UIImage(named: "snow.png")
        } else {
            cell.imgView.image = UIImage(named: "blizzard.png")
        }
        
        return cell
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        elementTemp = elementName
        // string에서 나온 값을 여기에 쌓을거임. elementName을 key값으로 사용할거임.
        // 밑에 foundCharacters 메써드에서 elementTemp를 사용할 수 있게 하기 위해서 여기서 선언해줌.
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank == true && elementTemp != "weatherinfo" && elementTemp != "local" {
        // element 부분(국가, 날씨, 온도)만 깔끔하게 값으로 넣어주는 코드임.
        detaildata[elementTemp] = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        // elementTemp = key, String = value 이 방식으로 딕셔너리를 채울거임.
        // trimming~ 이 부분은 화이트 스페이스 같은 불필요한 부분 없애주는 프로퍼티임.
        }
    }
    // element와 element 사이에 있는 특정 문자를 찾아주는 메써드
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "local" {
            datallist += [detaildata]
        }
        // 한 개의 딕셔너리(detaildata)가 끝나면 datalist에 값을 넣어주는 코드.
        // 윗부분에서는 elementTemp가 맞고 이 부분은 elementName이 맞음.
        blank = false
    }

    
    
    
}

