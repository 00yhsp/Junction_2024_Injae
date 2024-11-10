//
//  BreadLoading.swift
//  INJAE
//
//  Created by 박현수 on 11/10/24.
//

import SwiftUI

struct BreadLoading: View {
    @State private var isAnimating = false
    @State private var goToRecommendation: Bool = false

    var body: some View {
        ZStack {
            Color
                .white
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height
                )
            VStack(spacing: 0) {
                Image(.bread)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(isAnimating ? 360 : 0))
                    .animation(.linear(duration: 1.2).repeatForever(autoreverses: false), value: isAnimating)
                    .onAppear {
                        isAnimating = true
                    }
                Text("AI analyzing...")
                    .font(.system(size: 28, weight: .medium))
            }
        }
        .navigationBarBackButtonHidden()
        .navigationDestination(isPresented: $goToRecommendation) {
            RecommendationView()
        }
        .onTapGesture {
            goToRecommendation = true
        }
    }
}

#Preview {
    BreadLoading()
}
