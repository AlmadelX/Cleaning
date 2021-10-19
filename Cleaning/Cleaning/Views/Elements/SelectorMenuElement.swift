import SwiftUI

struct SelectorMenuElement: View {
    var model: SelectorMenuModel
    
    @Binding var currentSelection: SelectorMenuModel.Selections
    
    private let activeColor = Color("LighterBlue")
    private let inactiveColor = Color("Periwinkle")
    
    var body: some View {
        Text(model.text)
            .foregroundColor(currentSelection == model.selection ? activeColor : inactiveColor)
            .font(.system(size: 18))
            .fontWeight(.bold)
    }
}

struct SelectorMenuElement_Previews: PreviewProvider {
    static var previews: some View {
        SelectorMenuElement(
            model: SelectorMenuModel(
                selection: .address,
                text: "Адрес"
            ),
            currentSelection: .constant(.address)
        )
    }
}
