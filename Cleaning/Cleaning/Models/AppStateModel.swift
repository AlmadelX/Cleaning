import Foundation

class AppStateModel: ObservableObject {
    @Published var showOnboarding: Bool
    
    init() {
        showOnboarding = true
        
        print("App started")
    }
}
