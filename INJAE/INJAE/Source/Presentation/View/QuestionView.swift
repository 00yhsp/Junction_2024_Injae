//
//  QuestionView.swift
//  INJAE
//
//  Created by 박현수 on 11/9/24.
//

import SwiftUI

struct QuestionView: View {
    @State var viewModel: QuestionViewModel = .init()
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            TopBarLogo()

            StatusBar(viewModel: viewModel)

            switch viewModel.currentState {
            case .superpower:
                SuperpowerView(viewModel: viewModel)
            case .character:
                CharacterView(viewModel: viewModel)
            case .mountain:
                MountainView(viewModel: viewModel)
            }
        }
    }
}

private struct TopBarLogo: View {
    var body: some View {
        HStack {
            Text("CINNAMON\nRoLe")
                .font(.moveSans(weight: .medium, size: 28))
                .lineSpacing(5.6)
                .foregroundStyle(Color(hex: "#C5683F"))
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

private struct StatusBar: View {
    let viewModel: QuestionViewModel
    var body: some View {
        HStack(spacing: 0) {
            BreadProgressView(progressValue: viewModel.progressValue)
                .animation(.easeInOut(duration: 0.3), value: viewModel.progressValue)
            Spacer()
        }
        .padding(.horizontal, -20)
        .padding(.vertical, 21)
    }
}

private struct SuperpowerView: View {
    let viewModel: QuestionViewModel
    var body: some View {
            Text("What superpower would you like to have?")
                .font(.system(size: 38, weight: .bold))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)

            Spacer()

        ForEach(SuperpowerCase.allCases) { sup in
            Button {
                viewModel.setCurrentSuperpowerCase(sup)
            } label: {
                Text(sup.rawValue)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(viewModel.currentSuperpowerCase == sup ? Color.white : Color.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 17)
                    .background(viewModel.currentSuperpowerCase == sup ? Color(hex: "#A75835") : Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 1)
                            .opacity(viewModel.currentSuperpowerCase == sup ? 0 : 1)
                    )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }

        Spacer()

        ContinueButton(viewModel: viewModel)
    }
}

private struct CharacterView: View {
    let viewModel: QuestionViewModel
    var body: some View {
            Text("What kind of character would you be?")
                .font(.system(size: 36, weight: .bold))
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)

            Spacer()

        ForEach(CharacterCase.allCases) { chr in
            Button {
                viewModel.setCurrentCharacterCase(chr)
            } label: {
                Text(chr.rawValue)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(viewModel.currentCharacterCase == chr ? Color.white : Color.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 17)
                    .background(viewModel.currentCharacterCase == chr ? Color(hex: "#A75835") : Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 1)
                            .opacity(viewModel.currentCharacterCase == chr ? 0 : 1)
                    )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }

        Spacer()

        ContinueButton(viewModel: viewModel)
    }
}

private struct MountainView: View {
    let viewModel: QuestionViewModel
    var body: some View {

        Text("If you were climbing a very tall mountain, what strategies would you use along the way to get to the top?")
            .font(.system(size: 32, weight: .bold))
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 16)

        Spacer()

        ForEach(MountainCase.allCases) { mtn in
            Button {
                viewModel.setCurrentMountainCase(mtn)
            } label: {
                Text(mtn.rawValue)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(viewModel.currentMountainCase == mtn ? Color.white : Color.black)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 17)
                    .background(viewModel.currentMountainCase == mtn ? Color(hex: "#A75835") : Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(.black, lineWidth: 1)
                            .opacity(viewModel.currentMountainCase == mtn ? 0 : 1)
                    )
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }

        Spacer()

        ContinueButton(viewModel: viewModel)
    }
}

private struct ContinueButton: View {
    let viewModel: QuestionViewModel
    var body: some View {
        Button {
            viewModel.setCurrentStateOnContinueTap()
        } label: {
            Text("Continue")
                .font(.system(size: 14, weight: .bold))
                .foregroundStyle(Color.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 17)
                .background(Color(hex: "#A75835"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 25)
        .disabled(viewModel.currentSuperpowerCase == nil)
        .opacity(viewModel.currentSuperpowerCase == nil ? 0.3 : 1)
    }
}

private struct BreadProgressView: View {
    var progressValue: CGFloat

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: UIScreen.main.bounds.width / progressValue)

                Image(.bread)
                    .resizable()
                    .frame(width: 27, height: 27)
                    .rotationEffect(.degrees((3 - progressValue) * CGFloat(360)))
            }

            Divider()
                .frame(width: UIScreen.main.bounds.width / progressValue)
                .background(Color.black)
        }
    }
}


#Preview {
    QuestionView()
}
