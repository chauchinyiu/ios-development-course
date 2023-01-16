import SwiftUI
import PlaygroundSupport
 
struct ContentView: View {
 
    var body: some View {
        VStack {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 20, weight: .light))
                .imageScale(.large)
            
            Image(systemName: "calendar.badge.plus")
                .symbolRenderingMode(.palette)
        
            
            Image(systemName: "j.square.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .green)
                .font(.system(size: 60))
           
            Image(systemName: "person.3.sequence.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.blue, .green, .red)
                .font(.system(size: 60))
          
            Image(systemName: "person.3.sequence.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    .linearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [.green, .black], startPoint: .top, endPoint: .bottomTrailing),
                    .linearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottomTrailing)
                )
                .font(.system(size: 144))
               
        }
        .frame(width: 400, height: 400)
        .padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            
    }
}

 
PlaygroundPage.current.setLiveView(ContentView())
