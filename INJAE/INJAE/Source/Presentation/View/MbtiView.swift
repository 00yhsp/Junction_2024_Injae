//
//  MbtiView.swift
//  INJAE
//
//  Created by LeeWanJae on 11/10/24.
//

import SwiftUI

struct MbtiView: View {
    var boldLabel: Text {
        return Text("challenging explorer who values stability!")
            .bold()
    }
    
    var body: some View {
        ZStack {
            Color(hex: "A75835")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                VStack {
                    Image(.ballon)
                        .resizable()
                        .frame(width: 361, height: 169)
                        .overlay {
                            Text(
                            """
                                    "You’re a creative problem-solver
                            who thrives in adaptable, team-oriented 
                                      settings that value innovation 
                                            and strategic thinking."
                            """
                            )
                            .font(Font.system(size: 18))
                            .padding(.horizontal, 16)
                        }
                    HStack {
                        Spacer()
                        Image(.bread)
                            .resizable()
                            .frame(width: 100, height: 102)
                            .padding(.trailing, 20)
                    }
                }
                
                Spacer()
                
                Text("Almost there to the Cinnamon Role!")
                    .foregroundStyle(.white)
                    .font(Font.system(size: 14, weight: .bold))
                
                NavigationLink {
                    FilterView()
                } label: {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color(hex: "C5683F"))
                        .frame(width: 361, height: 48)
                        .overlay {
                            Text("Continue")
                                .foregroundStyle(.white)
                        }
                }
                .padding(.bottom, 16)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MbtiView()
}
