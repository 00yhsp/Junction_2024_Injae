//
//  QuestionViewModel.swift
//  INJAE
//
//  Created by 박현수 on 11/9/24.
//

import Foundation

@Observable
final class QuestionViewModel {
    var currentState: CurrentState = .superpower
    var currentSuperpowerCase: SuperpowerCase?
    var currentCharacterCase: CharacterCase?
    var currentMountainCase: MountainCase?

    var progressValue: CGFloat {
        switch currentState {
        case .superpower:
            return 3
        case .character:
            return 2
        case .mountain:
            return 1
        }
    }

    var isCompleted: Bool = false

    var isContinueButtonDisabled: Bool {
        switch currentState {
        case .superpower:
            currentSuperpowerCase == nil
        case .character:
            currentCharacterCase == nil
        case .mountain:
            currentMountainCase == nil
        }
    }

    func setCurrentStateOnContinueTap() {
        switch currentState {
        case .superpower:
            currentState = .character
        case .character:
            currentState = .mountain
        case .mountain:
            isCompleted = true
        }
    }

    func setCurrentSuperpowerCase(_ superpowerCase: SuperpowerCase) {
        if currentSuperpowerCase == superpowerCase {
            currentSuperpowerCase = nil
        } else {
            currentSuperpowerCase = superpowerCase
        }
    }

    func setCurrentCharacterCase(_ charcterCase: CharacterCase) {
        if currentCharacterCase == charcterCase {
            currentCharacterCase = nil
        } else {
            currentCharacterCase = charcterCase
        }
    }

    func setCurrentMountainCase(_ mountainCase: MountainCase) {
        if currentMountainCase == mountainCase {
            currentMountainCase = nil
        } else {
            currentMountainCase = mountainCase
        }
    }
}

enum CurrentState {
    case superpower
    case character
    case mountain
}

enum SuperpowerCase: String, Identifiable, CaseIterable {
    var id: String {
        return self.rawValue
    }

    case teleportation = "Teleportation"
    case invisibility = "Invisibility"
    case future = "Anticipate the future"
    case communication = "Strong communication skills"
}

enum CharacterCase: String, Identifiable, CaseIterable {
    var id: String {
        return self.rawValue
    }

    case explorer = "Challenged explorer"
    case meditator = "A harmonious mediator"
    case strategist = "Thorough strategist"
    case creator = "Flexible creator"
}

enum MountainCase: String, Identifiable, CaseIterable {
    var id: String {
        return self.rawValue
    }

    case smallGoals = "Set small goals and take it one step at a time"
    case teamSupport = "Work with a team to support each other"
    case variousMethod = "Find new paths by trying different methods"
    case analyze = "Quickly analyze problems and execute solutions"
}
