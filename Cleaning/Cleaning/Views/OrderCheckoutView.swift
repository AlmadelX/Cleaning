import SwiftUI

struct OrderCheckoutView: View {
    @Binding var addressFormModel: AddressFormModel
    
    var body: some View {
        VStack {
            Text("Выберите способ оплаты")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 30))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.vertical)
            
            NavigationLink(destination: OrderView(addressFormModel: $addressFormModel)) {
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
            
            NavigationLink(destination: OrderView(addressFormModel: $addressFormModel)) {
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
            
            NavigationLink(destination: OrderView(addressFormModel: $addressFormModel)) {
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
        OrderCheckoutView(addressFormModel: .constant(AddressFormModel()))
    }
}
