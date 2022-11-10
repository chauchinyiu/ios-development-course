import SwiftUI
import PlaygroundSupport
 
struct AgreementView: View {
    @Binding var isAgreement: Bool

    var body: some View {
        Image(systemName: isAgreement ? "checkmark.square" : "square")
    }
}

struct ContentView: View {
    @State private var isAgreement = true
    @State private var firstName = ""

    var body: some View {
        VStack {
            TextField("Enter your name", text: $firstName)
            Text(firstName)
            Toggle(isOn: $isAgreement) {
                Text("Agree to ...")
            }
            AgreementView(isAgreement: $isAgreement)
        }
        .frame(width: 400, height: 400)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            
    }
}

PlaygroundPage.current.setLiveView(ContentView())
