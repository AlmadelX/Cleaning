import SwiftUI

struct OrderView: View {
    @EnvironmentObject var appState: AppStateModel
    
    var price: String
    
    @Binding var addressFormModel: AddressFormModel
    @Binding var addons: Set<String>
    @Binding var orderDate: String
    @Binding var orderTime: String
    
    var body: some View {
        ZStack {
            Color("White")
                .ignoresSafeArea()
            
            VStack {
                Image("Map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top)
                
                Spacer()
            }
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20.0)
                        .foregroundColor(Color("DarkerGhostWhite"))
                        .ignoresSafeArea()
                    
                    HStack {
                        SquareButtonElement(
                            backgroundColor: Color("DarkerGhostWhite"),
                            action: {
                                appState.makingOrder = false
                                appState.isOrderMade = true
                                appState.orderPrice = price
                                appState.orderAddress = address()
                            }
                        ) {
                            Image("BackwardArrow")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("LighterBlue"))
                                .scaledToFit()
                                .frame(height: 13)
                        }
                        .padding(.leading)
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Заказ #12331")
                                .foregroundColor(Color("Vulcan"))
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                            
                            Text(shortAddress())
                                .foregroundColor(Color("Mischka"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
//                                .frame(width: 200)
                                .fixedSize(horizontal: false, vertical: true)
                                .lineLimit(1)
                        }
                        
                        Spacer()
                    }
                }
                .frame(height: 80)
                
                VStack(alignment: .leading, spacing: 26) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .foregroundColor(Color("DarkerGhostWhite"))
                            .frame(height: 128)
                        
                        VStack {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10.0)
                                    .foregroundColor(Color("White"))
                                
                                Image("HourGlass")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 30)
                            }
                            .frame(width: 48, height: 48)
                            
                            Text("Ищем клинеров для вас")
                                .foregroundColor(Color("Vulcan"))
                                .fontWeight(.bold)
                        }
                    }
                    .padding(.top, 160)
                    
                    HStack {
                        Text(date())
                            .foregroundColor(Color("Vulcan"))
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                            .padding(.trailing, 23)
                        
                        Text(orderTime)
                            .foregroundColor(Color("Vulcan"))
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Адрес")
                            .foregroundColor(Color("Vulcan"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                        
                        Text(address())
                            .foregroundColor(Color("Mischka"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Дополнительные услуги")
                            .foregroundColor(Color("Vulcan"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)

                        Text(addonsString())
                            .foregroundColor(Color("Mischka"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
//                    Circle()
//                        .foregroundColor(Color("WhiteSmoke"))
//                        .frame(width: 80, height: 80)
                    
                    Spacer()
                    
                    Text("Тут будет информация о вашей команде клинеров, когда они найдутся")
                        .foregroundColor(Color("Mischka"))
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 41)
                    
                    Spacer()
                }
                .padding(.horizontal, 24)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func shortAddress() -> String {
        return addressFormModel.city + ", ул. " + addressFormModel.street
    }
    
    func address() -> String {
        return addressFormModel.city + ", улица " + addressFormModel.street + ", д. " + addressFormModel.house + ", корп. " + addressFormModel.block + ", кв. " + addressFormModel.flat
    }
    
    func addonsString() -> String {
        var result = ""
        for addon in addons {
            let str = addon.replacingOccurrences(of: "\n", with: " ")
            result += str + ", "
        }
        result.removeLast(2)
        
        return result
    }
    
    func date() -> String {
        let weekday = orderDate.suffix(2)
        var day = orderDate
        day.removeLast(4)

        return day + " Октября, " + weekday
    }
}

struct OrderView_Previews: PreviewProvider {
    static var model = AddressFormModel(
        city: "Екатерибург",
        street: "Крестинского",
        house: "41",
        flat: "50",
        block: "1",
        entrance: "1"
    )
    
    static var previews: some View {
        OrderView(
            price: "100 $",
            addressFormModel: .constant(model),
            addons: .constant([]),
            orderDate: .constant("21 Мая, пт"),
            orderTime: .constant("18:00")
        )
            .environmentObject(AppStateModel())
    }
}
