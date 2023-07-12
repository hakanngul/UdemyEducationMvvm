////
////  UserControllerService.swift
////  SwiftUI-InternetIslemleri
////
////  Created by Hakan Gül on 11/07/2023.
////
//
//import Foundation
//
//class UserController: BaseService {
//
//    override init(endPoint: String) {
//        super.init(endPoint: "kisiler")
//    }
//    
//    func createUser(user: User, completion: @escaping (Result<User, Error>) -> Void) {
//        create(object: user) { (result: Result<User, Error>) in
//            switch result {
//                case .success(let createdUser):
//                    completion(.success(createdUser))
//                case .failure(let error):
//                    completion(.failure(error))
//            }
//        }
//    }
//
//    func readUsers(completion: @escaping (Result<[User], Error>) -> Void) {
//        read<User>(completion: { (result: Result<[User], Error>) in
//            switch result {
//                case .success(let users):
//                    completion(.success(users))
//                case .failure(let error):
//                    completion(.failure(error))
//            }
//        })
//    }
//
//
//    func updateUser(user: User, completion: @escaping (Result<User, Error>) -> Void) {
//        update(object: user) { result in
//            switch result {
//                case .success(let updatedUser):
//                    completion(.success(updatedUser))
//                case .failure(let error):
//                    completion(.failure(error))
//            }
//        }
//    }
//
//    func deleteUser(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
//        delete(object: user) { result in
//            switch result {
//                case .success:
//                    completion(.success(()))
//                case .failure(let error):
//                    completion(.failure(error))
//            }
//        }
//    }
//}
