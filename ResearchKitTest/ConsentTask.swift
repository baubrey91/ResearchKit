//
//  ConsentTask.swift
//  ResearchKitTest
//
//  Created by Brandon on 5/4/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import ResearchKit

public var ConsentTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //MARK: add VisualConsentStep
    var consentDocument = ConsentDocument
    let visualConsentStep = ORKVisualConsentStep(identifier: "VisualConsentStep", document: consentDocument)
    steps += [visualConsentStep]
    
    //MARK: add ConsentReviewStep
    
    let signature = consentDocument.signatures!.first as! ORKConsentSignature
    let reviewConsentStep = ORKConsentReviewStep(identifier: "ConsentReviewStep", signature: signature, in: consentDocument)
    
    reviewConsentStep.text = "Review Consent!"
    reviewConsentStep.reasonForConsent = "Consent to join study"

    steps += [reviewConsentStep]
    return ORKOrderedTask(identifier: "ConsentTask", steps: steps)
}
