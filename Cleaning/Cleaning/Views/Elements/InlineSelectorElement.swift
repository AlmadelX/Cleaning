import SwiftUI

struct InlineSelectorElement: View {
    var models: [String]
    
    var body: some View {
        ZStack {
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Spacer()
                            .frame(width: UIScreen.main.bounds.width / 2.0 - 30, height: 0)
                        
                        ForEach(models.indices, id: \.self) { id in
                            ZStack {
                                RoundedRectangle(cornerRadius: 15.0)
                                    .foregroundColor(Color("Lavender"))
                                
                                Text(models[id])
                                    .foregroundColor(Color("LighterBlue"))
                                    .fontWeight(.bold)
                            }
                            .frame(width: 60, height: 60)
                            .id(id)
                            .onTapGesture {
                                withAnimation {
                                    proxy.scrollTo(id, anchor: .center)
                                }
                            }
                        }
                        
                        Spacer()
                            .frame(width: UIScreen.main.bounds.width / 2.0 - 30, height: 0)
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
