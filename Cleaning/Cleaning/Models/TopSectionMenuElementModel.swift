import SwiftUI

struct TopSectionMenuElementModel {
    enum Sections {
        case relevant
        case completed
    }
    
    var section: Sections
    var text: String
}
