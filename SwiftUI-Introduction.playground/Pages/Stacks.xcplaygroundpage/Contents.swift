import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack{
            HStack{
                Text("hello world")
            }
            .frame(width: 300, height: 200)
            .background(Color.red)
            
            HStack{
                Text("hello world")
            }
            .frame(width: 300, height: 200)
            .background(Color.blue)
           
            
            HStack{
                Text("hello world")
            }
            .background(Color.green)
            .frame(width: 300, height: 200)
            
        }.background(Color.gray)
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
