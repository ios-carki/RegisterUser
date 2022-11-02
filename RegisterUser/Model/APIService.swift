//
//  APIService.swift
//  RegisterUser
//
//  Created by Carki on 2022/11/02.
//

import Foundation

import Alamofire

enum SeSACAPI {
    case signup(userName: String, email: String, password: String)
    case login(email: String, password: String)
    case profile
}


extension SeSACAPI {
    
    var url: URL {
        switch self {
        case .signup:
            
            return URL(string: "http://api.memolease.com/api/v1/users/signup")!
        case .login:
            
            return URL(string: "http://api.memolease.com/api/v1/users/login")!
        case .profile:
            
            return URL(string: "http://api.memolease.com/api/v1/users/me")!
        }
    }
    
    var headers: HTTPHeaders {
        
        switch self {
        case .signup, .login:
            return ["Content-Type": "application/x-www-form-urlencoded"]
            
        case .profile:
            return [
            "Authorization": "Bearer \(UserDefaults.standard.string(forKey: "token") ?? "")",
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        }
    }
    
    //입력 안되는 문제가 있음 -> 연관값으로 받음(SeSACAPI enum에서 Case로 받음)
    var parameters: [String: String] {
        switch self {
        case .signup(let userName, let email, let password):
            return [
                "userName": userName,
                "email": email,
                "password": password
            ]
        case .login(let email, let password):
            return [
                "email": email,
                "password": password
            ]
        default: return ["": ""]
        }
    }
}
