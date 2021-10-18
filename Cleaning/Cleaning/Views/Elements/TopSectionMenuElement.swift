import SwiftUI

struct TopSectionMenuElement: View {
    @Binding var currentSelection: TopSectionMenuElementModel.Sections
    
    var model: TopSectionMenuElementModel
    
    private let activeColor = Color("LighterBlue")
    private let inactiveColor = Color("LighterLavenderBlue")
    
    var body: some View {
        VStack(spacing: 5) {
            Text(model.text)
                .foregroundColor(currentSelection == model.section ? activeColor : inactiveColor)
                .fontWeight(.bold)
            
            RoundedRectangle(cornerRadius: 26.0)
                .frame(width: 13, height: 3)
                .foregroundColor(activeColor)
                .opacity(currentSelection == model.section ? 1.0 : 0.0)
        }
        .onTapGesture {
            currentSelection = model.section
        }
    }
}

struct TopSectionMenuElement_Previews: PreviewProvider {
    static var previews: some View {
        TopSectionMenuElement(
            currentSelection: .constant(.relevant),
            model: TopSectionMenuElementModel(
                section: .relevant,
                text: "Актуальные"
            )
        )
    }
}
