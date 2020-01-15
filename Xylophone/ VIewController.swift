//
//  ViewController.swift
//  Xylophone


import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        let currentColor = sender.backgroundColor
        let correctTag = sender.tag
        sender.backgroundColor = UIColor.gray
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            sender.backgroundColor = currentColor
        }
        playSound(sender)
        

    }
    
    func playSound(_ s: UIButton) {
        let soundURL = Bundle.main.url(forResource: "note" + String(s.tag), withExtension: "wav")
        
        do {
            print(s.tag)
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }

}

