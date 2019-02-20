//
//  ViewController.swift
//  Image Downloader_12월26일
//
//  Created by 흠냐방구 on 26/12/2018.
//  Copyright © 2018 흠냐방구. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDownloadDelegate {


    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    var downloadTask:URLSessionDownloadTask!
    
    @IBAction func downloadAction(_ sender: Any) {
        imgView.image = nil
        // 이미지를 한번 다운로드 받고 다시 받으면, 이미지를 없애주는 코드
        indicatorView.startAnimating()
        // indicator 움직이게 하는 코드
        let sessionConfiguration = URLSessionConfiguration.default
        // 첫번째 단계로 SessionConfiguration 만들기
        let session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: OperationQueue.main)
        // 두번째 단계로 URLSession 객체 만들기.
//        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!)
        downloadTask = session.downloadTask(with: URL(string: "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg")!, completionHandler: {(data, response, error) -> Void in
            let dataTemp:Data = try! Data(contentsOf: data!)
            self.imgView.image = UIImage(data: dataTemp)
            self.indicatorView.stopAnimating()
            
        })
        
        downloadTask.resume()
        // resume() 해줘야 url 다운로드 시작함.
    }
    @IBAction func suspendAction(_ sender: Any) {
        downloadTask.suspend()
    }
    @IBAction func resumeAction(_ sender: Any) {
        downloadTask.resume()
    }
    @IBAction func cancelAction(_ sender: Any) {
        downloadTask.cancel()
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        // required 메써드
        let dataTemp:Data = try! Data(contentsOf: location)
        // URL(location)로 받은 파일을 Data로 변환시켜서 dataTemp에 넣어주는거임.
        // location에 있는 데이터를 받아서 dataTemp에 저장해준거임.
        // try-catch문으로 해준거임. 검색하면 뭐 많이 나오는데 잘 모르겠음.
        self.imgView.image = UIImage(data: dataTemp)
        // 특정 데이터에 해당하는 이미지를 콜하는 코드임. 자세한 설명은 캡쳐사진에 있음.
        indicatorView.stopAnimating()
        // 실제적으로 다운로드가 끝나는 곳이 여기이므로 여기에 stopAnimating 프로퍼티를 써줄것.
        
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        // progressView가 진척되는 상황을 보여주는 코드.
        let progress:Float = Float(totalBytesWritten)/Float(totalBytesExpectedToWrite)
        // 100% 다운로드 되면 나눈 값이 1이 됨.
        progressView.setProgress(progress, animated: true)
        // progressView의 animating을 true로 선언해줌.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

