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
                    .scaledToFit()
                
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
                    .padding(.top)
                
                NumberSelectorElement(size: 4, selector: $numberOfRooms)
                
                Text("Санузлов")
                    .foregroundColor(Color("Vulcan"))
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.top)
                
                NumberSelectorElement(size: 4, selector: $numberOfBathrooms)
                
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
