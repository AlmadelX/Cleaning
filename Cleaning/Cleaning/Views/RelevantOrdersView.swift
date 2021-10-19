import SwiftUI

struct RelevantOrdersView: View {
    var body: some View {
        GeometryReader { metrics in
            ZStack {
                VStack {
                    Spacer()
                    
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color("Lavender"))
                        .padding(.horizontal)
                        .frame(width: metrics.size.width, height: metrics.size.height * 0.75)
                }
                
                VStack {
                    Image("Woman")
                        .resizable()
                        .scaledToFit()
                        .padding(.trailing, 40)
                    
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(Color("White"))
                        
                        VStack {
                            Text("Закажите уборку")
                                .foregroundColor(Color("Acadia"))
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .padding(.top)
                            Text("Пришлем проверенного клинера и наведем порядок в вашем доме")
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 32)
                                .foregroundColor(Color("Manatee"))
                            
                            Spacer()
                            
                            HStack {
                                Image("High_Voltage")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                
                                Text("от 650 ₽")
                                    .fontWeight(.bold)
                                    .font(.system(size: 22))
                                    .foregroundColor(Color("EastBay"))
                            }
                            .padding(.horizontal, 32)
                            
                            NavigationButtonElement(destination: OrderStep1View()) {
                                HStack {
                                    Text("Заказать уборку")
                                        .fontWeight(.bold)
                                    
                                    Image("ForwardArrow")
                                        .resizable()
                                        .renderingMode(.template)
                                        .scaledToFit()
                                        .frame(width: 7)
                                }
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
