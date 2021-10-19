import SwiftUI

struct FormTextFieldElement: View {
    var label: String
    
    @Binding var data: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(Color("White"))
            
            RoundedRectangle(cornerRadius: 10.0)
                .stroke(Color("Lavender"), lineWidth: 4)
            
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
            .padding()
            
            HStack {
                TextField("", text: $data)
                    .foregroundColor(Color("CoffeeBean"))
                    .font(.system(size: 14).weight(.bold))
                
                Spacer()
            }
            .padding()
        }
    }
}

struct FormTextFieldElement_Previews: PreviewProvider {
    static var previews: some View {
        FormTextFieldElement(label: "Город", data: .constant(""))
            .padding(.horizontal)
            .frame(height: 60)
    }
}
