//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Venkat Kurapati on 16/10/2016.
//  Copyright © 2016 Kurapati. All rights reserved.
//

import UIKit
import AVFoundation
class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL : NSURL!
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : Timer!
    
    enum ButtonType: Int {
        case slow = 0, Fast, chipmunk , vader , Echo , Reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Play"
        setupAudio()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        configureUI(playState: .NotPlaying)
    }
    
    @IBAction func playSoundForButton(_sender : UIButton){
        print("Play Sound Button Pressed")
        switch ButtonType(rawValue: _sender.tag)! {
        case .slow:
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        configureUI(playState: .Playing)
    }
   
    @IBAction func stopButtonPressed(_sender: AnyObject){
        print("Stop Audio Button Pressed")
        stopAudio()
    }
}
