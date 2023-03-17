import SwiftUI
import NavigationStackBackport
import shared

enum Destination : Hashable {
    case Hello(Int)
    case Detail(DetailArgs)
}

struct ContentView: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        
        NavigationStackBackport.NavigationStack(path: $path) {
            HelloView(
                id: 0,
                onNextClick: { id in path.append(Destination.Hello(id)) },
                onDetailClick: { detailArgs in path.append(Destination.Detail(detailArgs)) }
            )
            .backport.navigationDestination(for: Destination.self) { destination in
                switch destination {
                case .Hello(let id):
                    HelloView(
                        id: id,
                        onNextClick: { id in path.append(Destination.Hello(id)) },
                        onDetailClick: { detailArgs in path.append(Destination.Detail(detailArgs)) }
                    )
                case .Detail(let detailArgs):
                    DetailView(args: detailArgs)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
