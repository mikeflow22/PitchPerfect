//
//  AudioRecorder.swift
//  PitchPerfect
//
//  Created by Michael Flowers on 2/15/20.
//  Copyright © 2020 Michael Flowers. All rights reserved.
//

import AVFoundation

class AudioRecorder {
    var url: URL
    var settings: [String: Any]
    init(url: URL, settings: [String: Any] ) {
        self.url = url
        self.settings = settings
    }
}
