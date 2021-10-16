import SwiftUI

struct BackgroundGradientElement: View {
    var colors: [Color]
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
            .ignoresSafeArea()
    }
}

struct BackgroundGradientElement_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradientElement(colors: [Color("Magnolia"), Color("Seashell")])
    }
}
