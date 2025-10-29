//
//  AuthService.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//


import Foundation

protocol AuthServiceType {
    func login(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void)
    func logout(completion: @escaping (Result<Bool, Error>) -> Void)
    func isLoggedIn() -> Bool
}

struct AuthService: AuthServiceType {
    func login(username: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(true))
    }
    
    func logout(completion: @escaping (Result<Bool, Error>) -> Void) {
        completion(.success(true))
    }
    
    func isLoggedIn() -> Bool {
        return false
    }
}


