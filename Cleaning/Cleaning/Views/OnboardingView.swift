import SwiftUI

struct OnboardingView: View {
    let pages = [
        OnboardingPageModel(
            background: Gradient(colors: [
                Color(R: 54, G: 86, B: 249),
                Color(R: 43, G: 70, B: 207)
            ]),
            buttonColor: Color(R: 255, G: 255, B: 255)
        )
    ]
    
    @State var currentPage = 0
    
    var body: some View {
        OnboardingPageView(model: pages[currentPage])
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
