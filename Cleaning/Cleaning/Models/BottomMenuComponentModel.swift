import SwiftUI

struct BottomMenuComponentModel {
    enum Screens {
        case orders
        case cleaners
        case bonuses
        case help
    }
    
    var screen: Screens
    var image: Image
    var text: String
}
