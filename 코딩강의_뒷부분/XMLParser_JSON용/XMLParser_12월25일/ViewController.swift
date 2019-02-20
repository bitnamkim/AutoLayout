//
//  ViewController.swift
//  XMLParser_12월25일
//
//  Created by 흠냐방구 on 25/12/2018.
//  Copyright © 2018 흠냐방구. All rights reserved.
//

import UIKit

struct Weather:Decodable{
    let country:String
    let weather:String
    let temperature:String
    // 구조체를 만들어서 json 데이터를 받아주는거임. decodable 타입을 선언한 이유는 내려 받은 json 파일을 decode해야하기 때문에.
}

class ViewController: UIViewController, UITableViewDataSource {
    
    var datalist = [Weather]()
    // weather 구조체를 담는 역할을 하는 배열을 만들어준거임.
    // 구조체에서 받은 json 파일을 디코딩 한 후, 구조체를 여러개 만들어서 배열을 만들면 컨트롤 하기 편함.
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonURLString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/swift4weather.json"
        guard let jsonURL = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data,response,error) -> Void in
            guard let data = data else {return}
            // data를 받아서 상수에 넣을거임. 값을 무조건 받아야 해서 안돼도 걍 return 받아야 하니까 else도 return 값 줌.
            // closure 문법임. 앞에 Image Downloader 강의에서 했음. 다시 복습해서 상기 시킬것.
            
            do {
                self.datalist = try JSONDecoder().decode([Weather].self, from: data)
                // jsonDecoder의 decode 프로퍼티를 사용해서 datalist에 데이터를 넣을거임.
                // closure 문법 내부에 있기 때문에 datalist앞에 self. 붙여준거임.
                // [Weather].self -> .self는 인스턴스가 아닌 타입을 리턴해주는거임 (아이북스에 필기있음)
            } catch {
                print("Parsing Error \(error)")
                
            }
            // 에러 잡는 문법 -> do-catch (아이북스에 필기있음)
        }).resume()
        // URLSession 만들고 .resume() 해줘야 시작됨.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        // datalist가 이제 구조체가 되었으니 key:value로 접근이 안됨. struct는 .으로 접근하는거임.
        
        let structTemp = datalist[indexPath.row]
        cell.countryLabel.text = structTemp.country
        cell.temperatureLabel.text = structTemp.temperature
        let weatherStr = structTemp.weather
        cell.weatherLabel.text = weatherStr
        
        
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
    
    


}

