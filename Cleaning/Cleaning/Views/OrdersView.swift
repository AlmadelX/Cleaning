import SwiftUI

struct OrdersView: View {
    @State var section = TopSectionMenuElementModel.Sections.relevant
    
    private let models = [
        TopSectionMenuElementModel(
            section: .relevant,
            text: "Актуальные"
        ),
        TopSectionMenuElementModel(
            section: .completed,
            text: "Выполненные"
        )
    ]
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                ForEach(models.indices, id: \.self) { id in
                    TopSectionMenuElement(
                        currentSelection: $section,
                        model: models[id]
                    )
                    
                    Spacer()
                }
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
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct OrdersView_Previews: PreviewProvider {
    static var previews: some View {
        OrdersView()
    }
}
