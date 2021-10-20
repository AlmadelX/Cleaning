import SwiftUI

struct InlineSelectorElement: View {
    var models: [String]
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(models, id: \.self) { model in
                        ZStack {
                            RoundedRectangle(cornerRadius: 15.0)
                                .foregroundColor(Color("Lavender"))
                        }
                        .frame(width: 60, height: 60)
                    }
                }
            }
            
            RoundedRectangle(cornerRadius: 21.0)
                .stroke(Color("LighterBlue"), lineWidth: 5.0)
                .frame(width: 76, height: 76)
        }
        .frame(width: UIScreen.main.bounds.width, height: 81)
    }
}

struct InlineSelectorElement_Previews: PreviewProvider {
    static var previews: some View {
        InlineSelectorElement(
            models: [
                "17, пн",
                "18, вт",
                "19. ср",
                "20, чт",
                "21, пт",
                "22, сб",
                "23, вс"
            ]
        )
    }
}
