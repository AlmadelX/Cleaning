import SwiftUI

struct OrderStep1View: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var promocode = ""
    @State var numberOfRooms = 0
    @State var numberOfBathrooms = 0
    
    var body: some View {
        ZStack {
            BackgroundGradientElement(
                colors: [Color("Magnolia"), Color("Seashell")]
            )
            
            VStack(spacing: 16) {
                VStack {
                    HStack(spacing: 16) {
                        SquareButtonElement(
                            backgroundColor: Color("Lavender"),
                            action: {
                                withAnimation {
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }
                        ) {
                            Image("BackwardArrow")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("LighterBlue"))
                                .scaledToFit()
                                .frame(height: 13)
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .frame(height: 60)
                                .foregroundColor(Color("Linen"))
                            
                            HStack {
                                Spacer()
                                
                                Image("Promocode")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 16)
                                
                                ZStack {
                                    TextField("", text: $promocode)
                                        .font(.system(size: 14).weight(.bold))
                                        
                                    
                                    HStack {
                                        Group {
                                            if promocode.isEmpty {
                                                Text("Ввести промокод")
                                                    .fontWeight(.bold)
                                                    .font(.system(size: 14))
                                            }
                                        }
                                        
                                        Spacer()
                                    }
                                }
                                .frame(width: 134)
                                .foregroundColor(Color("Ochre"))
                                .padding(.trailing)
                                
                                Spacer()
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    Image("Room")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width)
                }
                
                Text("Расскажите о вашей квартире")
                    .foregroundColor(Color("Vulcan"))
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 27)
                
                Text("Количество комнат")
                    .foregroundColor(Color("Vulcan"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                
                NumberSelectorElement(size: 4, selector: $numberOfRooms)
                
                Text("Санузлов")
                    .foregroundColor(Color("Vulcan"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                
                NumberSelectorElement(size: 4, selector: $numberOfBathrooms)
                
                NavigationButtonElement(destination: OrderStep2View(numberOfRooms: numberOfRooms, numberOfBathrooms: numberOfBathrooms)) {
                    HStack {
                        Text("≈ 3 Часа")
                            .foregroundColor(Color("Quartz"))
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Text("ДАЛЕЕ")
                            .foregroundColor(Color("WhiteSmoke"))
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Text("650 ₽")
                            .foregroundColor(Color("White"))
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding(.trailing)
                    }
                }
                .padding(.top, 5)
                .opacity(numberOfRooms > 0 && numberOfBathrooms > 0 ? 1.0 : 0.0)
                .disabled(numberOfRooms == 0 || numberOfBathrooms == 0)
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OrderStep1View_Previews: PreviewProvider {
    static var previews: some View {
        OrderStep1View()
    }
}
