import SwiftUI

struct CarouselElement: View {
    var sectionName: String
    var elements: [ItemModel]
    var mainColor: Color
    var backgroundColor: Color
    
    @Binding var price: Int
    @Binding var time: Double
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(sectionName)
                    .foregroundColor(Color("Vulcan"))
                    .font(.system(size: 18))
                    .fontWeight(.bold)
                
                Spacer()
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(elements.indices, id: \.self) { id in
                        CarouselItemElement(
                            model: elements[id],
                            mainColor: mainColor,
                            backgroundColor: backgroundColor,
                            price: $price,
                            time: $time
                        )
                    }
                }
                .padding()
            }
        }
    }
}

struct CarouselElement_Previews: PreviewProvider {
    static var previews: some View {
        CarouselElement(
            sectionName: "Кухня",
            elements: [
                ItemModel(
                    image: Image("Pan"),
                    name: "Помыть плиту",
                    price: 320,
                    time: 20
                ),
                ItemModel(
                    image: Image("Microwave"),
                    name: "Помыть внутри микроволновки",
                    price: 120,
                    time: 20
                ),
                ItemModel(
                    image: Image("Smell"),
                    name: "Вывести запахи",
                    price: 500,
                    time: 20
                )
            ],
            mainColor: Color("NeonCarrot"),
            backgroundColor: Color("Linen"),
            price: .constant(0),
            time: .constant(0.0)
        )
    }
}
