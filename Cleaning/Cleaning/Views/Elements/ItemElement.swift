import SwiftUI

struct ItemElement: View {
    private let mainColor = Color("BlueZodiac")
    private let backgroundColor = Color("LightGrey")
    
    var model: ItemModel
    
    @State private var isSelected = false
    
    @Binding var price: Int
    @Binding var time: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(isSelected ? backgroundColor : Color("White"))
            
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(Color("WhiteSmoke"), lineWidth: 4)
            
            HStack {
                VStack {
                    Spacer()
                    
                    HStack(alignment: .top, spacing: 0) {
                        Text(model.name)
                            .foregroundColor(Color("Vulcan"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Image("InformationIcon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("StarkWhite"))
                            .scaledToFit()
                            .frame(width: 10)
                            .padding(.leading, 5)
                            .padding(.top, 5)
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 14) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5.0)
                                .foregroundColor(mainColor)

                            Text(String(model.price) + " ₽")
                                .foregroundColor(Color("White"))
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                        }
                        .frame(width: 57, height: 21)

                        Text(String(model.time) + " мин.")
                            .foregroundColor(Color("StarkWhite"))
                            .fontWeight(.semibold)
                            .font(.system(size: 14))
                        
                        Spacer()
                    }
                    .padding(.bottom)
                }
                
                model.image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 86)
                    .padding(.trailing, 40)
            }
            .padding(.horizontal)
            
            VStack {
                HStack {
                    Spacer()
                    
                    RadioButtonElement(isPressed: $isSelected, color: mainColor)
                        .padding()
                }
                
                Spacer()
            }
        }
        .frame(height: 142)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            isSelected.toggle()
        }
        .onChange(of: isSelected) { value in
            if value {
                price += model.price
                time += Double(model.time) / 60.0
            } else {
                price -= model.price
                time -= Double(model.time) / 60.0
            }
        }
    }
}

struct ItemElement_Previews: PreviewProvider {
    static var previews: some View {
        ItemElement(
            model: ItemModel(
                image: Image("Shirt"),
                name: "Химчистка\nодежды",
                price: 320,
                time: 20
            ),
            price: .constant(0),
            time: .constant(0)
        )
        .padding()
    }
}
