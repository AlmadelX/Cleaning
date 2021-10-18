import SwiftUI

struct BottomMenuElement: View {
    @Binding var currentSelection: BottomMenuComponentModel.Screens
    
    private let models = [
        BottomMenuComponentModel(
            screen: .orders,
            image: Image("Brush"),
            text: "Заказы"
        ),
        BottomMenuComponentModel(
            screen: .cleaners,
            image: Image("PlusPerson"),
            text: "Клинеры"
        ),
        BottomMenuComponentModel(
            screen: .bonuses,
            image: Image("Gift"),
            text: "Бонусы"
        ),
        BottomMenuComponentModel(
            screen: .help,
            image: Image("Question"),
            text: "Помощь"
        ),
    ]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color("LighterGhostWhite"))

            HStack {
                Spacer()

                ForEach(models.indices, id: \.self) { id in
                    BottomMenuComponentElement(
                        currentSelection: $currentSelection,
                        model: models[id]
                    )
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width, height: 72)
    }
}

struct BottomMenuElement_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            
            BottomMenuElement(currentSelection: .constant(.orders))
        }
    }
}
