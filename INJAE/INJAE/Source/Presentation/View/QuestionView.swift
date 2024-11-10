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
        NavigationStack {
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
                case .energy:
                    EnergyView(viewModel: viewModel)
                }
            }
            .navigationDestination(isPresented: $viewModel.isCompleted) {
                MbtiView()
            }
            .onAppear {
                viewModel.isViewAppeared = true
            }
        }
    }
}

private struct TopBarLogo: View {
    var body: some View {
        HStack {
            Text("CINNAMON")
                .font(.moveSans(weight: .medium, size: 28))
                .lineSpacing(5.6)
                .foregroundStyle(Color(hex: "#C5683F"))
            
            Text("ROLe")
                .font(.moveSans(weight: .medium, size: 28))
                .lineSpacing(5.6)
                .foregroundStyle(Color(hex: "#C5683F"))
            
            Image(.bread)
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
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
            .font(.system(size: 24, weight: .bold))
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 16)
        
        Spacer()
        
        ForEach(SuperpowerCase.allCases) { sup in
            Button {
                viewModel.setCurrentSuperpowerCase(sup)
            } label: {
                VStack(spacing: 0) {
                    Text(sup.rawValue)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(viewModel.currentSuperpowerCase == sup ? Color.white : Color.black)
                    if sup == viewModel.currentSuperpowerCase {
                        Text(viewModel.superpowerDescription)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle( Color.white)
                            .padding(.horizontal)
                    }
                }
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
            .font(.system(size: 28, weight: .bold))
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 16)
        
        Spacer()
        
        ForEach(CharacterCase.allCases) { chr in
            Button {
                viewModel.setCurrentCharacterCase(chr)
            } label: {
                VStack(spacing: 0) {
                    Text(chr.rawValue)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(viewModel.currentCharacterCase == chr ? Color.white : Color.black)
                    if chr == viewModel.currentCharacterCase {
                        Text(viewModel.characterDescription)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle( Color.white)
                            .padding(.horizontal)
                    }
                }
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
            .font(.system(size: 28, weight: .bold))
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 16)
        
        Spacer()
        
        ForEach(MountainCase.allCases) { mtn in
            Button {
                viewModel.setCurrentMountainCase(mtn)
            } label: {
                VStack(spacing: 0) {
                    Text(mtn.rawValue)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(viewModel.currentMountainCase == mtn ? Color.white : Color.black)
                    if mtn == viewModel.currentMountainCase {
                        Text(viewModel.mountainDescription)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle( Color.white)
                            .padding(.horizontal)
                    }
                }
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

private struct EnergyView: View {
    let viewModel: QuestionViewModel
    let columns: [GridItem] = [.init(.flexible()), .init(.flexible())]
    
    var body: some View {
        Text("Where do you find energy?\nPick all that feel right.")
            .font(.system(size: 28, weight: .bold))
            .multilineTextAlignment(.leading)
            .padding(.horizontal, 16)
        
        Spacer()
        
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(EnergyCase.allCases) { egy in
                Button {
                    viewModel.setEnergyCase(egy)
                } label: {
                    Text(egy.rawValue)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundStyle(viewModel.currentEnergyCases.contains(egy) ? Color.white : Color.black)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 17)
                        .background(viewModel.currentEnergyCases.contains(egy) ? Color(hex: "#A75835") : Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(.black, lineWidth: 1)
                                .opacity(viewModel.currentEnergyCases.contains(egy) ? 0 : 1)
                        )
                }
            }
        }
        .padding(.horizontal, 16)
        
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
        .disabled(viewModel.isContinueButtonDisabled)
        .opacity(viewModel.isContinueButtonDisabled ? 0.3 : 1)
    }
}

private struct BreadProgressView: View {
    var progressValue: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                    .frame(width: (UIScreen.main.bounds.width - 10) / 4 * progressValue)
                
                Image(.bread)
                    .resizable()
                    .frame(width: 27, height: 27)
                    .rotationEffect(.degrees((4 - progressValue) * CGFloat(360)))
            }
            
            Divider()
                .frame(width: (UIScreen.main.bounds.width - 10) / 4 * progressValue)
                .background(Color.black)
        }
    }
}


#Preview {
    QuestionView()
}
