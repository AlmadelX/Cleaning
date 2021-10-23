import SwiftUI

struct RelevantOrdersView: View {
    @EnvironmentObject var appState: AppStateModel
    
    var body: some View {
        ZStack {
            MakeOrderElement()
                .opacity(appState.isOrderMade ? 0.0 : 1.0)
                .disabled(appState.isOrderMade ? true : false)
            
            CreatedOrderElement()
                .opacity(appState.isOrderMade ? 1.0 : 0.0)
                .disabled(appState.isOrderMade ? false : true)
        }
    }
}

struct RelevantOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        RelevantOrdersView()
    }
}
