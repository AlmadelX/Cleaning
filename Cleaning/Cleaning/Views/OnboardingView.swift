import SwiftUI

struct OnboardingView: View {
    let pages = [
        OnboardingPageModel(
            background: Gradient(colors: [
                Color(R: 54, G: 86, B: 249),
                Color(R: 43, G: 70, B: 207)
            ]),
            indicatorColor: Color(R: 255, G: 255, B: 255),
            indicatorsOpacities: [1.0, 0.4, 0.4],
            title: "Блестящее качество",
            titleColor: Color(R: 255, G: 255, B: 255),
            text: "Наши клинеры - настоящие мастера своего дела, а используемые нами материалы сертифицированны и безопасны",
            textColor: Color(R: 220, G: 224, B: 242),
            textOpacity: 1.0,
            buttonColor: Color(R: 255, G: 255, B: 255)
        ),
        OnboardingPageModel(
            background: Gradient(colors: [
                Color(R: 254, G: 252, B: 255),
                Color(R: 247, G: 248, B: 255)
            ]),
            indicatorColor: Color(R: 54, G: 86, B: 249),
            indicatorsOpacities: [0.5, 1.0, 0.2],
            title: "Эко-френдли клининг",
            titleColor: Color(R: 65, G: 65, B: 69),
            text: "После каждой уборки мы забираем ваш мусор, сортируем его и увозим на специализированные свалки.",
            textColor: Color(R: 77, G: 86, B: 136),
            textOpacity: 0.7,
            buttonColor: Color(R: 54, G: 86, B: 249)
        ),
        OnboardingPageModel(
            background: Gradient(colors: [
                Color(R: 254, G: 252, B: 255),
                Color(R: 255, G: 252, B: 250)
            ]),
            indicatorColor: Color(R: 254, G: 180, B: 113),
            indicatorsOpacities: [0.5, 0.5, 1.0],
            title: "Небывалая доступность",
            titleColor: Color(R: 53, G: 52, B: 51),
            text: "Клининг никогда не был таким доступным. Вы можете заказывать уборку несколько раз в месяц",
            textColor: Color(R: 143, G: 140, B: 138),
            textOpacity: 1.0,
            buttonColor: Color(R: 254, G: 180, B: 113)
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
