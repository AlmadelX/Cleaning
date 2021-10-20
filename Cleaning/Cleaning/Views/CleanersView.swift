import SwiftUI

struct CleanersView: View {
    var body: some View {
        VStack {
            Spacer()
            
            Image("Heart")
                .resizable()
                .scaledToFit()
                .frame(width: 45)
            
            Text("Здесь будут клинеры,\nкоторые вам понравятся")
                .foregroundColor(Color("Manatee"))
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
            
            Spacer()
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct CleanersView_Previews: PreviewProvider {
    static var previews: some View {
        CleanersView()
    }
}
