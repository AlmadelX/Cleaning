import SwiftUI

struct MainView: View {
    enum Screens {
        case orders
        case cleaners
        case bonuses
        case help
    }
    
    let activeColor = Color(R: 54, G: 86, B: 249)
    let inactiveColor = Color(R: 190, G: 196, B: 251)
    
    @State var currentScreen = Screens.orders
    
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
                            Spacer()
                            Text("Cleaners")
                            Spacer()
                        case .bonuses:
                            Spacer()
                            Text("Bonuses")
                            Spacer()
                        case .help:
                            Spacer()
                            Text("Help")
                            Spacer()
                        }
                    }
                    .foregroundColor(.black)

                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color(R: 246, G: 247, B: 255))

                        HStack {
                            Spacer()

                            VStack(spacing: 0) {
                                Spacer()

                                Image("Menu0")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .padding(3)

                                Spacer()

                                Text("Заказы")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Spacer()
                            }
                            .foregroundColor(currentScreen == .orders ? activeColor : inactiveColor)
                            .onTapGesture {
                                currentScreen = .orders
                            }

                            Spacer()

                            VStack(spacing: 0) {
                                Spacer()

                                Image("Menu1")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .padding(3)

                                Spacer()

                                Text("Клинеры")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Spacer()
                            }
                            .foregroundColor(currentScreen == .cleaners ? activeColor : inactiveColor)
                            .onTapGesture {
                                currentScreen = .cleaners
                            }

                            Spacer()

                            VStack(spacing: 0) {
                                Spacer()

                                Image("Menu2")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .padding(3)

                                Spacer()

                                Text("Бонусы")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Spacer()
                            }
                            .foregroundColor(currentScreen == .bonuses ? activeColor : inactiveColor)
                            .onTapGesture {
                                currentScreen = .bonuses
                            }

                            Spacer()

                            VStack(spacing: 0) {
                                Spacer()

                                Image("Menu3")
                                    .resizable()
                                    .renderingMode(.template)
                                    .scaledToFit()
                                    .padding(3)

                                Spacer()

                                Text("Помощь")
                                    .font(.system(size: 15))
                                    .fontWeight(.semibold)

                                Spacer()
                            }
                            .foregroundColor(currentScreen == .help ? activeColor : inactiveColor)
                            .onTapGesture {
                                currentScreen = .help
                            }

                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: UIScreen.main.bounds.width, height: 72)
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
