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
    var currentEnergyCases: [EnergyCase] = []

    var isViewAppeared: Bool = false

    var progressValue: CGFloat {
        if isViewAppeared {
            switch currentState {
            case .superpower:
                return 1
            case .character:
                return 2
            case .mountain:
                return 3
            case .energy:
                return 4
            }
        } else {
            return 0
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
        case .energy:
            currentEnergyCases.isEmpty
        }
    }

    var superpowerDescription: String {
        switch currentSuperpowerCase {
        case .teleportation:
            "\nI'd like to handle tasks without being constrained by time or place."
        case .invisibility:
            "\nI'd appreciate the focus to quietly immerse myself in work."
        case .future:
            "\nI'd like the ability to make strategic decisions with foresight."
        case .communication:
            "\nI'd aim to communicate and collaborate smoothly with various people."
        case nil:
            ""
        }
    }

    var characterDescription: String {
        switch currentCharacterCase {
        case .explorer:
            "\nI want to work with people who seek innovation and fresh ideas."
        case .meditator:
            "\nI enjoy harmonizing different opinions and leading team unity."
        case .strategist:
            "\nI prefer solving problems with people who work methodically and strategically."
        case .creator:
            "\nI thrive in a creative environment where ideas can be freely shared."
        case nil:
            ""
        }
    }

    var mountainDescription: String {
        switch currentMountainCase {
        case .smallGoals:
            "\nI’d prefer to tackle each challenge one by one."
        case .teamSupport:
            "\nI’d like to rely on my team in tough situations."
        case .variousMethod:
            "\nI’d look for creative solutions to overcome obstacles."
        case .analyze:
            "\nI’d use an organized and swift approach to reach the summit."
        case nil:
            ""
        }
    }

    func setCurrentStateOnContinueTap() {
        switch currentState {
        case .superpower:
            currentState = .character
        case .character:
            currentState = .mountain
        case .mountain:
            currentState = .energy
        case .energy:
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

    func setEnergyCase(_ energyCase: EnergyCase) {
        if currentEnergyCases.contains(energyCase) {
            if let index = currentEnergyCases.firstIndex(of: energyCase) {
                currentEnergyCases.remove(at: index)
            }
        } else {
            currentEnergyCases.append(energyCase)
        }
    }
}

enum CurrentState {
    case superpower
    case character
    case mountain
    case energy
}

enum SuperpowerCase: String, Identifiable, CaseIterable {
    var id: String {
        return self.rawValue
    }

    case teleportation = "Teleportation"
    case invisibility = "Invisibility"
    case future = "Future Prediction"
    case communication = "Mind Reading"
}

enum CharacterCase: String, Identifiable, CaseIterable {
    var id: String {
        return self.rawValue
    }

    case explorer = "Adventurous Explorer"
    case meditator = "Harmonious Mediator"
    case strategist = "Thorough Strategist"
    case creator = "Flexible Creator"
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

enum EnergyCase: String, Identifiable, CaseIterable {
    var id: String {
        return self.rawValue
    }

    case first = "A buzzing hive"
    case second = "Mountain Peaks"
    case third = "Clear Paths"
    case fourth = "Swift Currents"
    case fifth = "Creative Mess"
    case sixth = "Campfire warmth"
    case seventh = "Solo Trails"
    case eighth = "Mountain peaks"
    case ninth = "Shared horizons"
    case tenth = "Wandering winds"
}
