//
//  FilterView.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import SwiftUI

struct FilterView: View {
    @State private var viewModel = FilterViewModel()
    
    var body: some View {
        VStack {
            TopBarLogo()
            
            HStack {
                Text("Choose your preference")
                    .font(Font.system(size: 26, weight: .bold))
                Spacer()
            }
            .padding(.vertical, 34)
            .padding(.horizontal, 16)
            
            SelectedView(emoji: viewModel.emoji[0], title: "Industry Sector", menuItems: viewModel.industries, selectedItem: $viewModel.selectedIndustry)
            SelectedView(emoji: viewModel.emoji[1], title: "Job Function/Role", menuItems: viewModel.jobs, selectedItem: $viewModel.selectedJob)
            SelectedView(emoji: viewModel.emoji[2], title: "Location Preference", menuItems: viewModel.locations, selectedItem: $viewModel.selectedLocation)
            SelectedView(emoji: viewModel.emoji[3], title: "Working Arrangement", menuItems: viewModel.working, selectedItem: $viewModel.selectedWorking)
            SelectedView(emoji: viewModel.emoji[4], title: "Company Size", menuItems: viewModel.companysize, selectedItem: $viewModel.selectedCompanySize)
            
            NavigationLink {
                FilterView2()
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

extension FilterView {
    private struct TopBarLogo: View {
        var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Text("CINNAMON")
                        .font(.moveSans(weight: .medium, size: 28))
                        .lineSpacing(5.6)
                        .foregroundStyle(Color(hex: "#C5683F"))
                    Spacer()
                }
                
                HStack {
                    Text("ROLe")
                        .font(.moveSans(weight: .medium, size: 28))
                        .lineSpacing(5.6)
                        .foregroundStyle(Color(hex: "#C5683F"))
                    Image(.bread)
                    Spacer()
                }
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