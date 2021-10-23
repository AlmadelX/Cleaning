import SwiftUI

struct OrderStep2View: View {
    var numberOfRooms: Int
    var numberOfBathrooms: Int
    
    @State var price = 650
    @State var time = 3.0
    @State var addons: Set<String> = []
    
    var body: some View {
        ZStack {
            Color("White")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                TopBarElement(text: choice())
                
                ScrollView(.vertical) {
                    Text("Дополнительные услуги")
                        .foregroundColor(Color("Vulcan"))
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 50)
                        .padding(.top)
                    
                    CarouselElement(
                        sectionName: "Кухня",
                        elements: [
                            ItemModel(
                                image: Image("Pan"),
                                name: "Помыть\nплиту",
                                price: 320,
                                time: 20
                            ),
                            ItemModel(
                                image: Image("Microwave"),
                                name: "Помыть внутри\nмикроволновки",
                                price: 120,
                                time: 20
                            ),
                            ItemModel(
                                image: Image("Smell"),
                                name: "Вывести\nзапахи",
                                price: 500,
                                time: 20
                            )
                        ],
                        mainColor: Color("NeonCarrot"),
                        backgroundColor: Color("Linen"),
                        price: $price,
                        time: $time,
                        addons: $addons
                    )
                    
                    ItemElement(
                        model: ItemModel(
                            image: Image("Shirt"),
                            name: "Химчистка\nодежды",
                            price: 320,
                            time: 20
                        ),
                        price: $price,
                        time: $time
                    )
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    CarouselElement(
                        sectionName: "Санузел",
                        elements: [
                            ItemModel(
                                image: Image("Bath"),
                                name: "Помыть\nванну",
                                price: 320,
                                time: 15
                            ),
                            ItemModel(
                                image: Image("WashMachine"),
                                name: "Убрать\nнакипь",
                                price: 800,
                                time: 32
                            ),
                            ItemModel(
                                image: Image("Toilet"),
                                name: "Глубокая\nчистка унитаза",
                                price: 500,
                                time: 40
                            )
                        ],
                        mainColor: Color("LighterBlue"),
                        backgroundColor: Color("MediumGhostWhite"),
                        price: $price,
                        time: $time,
                        addons: $addons
                    )
                    
                    CarouselElement(
                        sectionName: "Работы с питомцами",
                        elements: [
                            ItemModel(
                                image: Image("OrangeDog"),
                                name: "Мытье лотка\nпитомца",
                                price: 320,
                                time: 10
                            ),
                            ItemModel(
                                image: Image("WhiteDog"),
                                name: "Очистка\nот шерсти",
                                price: 120,
                                time: 10
                            ),
                            ItemModel(
                                image: Image("BlackDog"),
                                name: "Восстановление\nпосле укусов",
                                price: 120,
                                time: 10
                            )
                        ],
                        mainColor: Color("NeonCarrot"),
                        backgroundColor: Color("Linen"),
                        price: $price,
                        time: $time,
                        addons: $addons
                    )
                    
                    CarouselElement(
                        sectionName: "Дополнительные услуги",
                        elements: [
                            ItemModel(
                                image: Image("ThreeDots"),
                                name: "Убрать\nчто-то ещё",
                                price: 320,
                                time: 10
                            ),
                            ItemModel(
                                image: Image("Shirt"),
                                name: "Химчистка\nодежды",
                                price: 500,
                                time: 20
                            ),
                            ItemModel(
                                image: Image("Sofa"),
                                name: "Химчистка\nмебели",
                                price: 500,
                                time: 20
                            )
                        ],
                        mainColor: Color("BlueZodiac"),
                        backgroundColor: Color("LightGrey"),
                        price: $price,
                        time: $time,
                        addons: $addons
                    )
                    
                    NavigationButtonElement(destination: OrderStep3View(
                        previousChoice: choice(),
                        time: hours(),
                        price: "\(price) ₽",
                        addons: $addons
                    )) {
                        HStack {
                            Text("≈ " + hours())
                                .foregroundColor(Color("Quartz"))
                                .font(.system(size: 16))
                                .fontWeight(.semibold)
                                .padding(.leading)
                            
                            Spacer()
                            
                            Text("ДАЛЕЕ")
                                .foregroundColor(Color("WhiteSmoke"))
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                            
                            Spacer()
                            
                            Text(String(price) + " ₽")
                                .foregroundColor(Color("White"))
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                                .padding(.trailing)
                        }
                    }
                    .padding(.top, 5)
                }
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func choice() -> String {
        var result = ""
        if numberOfRooms == 1 {
            result += "1 Комната, "
        } else {
            result += "\(numberOfRooms) Комнаты, "
        }
        if numberOfBathrooms == 1 {
            result += "1 Санузел"
        } else {
            result += "\(numberOfBathrooms) Санузла"
        }
        
        return result
    }
    
    func hours() -> String {
        var result = ""
        let floor = floor(time)
        if time == floor {
            result += String(Int(floor))
            if Int(floor) >= 5 {
                result += " Часов"
            } else {
                result += " Часа"
            }
        } else if time - floor <= 0.5 {
            result += String(Int(floor)) + ",5"
            if Int(floor) >= 5 {
                result += " Часов"
            } else {
                result += " Часа"
            }
        } else {
            result += String(Int(floor + 1.0))
            if Int(floor + 1.0) >= 5 {
                result += " Часов"
            } else {
                result += " Часа"
            }
        }
        
        return result
    }
}

struct OrderStep2View_Previews: PreviewProvider {
    static var previews: some View {
        OrderStep2View(numberOfRooms: 1, numberOfBathrooms: 1)
    }
}
