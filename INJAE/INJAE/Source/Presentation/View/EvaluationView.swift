//
//  EvaluationView.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import SwiftUI

struct EvaluationView: View {
    @State private var viewModel = EvaluationViewModel()
    
    var body: some View {
        VStack {
            TopBarLogo()
            
            HStack {
                Text("How was Aava?")
                    .font(Font.system(size: 26, weight: .bold))
                Spacer()
            }
            .padding(.bottom, 28)
            .padding(.top, 73)
            .padding(.leading, 16)
            
            ScrollView {
                createTitle(title: "Company Culture")
                ForEach(viewModel.companyCulture, id: \.self) { item in
                    SteppedProgressView(title: item, viewModel: viewModel)
                }
                .padding(.bottom, 20)
                
                createTitle(title: "Benefits")
                ForEach(viewModel.benefits, id: \.self) { item in
                    SteppedProgressView(title: item, viewModel: viewModel)
                }
                .padding(.bottom, 20)
                
                createTitle(title: "Welfare Program")
                ForEach(viewModel.welfareProgram, id: \.self) { item in
                    SteppedProgressView(title: item, viewModel: viewModel)
                }
                .padding(.bottom, 20)
                
                createTitle(title: "Career Growth Opportunities")
                ForEach(viewModel.careerGrowthOpportunities, id: \.self) { item in
                    SteppedProgressView(title: item, viewModel: viewModel)
                }
                .padding(.bottom, 20)
            }
            
            Spacer()
            
            NavigationLink {
                ResultView(viewModel: viewModel)
            } label: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: "C5683F"))
                    .overlay {
                        Text("Continue")
                            .foregroundStyle(.white)
                            .font(Font.system(size: 14, weight: .bold))
                    }
                    .frame(width: 361, height: 48)
            }
            .padding(.bottom, 24)
        }
        .navigationBarBackButtonHidden()
        }
}

extension EvaluationView {
    private func createTitle(title: String) -> some View {
        return VStack {
            HStack {
                Text("Q")
                    .font(Font.system(size: 28, weight: .medium))
                    .foregroundStyle(Color(hex: "A75835"))
                Spacer()
            }
            .padding(.leading, 16)
            
            HStack {
                Text(title)
                    .font(Font.system(size: 22, weight: .bold))
                Spacer()
            }
            .padding(.leading, 16)
            .padding(.bottom, 15)
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
    
    struct SteppedProgressView: View {
        let steps = 5
        let stepLabels = ["1", "2", "3", "4", "5"]
        var title: String
        var viewModel: EvaluationViewModel
        
        var body: some View {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .padding(.bottom, 15)
                
                HStack {
                    ForEach(1...steps, id: \.self) { index in
                        Button(action: {
                            viewModel.setScore(for: title, score: index)
                        }) {
                            VStack {
                                Circle()
                                    .fill(viewModel.scores[title] == index ? Color.yellow : Color.gray)
                                    .frame(width: 13, height: 13)
                                
                                Text(stepLabels[index - 1])
                                    .font(.caption)
                                    .foregroundColor(.black)
                            }
                        }
                        
                        if index < steps {
                            Spacer()
                        }
                    }
                }
                .overlay(
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 1),
                    alignment: .center
                )
                .padding(.horizontal)
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    EvaluationView()
}
