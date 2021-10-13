import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppStateModel
    
    var body: some View {
        NavigationView {
            MainView()
        }
        .fullScreenCover(isPresented: $appState.showOnboarding) {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppStateModel())
    }
}
