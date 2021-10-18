import SwiftUI

struct CarouselElementView: View {
    var model: CarouselElementModel
    var mainColor: Color
    var backgroundColor: Color
    
    @State private var isSelected = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15.0)
                .stroke(Color("WhiteSmoke"), lineWidth: 4)
                .background(isSelected ? backgroundColor : Color("White"))
            
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
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
//                        .frame(width: 143, height: 51, alignment: .topLeading)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)
//
//                    VStack {
                        Image("InformationIcon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("StarkWhite"))
                            .scaledToFit()
                            .frame(width: 10)
                            .padding(.leading, 5)
                            .padding(.top, 5)
//
//                        Spacer()
//                    }
//                    .frame(height: 51)
//
//                    Spacer()
                }
//
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
                    .onTapGesture {
                        isSelected.toggle()
                    }
//
                    Spacer()
//
                    Text(String(model.time) + " мин.")
                        .foregroundColor(Color("StarkWhite"))
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                }
                .padding(.bottom)
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: 176, maxHeight: 217)
    }
}

struct CarouselElementView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CarouselElementView(
                model: CarouselElementModel(
                    image: Image("Pan"),
                    name: "Помыть\nплиту",
                    price: 320,
                    time: 20
                ),
                mainColor: Color("NeonCarrot"),
                backgroundColor: Color("Linen")
            )
            
            CarouselElementView(
                model: CarouselElementModel(
                    image: Image("Pan"),
                    name: "Помыть внутри\nмикроволновки",
                    price: 320,
                    time: 20
                ),
                mainColor: Color("NeonCarrot"),
                backgroundColor: Color("Linen")
            )
        }
    }
}
