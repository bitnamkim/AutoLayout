//
//  ViewController.swift
//  JSONParser_1월28일
//
//  Created by 흠냐방구 on 28/01/2019.
//  Copyright © 2019 흠냐방구. All rights reserved.
//

import UIKit

struct Weather: Decodable {
    // Decodable 프로토콜을 선언해야 JSONDecoder가 Decode 할 수 있음.
    let country:String
    let weather:String
    let temperature:String
    
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var mainTableView: UITableView!
    // ⭐️ 테이블뷰 IBOutlet을 만들어서 테이블뷰 reload해줄거임. reload 해줘야 URLSession으로 JSON 파일을 다운로드 받을 수 있음. 그리고 그걸 파싱할거임.
    
    var dataList = [Weather]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonURLString = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/swift4weather.json"
        guard let jsonURL = URL(string: jsonURLString) else {return}
        URLSession.shared.dataTask(with: jsonURL, completionHandler: {(data, response, error) -> Void in
            
            // ⭐️ Closure 문법 부분은 '비동기임. 그래서 앱을 실행하면 백그라운드 스레드로 넘어가면서 날씨정보를 다운 받고 있음. 근데 정보를 다운받고 파싱되기 전에 TableView는 다 호출되어서 화면에 출력됨. 이 문제를 해결하기 위해선, 날씨 정보를 전부 다운받은 이후에 TableView를 reload 해주면 됨!
            
            guard let data = data else {return}
            // 데이터를 받아서 상수에 넣을거임. 데이터가 없다면(else) 바로 리턴하게 설정해줬음.
            
            do {
                self.dataList = try JSONDecoder().decode([Weather].self, from: data)
                // [Weather].self처럼 .뒤에 self가 붙으면 인스턴스가 아니라 그 자체(itself)를 불러온거임.
                // from: data는 위에 data, response, error 여기에 있는 data를 말하는거임.
                
//                print("datalist : \(self.dataList)")
                
                DispatchQueue.main.async(execute: {
                    self.mainTableView.reloadData()
                })
                // DispatchQueue 클래스 써줘서, 비동기로 백그라운드 스레드의 작업을 메인 스레드로 올려줬음.
                
                
            }catch{
                // 에러가 발생하면 에러값을 잡을 수 있음.
                print("Parsing Error \(error)")
                
            }
            
        }).resume()
        // 세션을 만들고 resume을 해줘야 URLSession을 로드함.
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        let structTemp = dataList[indexPath.row]
        
        
        let weatherStr = structTemp.weather
        cell.weatherLabel.text = weatherStr
        
        
        cell.countryLabel.text = structTemp.country
        cell.temperatureLabel.text = structTemp.temperature
        // struct는 .으로 프로퍼티에 접근함
        
        if weatherStr == "흐림" {
            cell.imgView.image = UIImage(named: "cloudy.png")
        } else if weatherStr == "눈보라" {
            cell.imgView.image = UIImage(named: "blizzard.png")
        } else if weatherStr == "비" {
            cell.imgView.image = UIImage(named: "rainy.png")
        } else if weatherStr == "눈" {
            cell.imgView.image = UIImage(named: "snow.png")
        } else {
            cell.imgView.image = UIImage(named: "sunny.png")
        }
        
        return cell
    }


}

