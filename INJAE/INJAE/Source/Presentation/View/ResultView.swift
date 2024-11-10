import SwiftUI

struct ResultView: View {
    var viewModel: EvaluationViewModel
    
    var body: some View {
        VStack {
            TopBarLogo()
            
            ScrollView {
                HStack {
                    Text("How different is it for you?")
                        .font(Font.system(size: 26, weight: .bold))
                    Spacer()
                }
                .padding(.bottom, 28)
                .padding(.top, 73)
                .padding(.leading, 16)
                
                // 각 섹션별로 점수 표시
                createSection(title: "Company Culture", items: viewModel.companyCulture)
                createSection(title: "Benefits", items: viewModel.benefits)
                createSection(title: "Welfare Program", items: viewModel.welfareProgram)
                createSection(title: "Career Growth Opportunities", items: viewModel.careerGrowthOpportunities)
            }
        }
        .navigationBarBackButtonHidden()
    }
    
    // 섹션 생성 함수
    private func createSection(title: String, items: [String]) -> some View {
        VStack(alignment: .leading) {
            createTitle(title: title)
            
            ForEach(items, id: \.self) { item in
                HStack {
                    Text("\(item):")
                        .font(Font.system(size: 16, weight: .medium))
                        .foregroundStyle(Color(hex: "4B4B4B"))
                        .padding(.leading, 16)
                    
                    Spacer()
                    Text("🌟\(Double.random(in: 2.1...4.9))".prefix(4))

                        .font(Font.system(size: 16, weight: .bold))
                        .padding(.trailing, 24)
                }
            }
        }
        .padding(.bottom, 20)
    }
}

#Preview {
    ResultView(viewModel: EvaluationViewModel())
}

extension ResultView {
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
}
