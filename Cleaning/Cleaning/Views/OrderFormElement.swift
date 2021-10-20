import SwiftUI

struct OrderFormElement: View {
    @Binding var isAddressCorrect: Bool
    @Binding var model: AddressFormModel
    
    var body: some View {
        VStack(spacing: 16) {
            FormTextFieldElement(label: "Город", data: $model.city)
                .frame(height: 60)
                .padding(.horizontal)
                .onChange(of: model.city) { _ in
                    isAddressCorrect = check()
                }
            
            FormTextFieldElement(label: "Улица", data: $model.street)
                .frame(height: 60)
                .padding(.horizontal)
                .disableAutocorrection(true)
                .onChange(of: model.street) { _ in
                    isAddressCorrect = check()
                }
            
            HStack(spacing: 16) {
                FormTextFieldElement(label: "Дом", data: $model.house)
                    .frame(height: 60)
                    .onChange(of: model.house) { _ in
                        isAddressCorrect = check()
                    }
                
                FormTextFieldElement(label: "Квартира", data: $model.flat)
                    .frame(height: 60)
                    .onChange(of: model.flat) { _ in
                        isAddressCorrect = check()
                    }
            }
            .padding(.horizontal)
            
            HStack(spacing: 16) {
                FormTextFieldElement(label: "Корпус", data: $model.block)
                    .frame(height: 60)
                    .onChange(of: model.block) { _ in
                        isAddressCorrect = check()
                    }
                
                FormTextFieldElement(label: "Подъезд", data: $model.entrance)
                    .frame(height: 60)
                    .onChange(of: model.entrance) { _ in
                        isAddressCorrect = check()
                    }
            }
            .padding(.horizontal)
            
            FormTextAreaElement(label: "Комментарий к заказу", data: $model.comment)
                .frame(height: 200)
                .padding(.horizontal)
        }
    }
    
    func check() -> Bool {
        if model.city.isEmpty || model.street.isEmpty || model.house.isEmpty || model.flat.isEmpty || model.block.isEmpty || model.entrance.isEmpty {
            return false
        }
        
        return true
    }
}

struct OrderFormElement_Previews: PreviewProvider {
    static var previews: some View {
        OrderFormElement(
            isAddressCorrect: .constant(false),
            model: .constant(AddressFormModel())
        )
    }
}
