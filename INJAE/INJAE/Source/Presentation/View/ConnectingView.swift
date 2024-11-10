//
//  ConnectingView.swift
//  INJAE
//
//  Created by 박현수 on 11/10/24.
//

import SwiftUI

struct ConnectingView: View {
    @State var viewModel: ConnectingViewModel = .init()

    var body: some View {
        VStack(spacing: 35) {
            Spacer()
            if viewModel.isShowingBuddy {
                BuddyCell()
            } else {
                HStack(spacing: 0) {
                    CompanyCell()
                    AnimatedDots(viewModel: viewModel)
                    UserCell()
                }
                .padding(.horizontal, 20)

                Text(viewModel.isConnected ? "Connected" : "Connecting with the buddy..")
                    .font(.system(size: 25, weight: .medium))
                    .foregroundStyle(Color.white)
            }
            Spacer()
            if viewModel.isShowingBuddy {
                NextButton(viewModel: viewModel)
            }
        }
        .background(Color(hex: "#A75835"))
        .onTapGesture {
            viewModel.isConnected = true
        }
        .navigationDestination(isPresented: $viewModel.isLoading) {

        }
    }
}

private struct CompanyCell: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(.aava)
                .resizable()
                .frame(width: 84, height: 84)
            HStack {
                Text("Aava Buddy")
                    .font(.system(size: 14, weight: .medium))
                    .padding(.top, 9)
                Spacer()
            }
            .padding(.top, 9)
            HStack {
                Text("Luna")
                    .font(.system(size: 17, weight: .bold))
                Spacer()
            }
            .padding(.top, 6)
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct UserCell: View {
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 84, height: 84)
            HStack {
                Text("Me")
                    .font(.system(size: 14, weight: .medium))
                    .padding(.top, 9)
                Spacer()
            }
            .padding(.top, 9)
            HStack {
                Text("InKyung Lee")
                    .font(.system(size: 17, weight: .bold))
                Spacer()
            }
            .padding(.top, 6)
        }
        .padding(12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct BuddyCell: View {
    var body: some View {
        VStack(spacing: 9) {
            Image(.longAava)
            HStack(spacing: 80) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Aava Buddy")
                        .font(.system(size: 12, weight: .medium))
                    Text("Luna")
                        .font(.system(size: 20, weight: .bold))
                }
                VStack(alignment: .trailing, spacing: 6) {
                    Text("Me")
                        .font(.system(size: 12, weight: .medium))
                    Text("InKyung")
                        .font(.system(size: 20, weight: .bold))
                }
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 68)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

private struct AnimatedDots: View {
    let viewModel: ConnectingViewModel
    @State var loading = false

    var body: some View {
        if viewModel.isConnected {
            Dots()
        } else {
            HStack(spacing: 6) {
                ForEach(1...7, id: \.self) { idx in
                    Circle()
                        .fill(loading ? .orange : .white)
                        .frame(width: 4, height: 4)
                        .scaleEffect(loading ? 1.2 : 1)
                        .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true).delay(0.2 * Double(idx)), value: loading)
                }
            }
            .onAppear() {
                self.loading = true
            }
            .padding(.horizontal, 13)
        }
    }
}

private struct Dots: View {
    var body: some View {
        HStack(spacing: 6) {
            ForEach(1...7, id: \.self) { idx in
                Circle()
                    .fill(.white)
                    .frame(width: 4, height: 4)
            }
        }
        .padding(.horizontal, 13)
    }
}

private struct NextButton: View {
    let viewModel: ConnectingViewModel
    var body: some View {
        Button {

        } label: {
            Text("Write a review")
                .font(.system(size: 14, weight: .bold))
                .padding(.vertical, 17)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .background(Color(hex: "#C5683F"))
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 20)
        .disabled(viewModel.isLoading)
        .opacity(viewModel.isLoading ? 0.3 : 1)
    }
}

#Preview {
    ConnectingView()
}
