import SwiftUI
import PlaygroundSupport
 
struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
    var artworkUrl60: String
}

class ContentViewModel: ObservableObject{
    @Published var results = [Result]()
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) =  try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }    
        }
        catch {
            print("Invalid Data")
        }
    }
 
}

struct ContentView: View {
   
    @ObservedObject var contentViewModel = ContentViewModel()
    
    var body: some View {
        List(contentViewModel.results, id: \.trackId) { item in
            
            HStack(alignment: .center){
                AsyncImage(url: URL(string: item.artworkUrl60))
                    .frame(width: 60, height: 60)
                VStack(alignment: .leading) {
                    Text(item.trackName)
                        .font(.headline)
                    Text(item.collectionName)
                }
            }
       
        }
        .task {
           await contentViewModel.loadData()
        }
        
  
    }
 
}

PlaygroundPage.current.setLiveView(ContentView())




