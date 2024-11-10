//
//  RecommendationViewModel.swift
//  INJAE
//
//  Created by 박현수 on 11/10/24.
//

import Foundation

struct RecommendationModel: Identifiable {
    var id: String {
        return name + role
    }
    let img: String
    let name: String
    let role: String
    let description: String
}

@Observable
final class RecommendationViewModel {
    var recommendations: [RecommendationModel] = [
        .init(img: "aava", name: "Aava", role: "Developer", description: "a prominent healthcare provider that has been serving the Finnish"),
        .init(img: "sitra", name: "Sitra", role: "Developer", description: "focuses on promoting sustainability and well-being in Finland"),
        .init(img: "kone", name: "KONE", role: "Developer", description: "a global elevator and escalator manufacturing company")
    ]
    var selectedIdx: Int?
    var goToConnected: Bool = false

    func setSelectedIdx(_ idx: Int) {
        if selectedIdx == idx {
            selectedIdx = nil
        } else {
            selectedIdx = idx
        }
    }
}
