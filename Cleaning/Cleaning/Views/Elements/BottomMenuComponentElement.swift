import SwiftUI

struct BottomMenuComponentElement: View {
    @Binding var currentSelection: BottomMenuComponentModel.Screens
    
    var model: BottomMenuComponentModel
    
    private let activeColor = Color("LighterBlue")
    private let inactiveColor = Color("LavenderBlue")
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()

            model.image
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .padding(3)

            Spacer()

            Text(model.text)
                .font(.system(size: 15))
                .fontWeight(.semibold)

            Spacer()
        }
        .foregroundColor(currentSelection == model.screen ? activeColor : inactiveColor)
        .onTapGesture {
            currentSelection = model.screen
        }
    }
}

struct BottomMenuComponentElement_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenuComponentElement(
            currentSelection: .constant(.orders),
            model: BottomMenuComponentModel(
                screen: .orders,
                image: Image("Brush"),
                text: "Заказы"
            )
        )
        .frame(height: 72)
    }
}
