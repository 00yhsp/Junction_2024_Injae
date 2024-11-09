//
//  BreadLoading.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import SwiftUI

struct BreadLoading: View {
    @State private var isAnimating = false
    
    var body: some View {
        Image(.bread)
            .resizable()
            .frame(width: 100, height: 100)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .animation(.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear {
                isAnimating = true
            }
    }
}

#Preview {
    BreadLoading()
}
