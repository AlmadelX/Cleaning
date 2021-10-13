import SwiftUI

struct ContentView: View {
    @State private var showOnboarding = true
    
    var body: some View {
        NavigationView {
            Text("Main")
                .padding()
        }
        .fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
