import SwiftUI

struct OrderTimeView: View {
    @Binding var currentSelection: SelectorMenuModel.Selections
    
    var body: some View {
        VStack {
            Text("Выберите удобные дату и время")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 30))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 27)
                .padding(.vertical)
            
            Text("Май, 2021")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.vertical)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
            }
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 11)
                    .foregroundColor(Color("LighterBlue"))
                
                HStack {
                    Text("ДАЛЕЕ")
                        .foregroundColor(Color("WhiteSmoke"))
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                }
                .foregroundColor(Color("White"))
            }
            .frame(height: 60)
            .padding()
            .onTapGesture {
                withAnimation {
                    currentSelection = .checkout
                }
            }
        }
    }
}

struct OrderTimeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTimeView(currentSelection: .constant(.time))
    }
}
