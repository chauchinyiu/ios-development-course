import SwiftUI
import PlaygroundSupport
 

struct LandscapeImage: Identifiable {
    let id = UUID()
    let name: String
    let description: String
}


struct ContentView: View {
    let images = [
        LandscapeImage(name: "1", description: "wow, amazing"),
        LandscapeImage(name: "2", description: "great!"),
        LandscapeImage(name: "3", description: "beautiful"),
        LandscapeImage(name: "4", description: "spectacle"),
        LandscapeImage(name: "5", description: "great view!"),
        LandscapeImage(name: "6", description: "fantastic!!!"),
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(images) { image in
                    //playground problem
                    //Image("\($0)") should work in normal iOS development
                    HStack() {
                        Image(uiImage: UIImage(named: "\(image.name).jpg")!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200, height: 200)
                        Text(image.description)
                            .padding(20)
                    }
                }
            }
        }.frame(width: 400, height: 600)
    }
}

 
PlaygroundPage.current.setLiveView(ContentView())
