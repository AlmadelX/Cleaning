import SwiftUI

struct CreatedOrderElement: View {
    @EnvironmentObject var appState: AppStateModel
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 14.0)
                    .fill(Color("White"))
                
                RoundedRectangle(cornerRadius: 14.0)
                    .stroke(Color("Lavender"), lineWidth: 4)
                
                VStack(spacing: 16) {
                    HStack {
                        Text("Заказ #12331")
                            .foregroundColor(Color("Vulcan"))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                        
                        Spacer()
                        
                        Text(appState.orderPrice)
                            .foregroundColor(Color("EastBay"))
                            .fontWeight(.bold)
                            .font(.system(size: 20))
                    }
                    .padding(.top)
                    
                    Text(String(appState.orderAddress))
                        .foregroundColor(Color("Manatee"))
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Image("HourGlass")
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        Text("Поиск\nклинера")
                            .foregroundColor(Color("LighterBlue"))
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 11.0)
                                .foregroundColor(Color("Lavender"))
                            
                            Text("Подробнее")
                                .foregroundColor(Color("LighterBlue"))
                                .fontWeight(.bold)
                        }
                        .frame(width: 130)
                    }
                    .frame(height: 60)
                }
                .padding()
            }
            .padding()
            .frame(height: 200)
            
            NavigationButtonElement(destination: OrderStep1View(), isRoot: true) {
                HStack {
                    Image("High_Voltage")
                        .resizable()
                        .frame(width: 15, height: 18)
                    
                    Text("от 650 ₽")
                        .fontWeight(.bold)
                        .font(.system(size: 18))
                        .foregroundColor(Color("White"))
                    
                    Spacer()
                    
                    Text("Заказать уборку")
                        .fontWeight(.bold)
                    
                    Image("ForwardArrow")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 7)
                }
                .padding()
            }
            
            Spacer()
        }
        .padding(.top)
    }
}

struct CreatedOrderElement_Previews: PreviewProvider {
    static var previews: some View {
        CreatedOrderElement()
            .environmentObject(AppStateModel())
    }
}
