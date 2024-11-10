//
//  RecommendationView.swift
//  INJAE
//
//  Created by 박현수 on 11/10/24.
//

import SwiftUI

struct RecommendationView: View {
    @State var viewModel: RecommendationViewModel = .init()
    var body: some View {
        VStack(spacing: 0) {
            TitleAndCinnamon()
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.recommendations.indices, id: \.self) { idx in
                        RecommendationCell(
                            viewModel: viewModel,
                            idx: idx
                        )
                    }
                }
                .padding(.horizontal, 16)
            }
            Spacer()
            SendButton(viewModel: viewModel)
        }
        .background(Color(hex: "#A75835"))
    }
}

private struct TitleAndCinnamon: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("What could be your\nCinnamon Role?")
                .font(.system(size: 38, weight: .bold))
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .zIndex(1)
            HStack {
                Spacer()
                Image(.bread)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.top, -40)
            }
            .zIndex(0)
        }
        .padding(.horizontal, 16)
    }
}

private struct RecommendationCell: View {
    let viewModel: RecommendationViewModel
    let idx: Int
    var body: some View {
        Button {
            withAnimation {
                viewModel.setSelectedIdx(idx)
            }
        } label: {
            HStack(spacing: 9) {
                Image(viewModel.recommendations[idx].img)
                VStack(alignment: .leading, spacing: 0) {
                    Text(viewModel.recommendations[idx].name)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(.black)
                    Text(viewModel.recommendations[idx].role)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.top, 6)
                        .foregroundStyle(.black)
                    Text(viewModel.recommendations[idx].description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundStyle(Color(hex: "#3F3F44"))
                        .padding(.top, 16)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(12)
            .background(idx == viewModel.selectedIdx ? Color(hex: "#F8DA80") : .white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

private struct SendButton: View {
    let viewModel: RecommendationViewModel
    var body: some View {
        Button {
            viewModel.goToConnected = true
        } label: {
            Text(viewModel.selectedIdx == nil ? "Send my Cinnamon Role" : "Send")
                .foregroundStyle(.white)
                .font(.system(size: 14, weight: .bold))
                .padding(.vertical, 17)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#C5683F"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.horizontal, 16)
                .disabled(viewModel.selectedIdx == nil)
                .opacity(viewModel.selectedIdx == nil ? 0.3 : 1)
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    RecommendationView()
}
