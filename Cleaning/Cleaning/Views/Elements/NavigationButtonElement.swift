import SwiftUI

struct NavigationButtonElement<Destination: View, Content: View>: View {
    var destination: Destination
    var label: () -> Content

    var body: some View {
        NavigationLink(destination: destination) {
            ZStack {
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(Color("LighterBlue"))
                
                label()
                .foregroundColor(Color("White"))
            }
            .frame(height: 60)
            .padding()
        }
    }
}

struct NavigationButtonElement_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtonElement(destination: OrderStep1View()) {
            HStack {
                Text("Заказать уборку")
                    .fontWeight(.bold)
                
                Image("ForwardArrow")
                    .resizable()
                    .renderingMode(.template)
                    .scaledToFit()
                    .frame(width: 7)
            }
        }
    }
}
