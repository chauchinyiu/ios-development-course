import SwiftUI
import PlaygroundSupport
 
struct ContentView: View {
    @State private var firstName = ""
    @State private var isAgreement = false

    var body: some View {
        VStack {
            TextField("Enter your name", text: $firstName)
            Text(firstName)
         
            Image(systemName: isAgreement ? "checkmark.square" : "square")
            Toggle(isOn: $isAgreement) {
                Text("Agree to ...")
            }
        }
        .frame(width: 400, height: 400)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            
    }
}

 
PlaygroundPage.current.setLiveView(ContentView())
