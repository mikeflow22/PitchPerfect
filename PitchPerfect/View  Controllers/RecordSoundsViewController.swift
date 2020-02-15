//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Michael Flowers on 2/15/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet var recordButtonProperties: UIButton!
    @IBOutlet var stopRecordingProperties: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingProperties.isEnabled = false
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording in Progress"
        stopRecordingProperties.isEnabled = true
        recordButtonProperties.isEnabled = false
        
        //get the directory path
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
              let recordingName = "recordedVoice.wav"
              let pathArray = [dirPath, recordingName]
              let filePath = URL(string: pathArray.joined(separator: "/"))

        //create session object bc this is what is needed to record and play back
              let session = AVAudioSession.sharedInstance()
              try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)

              try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
              audioRecorder.isMeteringEnabled = true
              audioRecorder.prepareToRecord()
              audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
        recordButtonProperties.isEnabled = true
        stopRecordingProperties.isEnabled = false
        recordingLabel.text = "Tap to Record"
        
    }
}

