//
//  MicrophoneTask.swift
//  ResearchKitTest
//
//  Created by Brandon on 5/4/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import ResearchKit

public var Microphone: ORKOrderedTask {
    return ORKOrderedTask.audioTask(withIdentifier: "AudioTask", intendedUseDescription: "A sentence prompt will be given to you to read", speechInstruction: "These are the last dying words of Joseph of Aramthea", shortSpeechInstruction: "The Holy Grail can be found in the Castle of Aaaaahh", duration: 10, recordingSettings: nil, options: [])
}
