//
//  FilterView2.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import SwiftUI

struct FilterView2: View {
    @Environment(FilterViewModel.self) private var viewModel

    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            TopBarLogo()
            
            HStack {
                Text("What is important to you?")
                    .font(Font.system(size: 26, weight: .bold))
                Spacer()
            }
            .padding(.vertical, 34)
            .padding(.horizontal, 16)
            
            SelectedView(emoji: viewModel.emoji[5], title: "Company Culture", menuItems: viewModel.companyCultures, selectedItem: $viewModel.selectedCompanyCulture)
            SelectedView(emoji: viewModel.emoji[6], title: "Benefit", menuItems: viewModel.benefits, selectedItem: $viewModel.selectedBenefits)
            SelectedView(emoji: viewModel.emoji[7], title: "Welfare Program", menuItems: viewModel.welfare, selectedItem: $viewModel.selectedLocation)
            SelectedView(emoji: viewModel.emoji[8], title: "Career Growth Opportunity", menuItems: viewModel.career, selectedItem: $viewModel.selectedCareer)
            
            Spacer()
            
            NavigationLink {
                BreadLoading()
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
            .disabled(viewModel.selectedList.count < 4)
            .opacity(viewModel.selectedList.count < 4 ? 0.3 : 1)
        }
        .navigationBarBackButtonHidden()
    }
}

extension FilterView2 {
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
    
    private func SelectedView(emoji: String, title: String, menuItems: [String], selectedItem: Binding<String>) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 12)
                .frame(width:55, height: 55)
                .overlay {
                    Image(systemName: emoji)
                        .resizable()
                        .scaledToFit()
                        .frame(width:30, height: 30)
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 15)
                .padding(.leading, 16)
            
            VStack {
                HStack {
                    Text(title)
                        .font(Font.system(size: 14, weight: .medium))
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Menu {
                            ForEach(menuItems, id: \.self) { item in
                                Button {
                                    selectedItem.wrappedValue = item
                                    viewModel.addToSelectedList(item)
                                    viewModel.selected.toggle()
                                } label: {
                                    Text(item)
                                }
                            }
                        } label: {
                            HStack {
                                Text(selectedItem.wrappedValue)
                                    .font(.system(size: 22, weight: .medium))
                                    .foregroundColor(.black)
                                    .opacity(selectedItem.wrappedValue == "Not selected" ? 0.7 : 1.0)
                                
                                Spacer()
                            }
                        }
                    }
                    Divider()
                }
                .padding(.bottom, 20)
            }
            .padding(.leading, 16)
        }
    }
}

#Preview {
    FilterView()
}
