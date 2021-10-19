import SwiftUI

struct OrderFormElement: View {
    @State var city = ""
    @State var street = ""
    @State var house = ""
    @State var flat = ""
    @State var block = ""
    @State var entrance = ""
    @State var comment = ""
    
    @Binding var isAddressCorrect: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            FormTextFieldElement(label: "Город", data: $city)
                .frame(height: 60)
                .padding(.horizontal)
                .onChange(of: city) { _ in
                    isAddressCorrect = check()
                }
            
            FormTextFieldElement(label: "Улица", data: $street)
                .frame(height: 60)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .onChange(of: street) { _ in
                    isAddressCorrect = check()
                }
            
            HStack(spacing: 16) {
                FormTextFieldElement(label: "Дом", data: $house)
                    .frame(height: 60)
                    .onChange(of: house) { _ in
                        isAddressCorrect = check()
                    }
                
                FormTextFieldElement(label: "Квартира", data: $flat)
                    .frame(height: 60)
                    .onChange(of: flat) { _ in
                        isAddressCorrect = check()
                    }
            }
            .padding(.horizontal)
            
            HStack(spacing: 16) {
                FormTextFieldElement(label: "Корпус", data: $block)
                    .frame(height: 60)
                    .onChange(of: block) { _ in
                        isAddressCorrect = check()
                    }
                
                FormTextFieldElement(label: "Подъезд", data: $entrance)
                    .frame(height: 60)
                    .onChange(of: entrance) { _ in
                        isAddressCorrect = check()
                    }
            }
            .padding(.horizontal)
            
            FormTextAreaElement(label: "Комментарий к заказу", data: $comment)
                .frame(height: 200)
                .padding(.horizontal)
        }
    }
    
    func check() -> Bool {
        if city.isEmpty || street.isEmpty || house.isEmpty || flat.isEmpty || block.isEmpty || entrance.isEmpty {
            return false
        }
        
        return true
    }
}

struct OrderFormElement_Previews: PreviewProvider {
    static var previews: some View {
        OrderFormElement(isAddressCorrect: .constant(false))
    }
}
