import Foundation
import Combine
import SwiftUI
import PlaygroundSupport



class ContentViewModel: ObservableObject {
    @Published var temp = 10.0
    @Published var warningImage = Image(systemName: "smoke.fill")
    
    func processTemp() {
        if temp <= 0 {
            warningImage =  Image(systemName: "snowflake.circle.fill")
        }else if temp > 0 && temp < 20 {
            warningImage =  Image(systemName: "smoke.fill")
        }else {
            warningImage = Image(systemName: "sun.max.fill")
        }
        
    }
}



struct ContentView: View {
    @ObservedObject var contentVM = ContentViewModel()
    
    var body: some View {
        VStack {
            Slider(value: $contentVM.temp,
                   in: -50...50,
                   onEditingChanged: { editing in
                        self.contentVM.processTemp()
               })
                
            Text("Temperature = \(contentVM.temp)")
            contentVM.warningImage.font(.system(size: 144))

        }
        
    }
}


PlaygroundPage.current.setLiveView(ContentView())


