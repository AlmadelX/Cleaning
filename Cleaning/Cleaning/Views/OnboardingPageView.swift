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
                HStack {
                    Spacer()
                    
                    model.image
                        .resizable()
                        .scaledToFit()
                }
                
                Text(model.title)
                    .font(.system(size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(model.titleColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 35)
                    .padding(.bottom, 5)
                Text(model.text)
                    .font(.system(size: 17))
                    .fontWeight(.semibold)
                    .foregroundColor(model.textColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 35)
                    .padding(.bottom, 35)
                
                ZStack {
                    Group {
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
                    
                    Image("ForwardArrow")
                        .renderingMode(.template)
                        .foregroundColor(model.buttonArrowColor)
                }
                .padding(.bottom, 30)
            }
            .padding(.top)
            
            VStack {
                HStack {
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(model.indicatorColor)
                        .opacity(model.indicatorsOpacities[0])
                        .padding(.horizontal, 5)
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(model.indicatorColor)
                        .opacity(model.indicatorsOpacities[1])
                        .padding(.horizontal, 5)
                    Circle()
                        .frame(width: 9, height: 9)
                        .foregroundColor(model.indicatorColor)
                        .opacity(model.indicatorsOpacities[2])
                        .padding(.horizontal, 5)
                        
                    Spacer()
                }
                .padding()
                
                Spacer()
            }
            .padding(.top)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static let pages = [
        OnboardingPageModel(
            background: Gradient(colors: [
                Color("LighterBlue"),
                Color("DarkerBlue")
            ]),
            indicatorColor: Color("White"),
            indicatorsOpacities: [1.0, 0.4, 0.4],
            image: Image("WomanWithBackground"),
            title: "Блестящее качество",
            titleColor: Color("White"),
            text: "Наши клинеры - настоящие мастера своего дела, а используемые нами материалы сертифицированны и безопасны",
            textColor: Color("LightGrey"),
            buttonColor: Color("White"),
            buttonArrowColor: Color("LighterBlue")
        )
    ]
    
    static var previews: some View {
        OnboardingPageView(pages: pages, page: 0)
            .environmentObject(AppStateModel())
    }
}
