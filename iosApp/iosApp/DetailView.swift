import SwiftUI
import KMMViewModelCore
import KMMViewModelSwiftUI
import shared

struct DetailView: View {
    
    @StateViewModel var viewModel: DetailViewModel
    @State var sheetVisible: Bool = false
    
    init(args: DetailArgs) {
        self._viewModel = StateViewModel(wrappedValue: DetailViewModel(args: args))
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text("\(viewModel.viewState.text)")
            Button("Expand sheet", action: { sheetVisible = true })
        }
        .sheet(
            isPresented: $sheetVisible,
            content: {
                SheetView()
            }
        )
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(args: DetailArgs(text: "Detail text"))
    }
}
