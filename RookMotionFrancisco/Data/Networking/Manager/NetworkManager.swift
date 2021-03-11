//
//  NetworkManager.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 08/03/21.
//

import Foundation

import Foundation

enum NetworkResponse: String {
    case succes
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

fileprivate enum Result<String> {
    case success
    case failure(String)
}

struct NetworkManager<T: EndPointType> {
    private let router = Router<T>()
    
    private func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
    
    private func decode<Object: Codable>(data: Data?, response: URLResponse?, completion: @escaping(Object?, String?) -> Void) {
        if let response = response as? HTTPURLResponse {
            let result = self.handleNetworkResponse(response)
            switch result {
            case .success:
                guard let responseData = data else {
                    completion(nil, NetworkResponse.noData.rawValue)
                    return
                }
                do {
//                    print("DEBUG: Response Data: \(responseData)")
//                    print("DEBUG: String to Data: \(String(data: responseData, encoding: .utf8))")
//                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
//                    print("DEBUG: Response Data: \(jsonData)")
                    let apiResponse = try JSONDecoder().decode(Object.self, from: responseData)
                    completion(apiResponse, nil)
                } catch {
                    print("DEBUG: Error al decodificar las credenciales:", error)
                    completion(nil, NetworkResponse.unableToDecode.rawValue)
                }
            case .failure(let networkFailureError):
                completion(nil, networkFailureError)
            }
        }
    }
}

//MARK: - HubbleNewsApi

extension NetworkManager where T == HubbleApi {
    func getHubbleNews(completion: @escaping(_ new: [HubbleNewsResponse]?, _ error: String?) -> Void) {
        router.request(.news) { (data, response, error) in
            if error != nil {
                completion(nil, "Please check your network connection.")
            }
            
            self.decode(data: data, response: response, completion: completion)
        }
    }
}
