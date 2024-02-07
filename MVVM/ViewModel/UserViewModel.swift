//
//  UserViewModel.swift
//  MVVM
//
//  Created by jignesh solanki on 05/02/24.
//

import Foundation

protocol UserServices: AnyObject {
    func reloadData() // Data Binding - PROTOCOL (View and ViewModel Communication)
}

class UserViewModel {

    var products: [Products] = [] {
        didSet {
            self.userDelegate?.reloadData()
        }
    }
    private let manager = APIManager()
    weak var userDelegate: UserServices?

    // @MainActor -> DispatchQueue.Main.async
    @MainActor func fetchProducts() {
        Task { // @MainActor in
            do {
                let userModel: UserModel = try await manager.request(url: userURL)
                self.products = userModel.products ?? []
            }catch {
                print(error)
            }
        }

    }

    // if we not use async functions so write more code like below
//    func fetchUsers() {
//        manager.fetchUsers(
//            modelType: [UserModel].self) { result in
//                switch result {
//                case .success(let userResponseArray):
//                    self.users = userResponseArray
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }

}
