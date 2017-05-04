//
//  ConsentDocument.swift
//  ResearchKitTest
//
//  Created by Brandon on 5/4/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import ResearchKit

public var ConsentDocument: ORKConsentDocument {
    
    let consentDocument = ORKConsentDocument()
    consentDocument.title = "Example Consent"
    
    //MARK: consent section
    let consentSectionTypes: [ORKConsentSectionType] = [
    .overview,
    .dataGathering,
    .privacy,
    .dataUse,
    .timeCommitment,
    .studySurvey,
    .studyTasks,
    .withdrawing]
    
    let consentSections: [ORKConsentSection] = consentSectionTypes.map { contentSectionType in
        let consentSection = ORKConsentSection(type: contentSectionType)
        consentSection.summary = "If you wish to complete this stud..."
        consentSection.content = "In this study you will be asked five (wait, no, three!) questions. You will also have your voice recorded for ten seconds"
        
        return consentSection
    }
    
    consentDocument.sections = consentSections
    
    //TODO: signature
    
    consentDocument.addSignature(ORKConsentSignature(forPersonWithTitle: nil, dateFormatString: nil, identifier: "ConsentDocumentParticipantSignature"))
    
    return consentDocument
}
