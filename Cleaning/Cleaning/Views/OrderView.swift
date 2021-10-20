import SwiftUI

struct OrderView: View {
    @EnvironmentObject var appState: AppStateModel
    
    @Binding var addressFormModel: AddressFormModel
    
    var body: some View {
        ZStack {
            Color("White")
                .ignoresSafeArea()
            
            VStack {
                Image("Map")
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width)
                    .padding(.top, 60)
                
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
                            
                            Text(address())
                                .foregroundColor(Color("Mischka"))
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .frame(width: 200)
                                .lineLimit(1)
                        }
                        
                        Spacer()
                    }
                }
                .frame(height: 80)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 15.0)
                        .foregroundColor(Color("DarkerGhostWhite"))
                        .frame(height: 128)
                        .padding(.horizontal, 24)
                    
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
                .padding(.top, 200)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func address() -> String {
        return addressFormModel.city + ", ул. " + addressFormModel.street + ", д. " + addressFormModel.house + ", кв. " + addressFormModel.flat
    }
    
}

struct OrderView_Previews: PreviewProvider {
    static var model = AddressFormModel(
        city: "Екатерибург",
        street: "Крестинского"
    )
    
    static var previews: some View {
        OrderView(addressFormModel: .constant(model))
    }
}
