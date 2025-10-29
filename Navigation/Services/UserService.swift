//
//  UserService.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//
protocol UserServiceType {
    func fetchUserProfile(completion: @escaping (Result<String, Error>) -> Void)
    func updateUserProfile(name: String, completion: @escaping (Result<Void, Error>) -> Void)
}

struct UserService: UserServiceType {
    
    func fetchUserProfile(completion: @escaping (Result<String, Error>) -> Void) {
        // Simular fetch
        completion(.success("John Doe"))
    }
    
    func updateUserProfile(name: String, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
}
