import Foundation

class AppStateModel: ObservableObject {
    @Published var showOnboarding: Bool
    @Published var makingOrder: Bool
    @Published var isOrderMade: Bool
    @Published var orderPrice: String
    @Published var orderAddress: String
    
    init() {
        showOnboarding = true
        makingOrder = false
        isOrderMade = false
        orderPrice = ""
        orderAddress = ""
        
        print("App started")
    }
}
