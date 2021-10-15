import SwiftUI

struct PaginationView: View {
    var model: PaginationModel
    
    @Binding var selection: Int
    
    var body: some View {
        HStack {
            ForEach(model.colors.indices, id: \.self) { id in
                Circle()
                    .frame(width: 9, height: 9)
                    .foregroundColor(model.colors[selection])
                    .opacity(selection == id ? model.opacities[0] : model.opacities[1])
                    .padding(.horizontal, 5)
            }
        }
    }
}

struct PaginationView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            PaginationView(
                model: PaginationModel(
                    colors: [Color("White"), Color("LighterBlue"), Color("Orange")],
                    opacities: [1.0, 0.5]
                ),
                selection: .constant(0)
            )
        }
    }
}
