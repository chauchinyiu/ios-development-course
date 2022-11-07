import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                Text("hello world")
            }
//            .frame(width: 600, height: 200, alignment: .center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
            
            HStack{
                Text("hello world")
            }
            .background(Color.blue)
            .frame(width: 600, height: 200, alignment: .center)
            
            HStack{
                Text("hello world")
            }
            .background(Color.green)
            .frame(width: 600, height: 200, alignment: .center)
            
        }.background(Color.gray)
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
