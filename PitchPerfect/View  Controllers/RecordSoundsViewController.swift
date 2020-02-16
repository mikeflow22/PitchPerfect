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
    
//    var audioRecorder: AVAudioRecorder!
    var audioRecorderController = AudioRecorderController.shared
    
    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet var recordButtonProperties: UIButton!
    @IBOutlet var stopRecordingProperties: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordingProperties.isEnabled = false
    }
    
    func configureUI(isRecording: Bool){
        recordingLabel.text = isRecording ? "Recording in progress" : "Tap to record"
        stopRecordingProperties.isEnabled = isRecording
        recordButtonProperties.isEnabled = !isRecording
        isRecording ? self.audioRecorderController.startRecording(delegate: self) : self.audioRecorderController.audioRecorder.stop()
    }
    
//    func startRecording(){
//        //create the directory path to save the recording
//               let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
//               let recordingName = "recordedVoice.wav"
//               let pathArray = [dirPath, recordingName]
//               let filePath = URL(string: pathArray.joined(separator: "/"))
//               print(filePath ?? "nothing found")
//
//               //create session object bc this is what is needed to record and play back
//               let session = AVAudioSession.sharedInstance()
//               try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
//
//               try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
//               audioRecorder.delegate = self
//               audioRecorder.isMeteringEnabled = true
//               audioRecorder.prepareToRecord()
//               audioRecorder.record()
//    }
    
    @IBAction func recordAudio(_ sender: UIButton) {
        self.configureUI(isRecording: true)
    }
    
    
    @IBAction func stopRecording(_ sender: UIButton) {
      self.configureUI(isRecording: false)
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundVC.recordedAudioURL = recordedAudioURL
        }
    }
}

extension RecordSoundsViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender:self.audioRecorderController.audioRecorder.url /*audioRecorder.url*/)
        } else {
            print("recording was not successful")
        }
    }
}
