import SwiftUI
import KMMViewModelSwiftUI
import KMMViewModelCore
import shared

struct HelloView: View {
    
    @StateViewModel var viewModel: HelloViewModel
    
    
    init(id: Int) {
        self._viewModel = StateViewModel(wrappedValue: HelloViewModel(id: Int32(id)))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.viewState.number)").font(.caption)
            Text("Haiku of The Day").font(.headline)
            Text("\(viewModel.viewState.haiku)")
            
            NavigationLink(
                "Next screen",
                destination: HelloView(id: Int(viewModel.viewState.id) + 1)
            )
            
            NavigationLink(
                "Detail",
                destination: DetailView(args: DetailArgs(text: viewModel.viewState.haiku))
            )
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView(id: 0)
    }
}
