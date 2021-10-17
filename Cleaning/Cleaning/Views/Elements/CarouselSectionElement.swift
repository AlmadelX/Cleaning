import SwiftUI

struct CarouselSectionElement: View {
    var sectionName: String
    var elements: [CarouselElementModel]
    var mainColor: Color
    var backgroundColor: Color
    
    var body: some View {
        VStack {
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
                        CarouselElementView(
                            model: elements[id],
                            mainColor: mainColor,
                            backgroundColor: backgroundColor
                        )
                    }
                }
                .padding()
            }
        }
    }
}

struct CarouselSectionElement_Previews: PreviewProvider {
    static var previews: some View {
        CarouselSectionElement(
            sectionName: "Кухня",
            elements: [
                CarouselElementModel(
                    image: Image("Pan"),
                    name: "Помыть плиту",
                    price: 320,
                    time: 20
                ),
                CarouselElementModel(
                    image: Image("Microwave"),
                    name: "Помыть внутри микроволновки",
                    price: 120,
                    time: 20
                ),
                CarouselElementModel(
                    image: Image("Smell"),
                    name: "Вывести запахи",
                    price: 500,
                    time: 20
                )
            ],
            mainColor: Color("NeonCarrot"),
            backgroundColor: Color("Linen")
        )
    }
}
