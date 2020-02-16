//
//  AudioRecorderController.swift
//  PitchPerfect
//
//  Created by Michael Flowers on 2/15/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit
import AVFoundation

class AudioRecorderController {
    static let shared = AudioRecorderController()
    var audioRecorder: AVAudioRecorder!
    
    func startRecording(delegate: AVAudioRecorderDelegate){
        //create the directory path to save the recording
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        print(filePath ?? "nothing found")
        
        //create session object bc this is what is needed to record and play back
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = delegate
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    
}
