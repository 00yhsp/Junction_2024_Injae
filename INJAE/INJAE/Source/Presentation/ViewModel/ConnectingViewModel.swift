//
//  ConnectingViewModel.swift
//  INJAE
//
//  Created by 박현수 on 11/10/24.
//

import Foundation

@Observable
final class ConnectingViewModel {
    var isConnected: Bool = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.isShowingBuddy = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isLoading = false
            }
        }
    }
    var isShowingBuddy: Bool = false
    var isLoading: Bool = true
}
