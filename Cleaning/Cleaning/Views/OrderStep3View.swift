import SwiftUI

struct OrderStep3View: View {
    var previousChoice: String
    var time: String
    var price: String
    
    @State var currentSelection = SelectorMenuModel.Selections.address
    
    var body: some View {
        ZStack {
            Color("White")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                TopBarElement(text: choice())
                
                ScrollView(.vertical) {
                    HStack {
                        SelectorMenuElement(
                            model: SelectorMenuModel(
                                selection: .address,
                                text: "Адрес"
                            ),
                            currentSelection: $currentSelection
                        )
                        
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(Color("Periwinkle"))
                            .frame(width: 20, height: 2)
                        
                        SelectorMenuElement(
                            model: SelectorMenuModel(
                                selection: .time,
                                text: "Время"
                            ),
                            currentSelection: $currentSelection
                        )
                        
                        RoundedRectangle(cornerRadius: 10.0)
                            .foregroundColor(Color("Periwinkle"))
                            .frame(width: 20, height: 2)
                        
                        SelectorMenuElement(
                            model: SelectorMenuModel(
                                selection: .checkout,
                                text: "Оплата"
                            ),
                            currentSelection: $currentSelection
                        )
                    }
                    .padding(.top, 8)
                    
                    Group {
                        switch currentSelection {
                        case .address:
                            OrderAddressView(currentSelection: $currentSelection)
                        case .time:
                            Spacer()
                            Text("Time")
                            Spacer()
                        case .checkout:
                            Spacer()
                            Text("Checkout")
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func choice() -> String {
        return previousChoice + ", " + time + ", " + price
    }
}

struct OrderStep3View_Previews: PreviewProvider {
    static var previews: some View {
        OrderStep3View(
            previousChoice: "1 Комната, 1 Санузел",
            time: "4 Часа",
            price: "1290 ₽",
            currentSelection: .address
        )
    }
}
