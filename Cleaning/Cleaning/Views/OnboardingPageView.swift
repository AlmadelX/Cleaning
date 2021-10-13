import SwiftUI

struct OnboardingPageView: View {
    @EnvironmentObject var appState: AppStateModel
    
    let pages: [OnboardingPageModel]
    var page: Int
    
    var model: OnboardingPageModel {
        pages[page]
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: model.background, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Image("Onboarding" + String(page))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(model.indicatorColor)
                        .opacity(model.indicatorsOpacities[0])
                        .padding(.horizontal, 6)
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(model.indicatorColor)
                        .opacity(model.indicatorsOpacities[1])
                        .padding(.horizontal, 6)
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(model.indicatorColor)
                        .opacity(model.indicatorsOpacities[2])
                        .padding(.horizontal, 6)
                        
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                Text(model.title)
                    .font(.system(size: 32))
                    .fontWeight(.bold)
                    .foregroundColor(model.titleColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 35)
                
                if page == pages.count - 1 {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 60, height: 60)
                        .foregroundColor(model.buttonColor)
                        .onTapGesture {
                            appState.showOnboarding = false
                        }
                } else {
                    NavigationLink(destination: OnboardingPageView(pages: pages, page: page + 1)) {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 60, height: 60)
                            .foregroundColor(model.buttonColor)
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static let pages = [
        OnboardingPageModel(
            background: Gradient(colors: [
                Color(R: 54, G: 86, B: 249),
                Color(R: 43, G: 70, B: 207)
            ]),
            indicatorColor: Color(R: 255, G: 255, B: 255),
            indicatorsOpacities: [1.0, 0.4, 0.4],
            title: "Блестящее качество",
            titleColor: Color(R: 255, G: 255, B: 255),
            buttonColor: Color(R: 255, G: 255, B: 255)
        )
    ]
    
    static var previews: some View {
        OnboardingPageView(pages: pages, page: 0)
            .environmentObject(AppStateModel())
    }
}
