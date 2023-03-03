import SwiftUI
import shared

struct ContentView: View {
	
	var body: some View {
        if #available(iOS 16.0, *) {
            NavigationView {
                NavigationLink(
                    "Let's Go",
                    destination: HelloView(id: 0)
                )
            }
        } else {
            // Fallback on earlier versions
        }
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
