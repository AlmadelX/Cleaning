import SwiftUI

struct OrderTimeView: View {
    @Binding var currentSelection: SelectorMenuModel.Selections
    
    var models: [String] {
        var result: [String] = []
        for i in 1...31 {
            var str = String(i)
            switch i % 7 {
            case 0:
                str += ", чт"
            case 1:
                str += ", пт"
            case 2:
                str += ", сб"
            case 3:
                str += ", вс"
            case 4:
                str += ", пн"
            case 5:
                str += ", вт"
            default:
                str += ", ср"
            }
            result.append(str)
        }
        
        return result
    }
    
    var body: some View {
        VStack {
            Text("Выберите удобные дату и время")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 30))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 27)
                .padding(.vertical)
                .fixedSize(horizontal: false, vertical: true)
            
            Text("Октябрь, 2021")
                .foregroundColor(Color("Vulcan"))
                .font(.system(size: 16))
                .fontWeight(.bold)
                .padding(.vertical)
            
            InlineSelectorElement(models: models)
            
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
