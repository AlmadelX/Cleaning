import SwiftUI

struct NumberSelectorElement: View {
    var size: Int
    
    @Binding var selector: Int
    
    var body: some View {
        HStack {
            ForEach((1...size), id: \.self) { number in
                SquareButtonElement(
                    backgroundColor: (number == selector ? Color("LighterBlue") : Color("Lavender")),
                    action: {
                        selector = number
                    }
                ) {
                    Text(String(number))
                        .foregroundColor(number == selector ? Color("White") : Color("LighterBlue"))
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                }
            }
        }
    }
}

struct NumberSelectorElement_Previews: PreviewProvider {
    static var previews: some View {
        NumberSelectorElement(size: 4, selector: .constant(0))
    }
}
