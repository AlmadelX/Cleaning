import Foundation

class AppStateModel: ObservableObject {
    @Published var showOnboarding: Bool
    @Published var makingOrder: Bool
    
    init() {
        showOnboarding = true
        makingOrder = false
        
        print("App started")
    }
}
