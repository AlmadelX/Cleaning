import SwiftUI

struct RelevantOrdersView: View {
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color(R: 237, G: 240, B: 255))
                        .padding(.horizontal)
                        .frame(width: metrics.size.width, height: metrics.size.height * 0.75)
                }
                
                VStack {
                    Image("RelevantOrders")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing, 40)
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(Color(R: 255, G: 255, B: 255))
                        
                        VStack {
                            Text("Закажите уборку")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .padding(.top)
                            Text("Пришлем проверенного клинера и наведем порядок в вашем доме")
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .foregroundColor(Color(R: 147, G: 151, B: 174))
                            
                            Spacer()
                            
                            HStack {
                                Image("High_Voltage")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                Text("от 650 ₽")
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                                    .foregroundColor(Color(R: 77, G: 82, B: 107))
                            }
                            .padding(.horizontal, 32)
                            
                            NavigationLink(destination: OrderStep1View()) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 11)
                                        .foregroundColor(Color(R: 54, G: 86, B: 249))
                                    
                                    HStack {
                                        Text("Заказать уборку")
                                            .fontWeight(.bold)
                                        Image("ForwardArrow")
                                            .resizable()
                                            .renderingMode(.template)
                                            .scaledToFit()
                                            .frame(width: 7)
                                    }
                                    .foregroundColor(Color("White"))
                                }
                                .frame(height: 60)
                                .padding()
                            }
                        }
                        .padding(.horizontal, 8)
                    }
                    .padding(.horizontal, 32)
                    .frame(height: metrics.size.height * 0.47)
                    .padding(.bottom)
                }
            }
            .padding(.bottom, metrics.size.height * 0.05)
        }
    }
}

struct RelevantOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        RelevantOrdersView()
    }
}
