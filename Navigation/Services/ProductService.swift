//
//  ProductService.swift
//  Navigation
//
//  Created by KevinMartinez on 10/3/25.
//

import Foundation

protocol ProductServiceType {
    func fetchProducts(completion: @escaping (Result<[String], Error>) -> Void)
    func deleteProduct(id: String, completion: @escaping (Result<Void, Error>) -> Void)
    func createProduct(name: String, completion: @escaping (Result<String, Error>) -> Void)
}

struct ProductService: ProductServiceType {
    
    func fetchProducts(completion: @escaping (Result<[String], Error>) -> Void) {
        completion(.success(["Product 1", "Product 2", "Product 3"]))
    }
    
    func deleteProduct(id: String, completion: @escaping (Result<Void, Error>) -> Void) {
        completion(.success(()))
    }
    
    func createProduct(name: String, completion: @escaping (Result<String, Error>) -> Void) {
        completion(.success(name))
    }
}
