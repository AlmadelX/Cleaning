import SwiftUI

struct SquareButtonElement<Content: View>: View {
    var backgroundColor: Color
    var action: () -> Void
    var label: () -> Content
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .frame(width: 60, height: 60)
                .foregroundColor(backgroundColor)
                .onTapGesture {
                    action()
                }
            
            label()
        }
    }
}

struct SquareButtonElement_Previews: PreviewProvider {
    static var previews: some View {
        SquareButtonElement(
            backgroundColor: Color("LighterGhostWhite"),
            action: { print("Pressed!") }
        ) {
            Image("ForwardArrow")
                .renderingMode(.template)
                .foregroundColor(Color("LighterBlue"))
        }
    }
}
