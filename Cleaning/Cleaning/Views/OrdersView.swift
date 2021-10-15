import SwiftUI

struct OrdersView: View {
    enum Section {
        case relevant
        case completed
    }
    
    @State var section = Section.relevant
    
    let activeColor = Color(R: 54, G: 86, B: 249)
    let inactiveColor = Color(R: 198, G: 207, B: 255)
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                VStack(spacing: 5) {
                    Text("Актуальные")
                        .foregroundColor(section == .relevant ? activeColor : inactiveColor)
                        .fontWeight(.bold)
                    
                    RoundedRectangle(cornerRadius: 26.0)
                        .frame(width: 13, height: 3)
                        .foregroundColor(activeColor)
                        .opacity(section == .relevant ? 1.0 : 0.0)
                }
                .onTapGesture {
                    section = .relevant
                }
                
                Spacer()
                
                VStack(spacing: 5) {
                    Text("Выполненные")
                        .foregroundColor(section == .completed ? activeColor : inactiveColor)
                        .fontWeight(.bold)
                    
                    RoundedRectangle(cornerRadius: 26.0)
                        .frame(width: 13, height: 3)
                        .foregroundColor(activeColor)
                        .opacity(section == .completed ? 1.0 : 0.0)
                }
                .onTapGesture {
                    section = .completed
                }
                
                Spacer()
            }
            .font(.system(size: 24))
            
            Group {
                switch(section) {
                case .relevant:
                    RelevantOrdersView()
                case .completed:
                    Spacer()
                    Text("Completed")
                    Spacer()
                }
            }
        }
        .padding(.vertical)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
