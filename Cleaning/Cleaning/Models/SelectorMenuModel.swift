import SwiftUI

struct SelectorMenuModel {
    enum Selections {
        case address
        case time
        case checkout
    }
    
    var selection: Selections
    var text: String
}
