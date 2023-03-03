import SwiftUI
import KMMViewModelCore
import KMMViewModelSwiftUI
import shared

struct SheetView: View {
    
    @StateViewModel var viewModel: SheetViewModel = SheetViewModel()
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.viewState.counter)")
            Text("\(viewModel.viewState.text)")
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
