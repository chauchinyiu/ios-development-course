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
    func loadData(){
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            if let data = data {
                if let decodeResponse = try? JSONDecoder().decode(Response.self, from: data){
                    DispatchQueue.main.async {
                        self.results = decodeResponse.results
                    }
                    return
                }
            }
            
            //handle error
            print("Fetch failed: \(error?.localizedDescription ?? "unknown error") ")
        }).resume()
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
       
        }.onAppear(perform: contentViewModel.loadData)
    }
 
}

PlaygroundPage.current.setLiveView(ContentView())




