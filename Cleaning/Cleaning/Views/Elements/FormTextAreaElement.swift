import SwiftUI

struct FormTextAreaElement: View {
    var label: String
    
    @Binding var data: String
    
    init(label: String, data: Binding<String>) {
        self.label = label
        self._data = data
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color("White"))
            
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color("Lavender"), lineWidth: 4)
            
            VStack {
                HStack {
                    Group {
                        if data.isEmpty {
                            Text(label)
                                .foregroundColor(Color("DarkGrey"))
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
            
            HStack {
                TextEditor(text: $data)
                    .font(.system(size: 14).weight(.bold))
                    .foregroundColor(Color("CoffeeBean"))
                
                Spacer()
            }
            .padding(.horizontal, 11)
            .padding(.vertical, 10)
        }
    }
}

struct FormTextAreaElement_Previews: PreviewProvider {
    static var previews: some View {
        FormTextAreaElement(label: "Комментарий к заказу", data: .constant(""))
            .frame(height: 200)
            .padding(.horizontal)
    }
}
