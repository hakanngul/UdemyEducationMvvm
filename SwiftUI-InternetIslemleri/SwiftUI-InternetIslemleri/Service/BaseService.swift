//
//  BaseService.swift
//  SwiftUI-InternetIslemleri
//
//  Created by Hakan Gül on 11/07/2023.
//

import Foundation
import Alamofire

class BaseService {
    let baseUrl: String = "https://api.example.com"
    let endPoint: String
    
    init(endPoint: String) {
        self.endPoint = endPoint
    }
    
    
    func create<T: Codable>(object: T, endPoint:String, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request("\(baseUrl)/\(endPoint)", method: .post, parameters: object, encoder: JSONParameterEncoder.default).responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
                case .success(let createdObject):
                    completion(.success(createdObject))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func read<T: Codable>(endPoint:String, completion: @escaping (Result<[T], Error>) -> Void) {
        AF.request("\(baseUrl)/\(endPoint)", method: .get).responseDecodable { (response: DataResponse<[T], AFError>) in
            switch response.result {
                case .success(let objects):
                    completion(.success(objects))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func update<T: Codable>(object: T, endPoint:String, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request("\(baseUrl)/\(endPoint)", method: .put, parameters: object, encoder: JSONParameterEncoder.default).responseDecodable { (response: DataResponse<T, AFError>) in
            switch response.result {
                case .success(let updatedObject):
                    completion(.success(updatedObject))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
    
    func delete(endPoint: String, id: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        AF.request("\(baseUrl)/\(endPoint)/\(id)", method: .delete).response { response in
            if let error = response.error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
