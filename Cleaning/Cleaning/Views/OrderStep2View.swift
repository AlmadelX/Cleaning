import SwiftUI

struct OrderStep2View: View {
    var body: some View {
        ZStack {
            Color("White")
                .ignoresSafeArea()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OrderStep2View_Previews: PreviewProvider {
    static var previews: some View {
        OrderStep2View()
    }
}
