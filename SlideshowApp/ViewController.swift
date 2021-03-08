//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 上田晃 on 2021/02/28.
//

import  UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var gobutton: UIButton!
    
    @IBOutlet weak var backbutton: UIButton!
    
    
    @IBOutlet var imageView: UIImageView!
    
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    // 配列に指定するindex番号を宣言
    var nowIndex:Int = 0
    
    // スライドショーに使用するタイマーを宣言
    var timer: Timer?
    
    // スライドショーさせる画像の配列を宣言
    let imageArray = [
        UIImage(named: "bakemono1")!,
        UIImage(named: "bakemono2")!,
        UIImage(named: "bakemono3")!,
        UIImage(named: "bakemono4")!
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageArray[0]
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        resultViewController.image = imageArray[nowIndex]
        
    }
    
    
    
    
    
    @IBAction func goButton(_ sender: Any) {
        
        
        if nowIndex == 3 {
            nowIndex = 0
        } else {
            nowIndex += 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func backButton(_ sender: Any){
        
        
        if nowIndex == 0 {
            nowIndex = 3
        } else {
            nowIndex -= 1
        }
        imageView.image = imageArray[nowIndex]
    }
    
    
    
    @IBAction func slideShowButton(_ sender: Any) {
        
        // 再生ボタンを押した時の処理
        
        // 再生中か停止しているかを判定
        if (timer == nil) {
            // 再生時の処理を実装
            
            // タイマーをセットする
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            
            
            // ボタンの名前を停止に変える
            startButton.setTitle("停止", for: .normal)
            gobutton.isEnabled = false
            backbutton.isEnabled = false
            
            
        } else {
            // 停止時の処理を実装
            // タイマーを停止する
            timer?.invalidate()
            
            // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
            timer = nil
            
            // ボタンの名前を再生に直しておく
            startButton.setTitle("再生", for: .normal)
            gobutton.isEnabled = true
            backbutton.isEnabled = true
            
        }
    }
    
    @objc func changeImage() {
        // indexを増やして表示する画像を切り替える
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        imageView.image = imageArray[nowIndex]
    }
    
    @IBAction func unwind(_ segue:UIStoryboardSegue) {
        
    }
}

