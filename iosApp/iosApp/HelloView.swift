import SwiftUI
import KMMViewModelSwiftUI
import KMMViewModelCore
import shared

struct HelloView: View {
    
    @StateViewModel private var viewModel: HelloViewModel
    private let onNextClick: (Int) -> Void
    private let onDetailClick: (DetailArgs) -> Void
    
    init(id: Int, onNextClick: @escaping (Int) -> Void, onDetailClick: @escaping (DetailArgs) -> Void) {
        self._viewModel = StateViewModel(wrappedValue: HelloViewModel(id: Int32(id)))
        self.onNextClick = onNextClick
        self.onDetailClick = onDetailClick
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.viewState.number)").font(.caption)
            Text("Haiku of The Day").font(.headline)
            Text("\(viewModel.viewState.haiku)")
            
            Button("Next screen", action: { onNextClick(Int(viewModel.viewState.id) + 1)})
            Button("Detail", action: { onDetailClick(DetailArgs(text: viewModel.viewState.haiku))})
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView(id: 0, onNextClick: {_ in}, onDetailClick: {_ in})
    }
}
