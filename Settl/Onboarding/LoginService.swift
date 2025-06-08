//
//  LoginService.swift
//  Settl
//
//  Created by Sumit Gera on 07/06/25.
//

import Foundation
import Combine

struct GoogleLoginParams: Codable {
  let email: String
  let idToken: String
  let expirationDate: Date
  
  enum CodingKeys: String, CodingKey {
    case email = "email"
    case idToken = "id_token"
    case expirationDate = "expiration_date"
  }
}

struct GoogleAuthResponse: Codable {
  let accessToken: String
  
  enum CodingKeys: String, CodingKey {
    case accessToken = "token"
  }
}

struct APIConstants {
  static let baseURL = URL(string: "http://127.0.0.1:8080")!
  static let contentTypeKey = "Content-Type"
  static let contentTypeJSON = "application/json"
}

enum APIHttpMethod: String {
  case post = "POST"
}

struct APIEndpoint {
  static let googleLogin = "/api/auth/google-login"
}

protocol LoginClientProtocol {
  func loginWithGoogle(params: GoogleLoginParams) -> AnyPublisher<GoogleAuthResponse, Error>
}

final class LoginClient: LoginClientProtocol {
  func loginWithGoogle(params: GoogleLoginParams) -> AnyPublisher<GoogleAuthResponse, Error> {
    let url = APIConstants.baseURL.appendingPathComponent(APIEndpoint.googleLogin)
    return DefaultAPIClient.shared.request(url: url, method: .post, headers: [:], body: try? JSONEncoder().encode(params))
  }
}

protocol APIClient {
  func request<T: Decodable>(
    url: URL,
    method: APIHttpMethod,
    headers: [String: String]?,
    body: Data?
  ) -> AnyPublisher<T, Error>
}

final class DefaultAPIClient: APIClient {
  static let shared: APIClient = DefaultAPIClient()
  
  func request<T>(url: URL, method: APIHttpMethod, headers: [String : String]?, body: Data?) -> AnyPublisher<T, any Error> where T : Decodable {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    request.setValue(APIConstants.contentTypeJSON, forHTTPHeaderField: APIConstants.contentTypeKey)
    
    request.httpBody = body
    
    // Creating JSONDecoder
    let decoder = JSONDecoder()
    
    return URLSession.shared.dataTaskPublisher(for: request)
      .tryMap { result -> Data in
        guard let response = result.response as? HTTPURLResponse,
              200..<300 ~= response.statusCode else {
          throw URLError(.badServerResponse)
        }
        return result.data
      }
      .decode(type: T.self, decoder: decoder)
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
  
  
}
