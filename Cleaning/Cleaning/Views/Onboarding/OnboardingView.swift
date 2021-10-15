import SwiftUI

struct OnboardingView: View {
    let pages = [
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
        ),
        OnboardingPageModel(
            background: Gradient(colors: [
                Color("Magnolia"),
                Color("GhostWhite")
            ]),
            indicatorColor: Color("LighterBlue"),
            indicatorsOpacities: [0.5, 1.0, 0.2],
            image: Image("Eco-FriendlyMan"),
            title: "Эко-френдли клининг",
            titleColor: Color("Grey"),
            text: "После каждой уборки мы забираем ваш мусор, сортируем его и увозим на специализированные свалки.",
            textColor: Color("BayColor"),
            buttonColor: Color("LighterBlue"),
            buttonArrowColor: Color("White")
        ),
        OnboardingPageModel(
            background: Gradient(colors: [
                Color("Magnolia"),
                Color("Seashell")
            ]),
            indicatorColor: Color("Orange"),
            indicatorsOpacities: [0.5, 0.5, 1.0],
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
        NavigationView {
            OnboardingPageView(pages: pages, page: 0)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
