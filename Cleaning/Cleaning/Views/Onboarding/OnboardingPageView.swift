import SwiftUI

struct OnboardingPageView: View {
    let pages: [OnboardingPageModel]
    var page: Int
    
    var model: OnboardingPageModel {
        pages[page]
    }
    
    var body: some View {
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
        }
        .padding(.top)
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static let pages = [
        OnboardingPageModel(
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
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            OnboardingPageView(pages: pages, page: 0)
                .environmentObject(AppStateModel())
        }
    }
}
