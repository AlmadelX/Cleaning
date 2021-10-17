import SwiftUI

struct RadioButtonElement: View {
    @Binding var isPressed: Bool
    
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color("Black"), lineWidth: 2)
            
            Circle()
                .foregroundColor(color)
                .opacity(isPressed ? 1.0 : 0.0)
                .frame(width: 14, height: 14)
        }
        .scaledToFit()
        .frame(height: 22)
        .onTapGesture {
            isPressed.toggle()
        }
    }
}

struct RadioButtonElement_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonElement(isPressed: .constant(true), color: Color("NeonCarrot"))
    }
}
