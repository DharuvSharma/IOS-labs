import UIKit

print("Hello...")
var urlComponents = URLComponents(string: "https://itunes.apple.com/search")!

urlComponents.queryItems = [
    "term": "Pehle Bhi Main"
].map{ URLQueryItem(name: $0.key, value: $0.value)}


//var url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=fcDkYwadRSZ3nuj6SkIZq8Nv2z6UrI1mayHfGpFd")!


Task{ //WAY OF CREATING THREADS
    let (data, response) = try await URLSession.shared.data(from: urlComponents.url!)
    
    if let httpResponse =  response as? HTTPURLResponse{
        if httpResponse.statusCode == 200,
             let stringData = String(data: data, encoding: .utf8){
                print(stringData)
        }
    }
}
