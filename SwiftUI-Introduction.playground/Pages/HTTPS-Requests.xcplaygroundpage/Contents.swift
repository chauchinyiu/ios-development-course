//: [Previous](@previous)

import SwiftUI
import Foundation
import PlaygroundSupport


//TODO: let's GET the data from here https://dummyjson.com/users


struct Users : Decodable {
    var users: [User]
    
    struct User: Identifiable, Decodable {
        var id: Int
        var firstName: String
        var lastName: String
        var email: String
        var address: Address
        var phone: String
        
        
        struct Address: Decodable {
            var address: String
        }
    }
}

class ContentViewModel: ObservableObject {
    @Published var users: Users = Users(users: [])

    func getUsers() {
        guard let url = URL(string: "https://dummyjson.com/users") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(Users.self, from: data)
                        self.users = decodedUsers
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
}

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel = ContentViewModel()

    var body: some View {
        ScrollView {
            Text("All users")
                .font(.title)
                .bold()

            VStack(alignment: .leading) {
                ForEach(viewModel.users.users) { user in
                    HStack(alignment:.top) {
                        Text("\(user.id)")

                        VStack(alignment: .leading) {
                            Text(user.firstName + " " + user.lastName)
                                .bold()

                            Text(user.email.lowercased())

                            Text(user.phone)
                        }
                    }
                    .frame(width: 300, alignment: .leading)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(20)
                }
            }

        }
        .frame(width: 400, height:800, alignment: .center)
        .padding(.vertical)
        .onAppear {
            viewModel.getUsers()
        }
    }
}


PlaygroundPage.current.setLiveView(ContentView())
