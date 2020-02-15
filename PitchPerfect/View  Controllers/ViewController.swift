//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Michael Flowers on 2/15/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet var recordButtonProperties: UIView!
    @IBOutlet var stopRecordingProperties: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording in Progress"
    }
    
    @IBAction func stopRecording(_ sender: UIButton) {
    }
}

