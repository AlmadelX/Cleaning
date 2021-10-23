import SwiftUI

struct OrderCheckoutView: View {
    var price: String
    
    @Binding var addressFormModel: AddressFormModel
    @Binding var addons: Set<String>
    
    var body: some View {
        VStack {
            Text("Выберите способ оплаты")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 30))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.vertical)
            
            NavigationLink(destination: OrderView(
                price: price,
                addressFormModel: $addressFormModel,
                addons: $addons
            )) {
                ZStack {
                    RoundedRectangle(cornerRadius: 13.0)
                        .foregroundColor(Color("Lavender"))
                        .padding(.horizontal)
                        .frame(height: 57)
                    
                    Text("Наличными клинеру")
                        .foregroundColor(Color("LighterBlue"))
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
            }
            
            NavigationLink(destination: OrderView(
                price: price,
                addressFormModel: $addressFormModel,
                addons: $addons
            )) {
                ZStack {
                    RoundedRectangle(cornerRadius: 13.0)
                        .foregroundColor(Color("Lavender"))
                        .padding(.horizontal)
                        .frame(height: 57)
                    
                    Text("Картой клинеру")
                        .foregroundColor(Color("LighterBlue"))
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                }
            }
            
            Text("Или")
                .foregroundColor(Color("BlueBell"))
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.vertical)
            
            NavigationLink(destination: OrderView(
                price: price,
                addressFormModel: $addressFormModel,
                addons: $addons
            )) {
                Image("ApplePay")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
            }
            
            Spacer()
        }
    }
}

struct OrderCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        OrderCheckoutView(
            price: "100 $",
            addressFormModel: .constant(AddressFormModel()),
            addons: .constant([])
        )
    }
}
