import SwiftUI

struct OrderStep2View: View {
    var body: some View {
        ZStack {
            Color("White")
                .ignoresSafeArea()
            
            VStack {
                TopBarElement()
                
                ScrollView(.vertical) {
                    Text("Дополнительные услуги")
                        .foregroundColor(Color("Vulcan"))
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                    
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
                    
                    CarouselSectionElement(
                        sectionName: "Санузел",
                        elements: [
                            CarouselElementModel(
                                image: Image("Pan"),
                                name: "Помыть ванну",
                                price: 320,
                                time: 15
                            ),
                            CarouselElementModel(
                                image: Image("Microwave"),
                                name: "Убрать накипь",
                                price: 800,
                                time: 32
                            ),
                            CarouselElementModel(
                                image: Image("Smell"),
                                name: "Глубокая чистка унитаза",
                                price: 500,
                                time: 40
                            )
                        ],
                        mainColor: Color("LighterBlue"),
                        backgroundColor: Color("DarkerGhostWhite")
                    )
                    
                    CarouselSectionElement(
                        sectionName: "Работы с питомцами",
                        elements: [
                            CarouselElementModel(
                                image: Image("Pan"),
                                name: "Мытье лотка питомца",
                                price: 320,
                                time: 10
                            ),
                            CarouselElementModel(
                                image: Image("Microwave"),
                                name: "Очистка от шерсти",
                                price: 120,
                                time: 10
                            ),
                            CarouselElementModel(
                                image: Image("Smell"),
                                name: "Глубокая чистка унитаза",
                                price: 500,
                                time: 40
                            )
                        ],
                        mainColor: Color("LighterBlue"),
                        backgroundColor: Color("DarkerGhostWhite")
                    )
                    
                    CarouselSectionElement(
                        sectionName: "Дополнительные услуги",
                        elements: [
                            CarouselElementModel(
                                image: Image("Pan"),
                                name: "Убрать что-то ещё",
                                price: 320,
                                time: 10
                            ),
                            CarouselElementModel(
                                image: Image("Microwave"),
                                name: "Химчистка одежды",
                                price: 500,
                                time: 20
                            ),
                            CarouselElementModel(
                                image: Image("Smell"),
                                name: "Химчистка мебели",
                                price: 500,
                                time: 20
                            )
                        ],
                        mainColor: Color("LighterBlue"),
                        backgroundColor: Color("DarkerGhostWhite")
                    )
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OrderStep2View_Previews: PreviewProvider {
    static var previews: some View {
        OrderStep2View()
    }
}
