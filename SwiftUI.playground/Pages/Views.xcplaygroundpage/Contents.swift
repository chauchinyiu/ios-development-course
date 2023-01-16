import SwiftUI
import PlaygroundSupport
struct ContentView: View {
    var body: some View {
        VStack{
            Rectangle()
                .foregroundColor(.blue)
                .overlay(Text("Hello world").bold().foregroundColor(Color.white))
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                .frame(width: 300, height: 100)
       
            HStack{
                Rectangle()
                    .foregroundColor(.red)
                    .overlay(Ellipse()
                        .fill(Color.blue)
                        .frame(width:44, height: 250)
                        .overlay(Text("Leftside").bold())
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15)))
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                    .frame(width: 120, height: 300)
                
                VStack {
                    Rectangle()
                        .foregroundColor(.green)
                        .overlay(Text("Text").bold().foregroundColor(Color.white))
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .frame(width: 200, height: 50 )
                    Rectangle()
                        .foregroundColor(.pink)
                        .overlay(Text("Hello world").bold().foregroundColor(Color.white))
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .frame(width: 200, height: 50 )
                    Rectangle()
                        .foregroundColor(.yellow)
                        .overlay(Text("Hello world").bold().foregroundColor(Color.white))
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .frame(width: 200, height: 50 )
                }
                
            }
            
        }
        
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())
