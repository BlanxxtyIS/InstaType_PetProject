//
//  OAuth2Service.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 25.07.2024.
//

import Foundation

enum NetworkError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
}

class OAuth2Service {

    static let shared = OAuth2Service()
    private init() { }

    func makeOAuthTokenRequest(code: String) -> URLRequest {
        let baseURL = URL(string: "https://unsplash.com")!
        let url = URL(
            string: "/oauth/token"
            + "?client_id=\(Constants.accessKey)"
            + "&client_secret=\(Constants.secretKey)"
            + "&redirect_uri=\(Constants.redirectURI)"
            + "&code=\(code)"
            + "&grant_type=authorization_code",
            relativeTo: baseURL
        )!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        return request
    }
    
    private func fetchOAuthToken(code: String, handler: @escaping (Result<Data, Error>) -> Void) {
        let request = makeOAuthTokenRequest(code: code)
        
        let urlSession = URLSession.shared
        let task: URLSessionDataTask = urlSession.dataTask(with: request) { data, response, error in
            if let error = error {
                handler(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode > 300 {
                handler(.failure(NetworkError.httpStatusCode(response.statusCode)))
                print(response.statusCode)
                return
            }
            
            guard let data = data else { return }
            handler(.success(data))
            print(data)
        }
        task.resume()
    }
    
    private func loadUnsplashData(code: String, handler: @escaping (Result<BearerToken, Error>) -> Void) {
        fetchOAuthToken(code: code) { result in
            switch result {
            case .success(let data):
                do {
                    let bearerToken = try JSONDecoder().decode(BearerToken.self, from: data)
                    handler(.success(bearerToken))
                } catch {
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
    func load(code: String) {
        loadUnsplashData(code: code) { [weak self] result in
            DispatchQueue.main.async {
                guard self != nil else { return }
                switch result {
                case .success(let bearerToken):
                    print(bearerToken)
                    print(bearerToken.accessToken)
                    UserDefaults.standard.setValue(bearerToken.accessToken, forKey: "accessToken")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}


