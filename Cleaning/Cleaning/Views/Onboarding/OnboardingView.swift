import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var appState: AppStateModel
    
    @State private var selection = 0
    
    let backgrounds = [
        [Color("LighterBlue"), Color("DarkerBlue")],
        [Color("Magnolia"), Color("LighterGhostWhite")],
        [Color("Magnolia"), Color("Seashell")]
    ]
    
    let pages = [
        OnboardingPageModel(
            image: Image("WomanWithBackground"),
            title: "Блестящее качество",
            titleColor: Color("White"),
            text: "Наши клинеры - настоящие мастера своего дела, а используемые нами материалы сертифицированны и безопасны",
            textColor: Color("LightGrey"),
            buttonColor: Color("White"),
            buttonArrowColor: Color("LighterBlue")
        ),
        OnboardingPageModel(
            image: Image("Eco-FriendlyMan"),
            title: "Эко-френдли клининг",
            titleColor: Color("Grey"),
            text: "После каждой уборки мы забираем ваш мусор, сортируем его и увозим на специализированные свалки.",
            textColor: Color("BayColor"),
            buttonColor: Color("LighterBlue"),
            buttonArrowColor: Color("White")
        ),
        OnboardingPageModel(
            image: Image("EconomicalMan"),
            title: "Небывалая доступность",
            titleColor: Color("Acadia"),
            text: "Клининг никогда не был таким доступным. Вы можете заказывать уборку несколько раз в месяц",
            textColor: Color("SuvaGrey"),
            buttonColor: Color("Orange"),
            buttonArrowColor: Color("White")
        )
    ]
    
    var body: some View {
        ZStack {
            BackgroundGradientElement(
                colors: backgrounds[selection]
            )
            
            VStack {
                TabView(selection: $selection) {
                    ForEach(pages.indices, id: \.self) { index in
                        OnboardingPageView(pages: pages, page: index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                SquareButtonElement(
                    backgroundColor: pages[selection].buttonColor,
                    action: {
                        withAnimation {
                            if selection == pages.count - 1 {
                                appState.showOnboarding = false
                            } else {
                                selection += 1
                            }
                        }
                    }
                ) {
                    Image("ForwardArrow")
                        .renderingMode(.template)
                        .foregroundColor(pages[selection].buttonArrowColor)
                }
                .padding(.bottom, 30)
            }
            
            VStack {
                HStack {
                    PaginationView(
                        model: PaginationModel(
                            colors: [Color("White"), Color("LighterBlue"), Color("Orange")],
                            opacities: [1.0, 0.5]
                        ),
                        selection: $selection
                    )
                    
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 32)
                
                Spacer()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
