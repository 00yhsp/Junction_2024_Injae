//
//  SelectedView.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import SwiftUI

struct SelectedView: View {
    @Environment(FilterViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            TopBarLogo()
            
            HStack {
                Text("This was what you have valued")
                    .font(Font.system(size: 26, weight: .bold))
                    
                Spacer()
            }
            .padding(.bottom, 41)
            .padding(.top, 73)
            .padding(.leading, 16)
            
            createList(title: "Company Culture", selectedList: viewModel.selectedList[0])
            createList(title: "Benefit", selectedList: viewModel.selectedList[1])
            createList(title: "Welfare Program", selectedList: viewModel.selectedList[2])
            createList(title: "Career Growth Opportunity", selectedList: viewModel.selectedList[3])
            
            Spacer()
            
            NavigationLink {
                EvaluationView()
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

extension SelectedView {
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
}

#Preview {
    SelectedView().environment(FilterViewModel())
}

extension SelectedView {
    func createList(title: String, selectedList: String) -> some View {
       return VStack {
            HStack {
                Text(title)
                    .font(Font.system(size: 14, weight: .medium))
                    .foregroundStyle(Color(hex: "393C49"))
                Spacer()
            }
            .padding(.bottom, 9)
            .padding(.leading, 16)
            
            HStack {
                Text(selectedList)
                    .font(Font.system(size: 22, weight: .medium))
                Spacer()
            }
            .padding(.bottom, 9)
            .padding(.leading, 16)
           
           Divider()
        }
    }
}
