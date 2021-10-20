import SwiftUI

struct MainView: View {
    @State var currentScreen = BottomMenuComponentModel.Screens.orders
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientElement(
                    colors: [Color("Magnolia"), Color("Seashell")]
                )

                VStack() {
                    Group {
                        switch(currentScreen) {
                        case .orders:
                            OrdersView()
                        case .cleaners:
                            CleanersView()
                        case .bonuses:
                            BonusesView()
                        case .help:
                            Spacer()
                            Text("Help")
                            Spacer()
                        }
                    }
                    .foregroundColor(.black)

                    BottomMenuElement(currentSelection: $currentScreen)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
