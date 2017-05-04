//
//  SurveyTask.swift
//  ResearchKitTest
//
//  Created by Brandon on 5/4/17.
//  Copyright © 2017 Brandon. All rights reserved.
//

import ResearchKit

public var SurveyTask: ORKOrderedTask {
    
    var steps = [ORKStep]()
    
    //MARK: add instructions step
    let instructionStep = ORKInstructionStep(identifier: "IntroStep")
    instructionStep.title = "The Questions Three"
    instructionStep.text = "Who would cross the Bridge of Death must answer me these questions three, ere the other side they see."
    steps += [instructionStep]
    
    //MARK: MARK name question
    let nameAnswerFormat = ORKTextAnswerFormat(maximumLength: 20)
    nameAnswerFormat.multipleLines = false
    let nameQuestionStepTitle = "What is your name?"
    let nameQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nameQuestionStepTitle, answer: nameAnswerFormat)
    steps += [nameQuestionStep]
    
    //MARK: add 'what is your quest' question
    let questQuestionStepTitle = "What is your quest?"
    let textChoices = [
        ORKTextChoice(text: "Create a ResearchKit App", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "seek the Holy Grail", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
        ORKTextChoice(text: "Find a shrubbery", value: 2 as NSCoding & NSCopying & NSObjectProtocol)]
    let questAnswerFormat: ORKTextChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
    let questQuestionStep = ORKQuestionStep(identifier: "TextChoiceQuestionStep", title: questQuestionStepTitle, answer: questAnswerFormat)
    steps += [questQuestionStep]
    
    //MARK: add color question step
    let colorQuestionSteptitle = "What is your favorite color?"
    let colorTuples = [
    (UIImage(named: "red")!, "Red"),
    (UIImage(named: "orange")!, "Orange"),
    (UIImage(named: "yellow")!, "Yellow"),
    (UIImage(named: "green")!, "Green"),
    (UIImage(named: "blue")!, "Blue"),
    (UIImage(named: "purple")!, "Purple"),]
    
    let imageChoices: [ORKImageChoice] = colorTuples.map {
        return ORKImageChoice(normalImage: $0.0, selectedImage: nil, text: $0.1, value: $0.1 as NSCoding & NSCopying & NSObjectProtocol)
    }
    
    let colorAnswerFormat: ORKImageChoiceAnswerFormat =
    ORKAnswerFormat.choiceAnswerFormat(withImageChoices: imageChoices)
    let colorQuestionStep = ORKQuestionStep(identifier: "ImageChoiceQuestionStep", title: colorQuestionSteptitle, answer: colorAnswerFormat)
    steps += [colorQuestionStep]
    
    //MARK: add summary step
    let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
    summaryStep.title = "Right. Off you go!"
    summaryStep.text = "That was easy"
    steps += [summaryStep]
    
    return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
}
