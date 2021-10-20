import SwiftUI

struct TopBarElement: View {
    @Environment(\.presentationMode) var presentationMode
    
    var title = "Стандартная уборка"
    var text: String
    var showInformationIcon = true
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .foregroundColor(Color("DarkerGhostWhite"))
                .ignoresSafeArea()
            
            HStack {
                SquareButtonElement(
                    backgroundColor: Color("DarkerGhostWhite"),
                    action: {
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                ) {
                    Image("BackwardArrow")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(Color("LighterBlue"))
                        .scaledToFit()
                        .frame(height: 13)
                }
                .padding(.leading)
                
                Spacer()
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Text(title)
                        .foregroundColor(Color("Vulcan"))
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                    
                    Group {
                        if showInformationIcon {
                            Image("InformationIcon")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 20)
                        }
                    }
                }
                
                Text(text)
                    .foregroundColor(Color("Mischka"))
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
            }
        }
        .frame(height: 80)
    }
}

struct TopBarElement_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TopBarElement(text: "1 Комната, 1 Санузел")
            
            Spacer()
        }
    }
}
