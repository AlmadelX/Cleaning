import SwiftUI

struct OnboardingPageView: View {
    var model: OnboardingPageModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: model.background, startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 60, height: 60)
                .foregroundColor(model.buttonColor)
                .onTapGesture {
                }
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    @State var currentPage = 0
    
    static var previews: some View {
        OnboardingPageView(model:
            OnboardingPageModel(
                background: Gradient(colors: [
                    Color(R: 54, G: 86, B: 249),
                    Color(R: 43, G: 70, B: 207)
                ]),
                buttonColor: Color(R: 255, G: 255, B: 255)
            )
        )
    }
}
