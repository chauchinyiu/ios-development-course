//: [Previous](@previous)

import SwiftUI
import Foundation
import PlaygroundSupport

/*:
   Step 1: Get the data from here https://dummyjson.com/users
*/
 
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
 
    
    func fetch(completion: @escaping (Result<Users, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/users") else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                completion(.failure(error))
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(Users.self, from: data)
                          
                        completion(.success(decodedUsers))
                    } catch let error {
                        print("Error decoding: ", error)
                        completion(.failure(error))
                    }
                }
            }
        }

        dataTask.resume()
    }

   
}

/*:
   Step 2: Get Users as an object
*/

class ContentViewModel: ObservableObject {
    @Published var users: Users = Users(users: [])
 
    func getUsers() {
        users.fetch { result in
            if case .success(let users) = result {
                self.users = users
            }
            else if case .failure(let error) = result {
                //TODO: error handling
                print(error.localizedDescription)
            }
        }

    }
   
}

/*:
   Step 3: Display Users
*/
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
                    .contentShape(Rectangle())
                    .onTapGesture {
                        print("Show address for \(user.firstName) :\(user.address) "  )
                    }
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
