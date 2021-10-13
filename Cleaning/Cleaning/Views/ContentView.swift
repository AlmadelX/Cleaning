import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppStateModel
    
    var body: some View {
        NavigationView {
            Text("Main")
                .padding()
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
