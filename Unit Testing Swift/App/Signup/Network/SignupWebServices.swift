//
//  SignupWebServices.swift
//  Unit Testing Swift
//
//  Created by ABDELAZiZ EL ARASSi on 8/5/2024.
//

import Foundation

class SignupWebServices {
    
    private var urlSession: URLSession
    private var urlString: String
    
    init(url: String, urlSession: URLSession = .shared) {
        self.urlString = url
        self.urlSession = urlSession
    }
    
    func signup(widthForm formModel: SignFormRequestModel, 
                completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(nil, SignupError.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let datatask = urlSession.dataTask(with: request) { data, response, error in
            if let requestError = error {
                print("abdelaziz \(requestError)")
                print("abdelaziz \(requestError.localizedDescription)")
                completionHandler(nil, SignupError.failedRequest(description: requestError.localizedDescription))
            }
            
            if let data = data, let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel, nil)
            } else {
                // DOTO: Create a new unit test to handle error here
                completionHandler(nil, SignupError.invalidResponseModel)
            }
        }
        datatask.resume()
    }
}
