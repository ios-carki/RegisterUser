//
//  APIServiceModel.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import Foundation

import Alamofire

//로그인 Post해서 받은 형태 -> 토큰만 받았기 때문에 토큰 파라미터 하나만 생성
struct Login: Codable {
    let token: String
}

//로그인 데이터 받고나서 진행할 데이터
struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

class APIServiceModel {
    
    func signup(name: String, email: String, password: String, completionHandler: @escaping (Int) -> Void) {
        let api = SeSACAPI.signup(userName: name, email: email, password: password)
        
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseString { response in
            
            completionHandler(response.response?.statusCode ?? 0)
            print(response)
            print(response.response?.statusCode)
            
        }
    }
    
    
    func login(userEmail: String, userPassword: String) {
        let api = SeSACAPI.login(email: userEmail, password: userPassword)
        
        //로그인 후 받는 토큰 제이슨 데이터 디코딩
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).validate(statusCode: 200...299).responseDecodable(of: Login.self) { response in
            
            switch response.result {
                
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
            case .failure(_):
                print(response.response?.statusCode)
            }
            
        }
    }
    
    //로그인 후 처리 메서드
    func profile(completionHandler: @escaping (String, String, String) -> Void) {
        let api = SeSACAPI.profile
        
        //로그인 후 받는 토큰 제이슨 데이터 디코딩
        AF.request(api.url, method: .get, headers: api.headers).responseDecodable(of: Profile.self) { response in
            
            switch response.result {
                
            case .success(let data):
                print(data)
                completionHandler(data.user.photo, data.user.email, data.user.username)
            case .failure(_):
                print(response.response?.statusCode)
            }
            
        }
        
    }
    
    
    
}
