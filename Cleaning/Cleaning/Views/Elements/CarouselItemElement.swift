import SwiftUI

struct CarouselItemElement: View {
    var model: ItemModel
    var mainColor: Color
    var backgroundColor: Color
    
    @State private var isSelected = false
    
    @Binding var price: Int
    @Binding var time: Double
    @Binding var addons: Set<String>
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .fill(isSelected ? backgroundColor : Color("White"))
            
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(Color("WhiteSmoke"), lineWidth: 4)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    
                    RadioButtonElement(isPressed: $isSelected, color: mainColor)
                }
                .padding(.top)
                
                Spacer()

                model.image
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, 40)

                HStack(alignment: .top, spacing: 0) {
                    Text(model.name)
                        .foregroundColor(Color("Vulcan"))
                        .font(.system(size: 14))
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
                }
                
                HStack(spacing: 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                            .foregroundColor(mainColor)

                        Text(String(model.price) + " ₽")
                            .foregroundColor(Color("White"))
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                    }
                    .frame(width: 57, height: 21)

                    Spacer()

                    Text(String(model.time) + " мин.")
                        .foregroundColor(Color("StarkWhite"))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .frame(width: 176, height: 217)
        .onTapGesture {
            isSelected.toggle()
        }
        .onChange(of: isSelected) { value in
            if value {
                price += model.price
                time += Double(model.time) / 60.0
                addons.insert(model.name)
            } else {
                price -= model.price
                time -= Double(model.time) / 60.0
                addons.remove(model.name)
            }
        }
    }
}

struct CarouselItemElement_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CarouselItemElement(
                model: ItemModel(
                    image: Image("Pan"),
                    name: "Помыть\nплиту",
                    price: 320,
                    time: 20
                ),
                mainColor: Color("NeonCarrot"),
                backgroundColor: Color("Linen"),
                price: .constant(0),
                time: .constant(0.0),
                addons: .constant([])
            )
            
            CarouselItemElement(
                model: ItemModel(
                    image: Image("Pan"),
                    name: "Помыть внутри\nмикроволновки",
                    price: 320,
                    time: 20
                ),
                mainColor: Color("NeonCarrot"),
                backgroundColor: Color("Linen"),
                price: .constant(0),
                time: .constant(0.0),
                addons: .constant([])
            )
        }
    }
}
