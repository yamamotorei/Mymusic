//
//  ViewController.swift
//  MyMusic
//
//  Created by 高橋燦太 on 2020/10/26.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //シンバルの音源ファイルを指定
    let cymbalPath = Bundle.main.bundleURL.appendingPathComponent("cymbal.mp3")
    
    //シンバル用のプレイヤーインスタンスを作成
    var cymbalPlayer = AVAudioPlayer()

    
    @IBAction func cymbal(_ sender: Any) {
       soundplayer(player: &cymbalPlayer, path: cymbalPath, count: 0)
    }
    
    //ギターの音源ファイルを指定
    let guitarPath = Bundle.main.bundleURL.appendingPathComponent("guitar.mp3")

    //ギター用のプレイヤーインスタンスを作成
    var guitarPlayer = AVAudioPlayer()
    
    
    @IBAction func guitar(_ sender: Any) {
        soundplayer(player: &guitarPlayer, path: guitarPath, count: 0)
    }
    
    //バックミュージックの音源ファイルを指定
    let backmusicPath = Bundle.main.bundleURL.appendingPathComponent("backmusic.mp3")
    
    //バックミュージックのプレイヤーインスタンスを作成
    var backmusicPlayer = AVAudioPlayer()
    
    
    @IBAction func play(_ sender: Any) {
        soundplayer(player: &backmusicPlayer, path: backmusicPath, count: -1)
    }
    
    //stop
    @IBAction func stop(_ sender: Any) {
        //backmusicstop
        backmusicPlayer.stop()
    }
    
    //共通
    fileprivate func soundplayer(player:inout AVAudioPlayer, path: URL, count: Int){
        do{
            player = try AVAudioPlayer(contentsOf: path, fileTypeHint: nil)
            player.numberOfLoops = count
            player.play()
        }catch{
            print("エラーが発生しました！")
        }
    }
    
}

