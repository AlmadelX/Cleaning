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
            
            VStack() {
                HStack {
                    Spacer()
                    
                    RadioButtonElement(isPressed: $isSelected, color: mainColor)
                }
                
                Spacer()
                
                model.image
                    .resizable()
                    .scaledToFit()
                    .padding(.trailing, 36)
                
                HStack() {
                    Text(model.name)
                        .foregroundColor(Color("Vulcan"))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.leading)
                        .frame(width: 143, height: 51, alignment: .topLeading)
                        .lineLimit(2)
                    
                    VStack {
                        Image("InformationIcon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("StarkWhite"))
                            .scaledToFit()
                            .frame(width: 16)
                        
                        Spacer()
                    }
                    .frame(height: 51)
                    
                    Spacer()
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5.0)
                            .foregroundColor(mainColor)
                        
                        Text(String(model.price) + " ₽")
                            .foregroundColor(Color("White"))
                            .font(.system(size: 16))
                            .fontWeight(.bold)
                    }
                    .frame(width: 72, height: 27)
                    .onTapGesture {
                        isSelected.toggle()
                    }
                    
                    Spacer()
                    
                    Text(String(model.time) + " мин.")
                        .foregroundColor(Color("StarkWhite"))
                        .font(.system(size: 16))
                        .fontWeight(.semibold)
                }
            }
            .padding()
        }
        .frame(width: 212, height: 261)
    }
}

struct CarouselElementView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselElementView(
            model: CarouselElementModel(
                image: Image("Pan"),
                name: "Помыть плиту",
                price: 320,
                time: 20
            ),
            mainColor: Color("NeonCarrot"),
            backgroundColor: Color("Linen")
        )
    }
}
