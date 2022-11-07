import SwiftUI
import PlaygroundSupport 
 
struct ContentView: View {
    var body: some View {
        VStack{
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 44, height: 44)

            
            Ellipse()
                .stroke(Color.black, lineWidth: 2)
                .frame(width: 88, height: 44)
            
            Rectangle()
                .foregroundColor(.blue)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                
 
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.red)
                .frame(height: 44)
                .overlay(Text("click").bold().foregroundColor(Color.white))
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            
            Capsule()
                .fill(Color.green)
                .frame(height: 44)
                .overlay(Text("Bottom").bold())
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
            
        }
        .background(Color.gray)
        .frame(width: 400, height: 600)
        
    }
}






PlaygroundPage.current.setLiveView(ContentView())
