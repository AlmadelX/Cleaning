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
                    
                    RoundedRectangle(cornerRadius: 14)
                        .foregroundColor(Color(R: 255, G: 255, B: 255))
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
