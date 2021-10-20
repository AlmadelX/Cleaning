import SwiftUI

struct OrderAddressView: View {
    @State var isAddressCorrect = false
    
    @Binding var currentSelection: SelectorMenuModel.Selections
    @Binding var addressFormModel: AddressFormModel
    
    var body: some View {
        VStack {
            Text("Адрес квартиры")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 30))
                .fontWeight(.bold)
            
            ZStack {
                RoundedRectangle(cornerRadius: 15.0)
                    .foregroundColor(Color("Linen"))
                
                HStack {
                    Image("Geoposition")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 20)
                    
                    Text("Указать на карте")
                        .foregroundColor(Color("Ochre"))
                        .fontWeight(.bold)
                }
            }
            .padding(.horizontal, 48)
            .frame(height: 60)
            
            Text("Или")
                .foregroundColor(Color("BlueBell"))
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.vertical)
            
            OrderFormElement(
                isAddressCorrect: $isAddressCorrect,
                model: $addressFormModel
            )
            
            ZStack {
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(Color("LighterBlue"))
                
                HStack {
                    Text("ДАЛЕЕ")
                        .foregroundColor(Color("WhiteSmoke"))
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
                .foregroundColor(Color("White"))
            }
            .frame(height: 60)
            .padding()
            .opacity(isAddressCorrect ? 1.0 : 0.0)
            .disabled(!isAddressCorrect)
            .onTapGesture {
                withAnimation {
                    currentSelection = .time
                }
            }
        }
    }
}

struct OrderAddressView_Previews: PreviewProvider {
    static var previews: some View {
        OrderAddressView(
            currentSelection: .constant(.address),
            addressFormModel: .constant(AddressFormModel())
        )
    }
}
