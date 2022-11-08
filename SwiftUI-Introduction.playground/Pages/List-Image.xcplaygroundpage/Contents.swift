import SwiftUI
import PlaygroundSupport
 
struct ContentView: View {
    var body: some View {
        List(1..<7) {
            //playground problem
            //Image("\($0)") should work in normal iOS development
            
            Image(uiImage: UIImage(named: "\($0).jpg")!)
             
                .resizable()
                .aspectRatio(contentMode: .fit)
 
        }
        .frame(width: 400, height: 600)
        .refreshable {
                       print("Do your refresh work here")
                   }
    }
}

 
PlaygroundPage.current.setLiveView(ContentView())
