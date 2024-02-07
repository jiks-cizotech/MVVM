//
//  UserModel.swift
//  MVVM
//
//  Created by jignesh solanki on 05/02/24.
//

import Foundation

struct UserModel: Decodable {
    let products : [Products]?
    let total : Int?
    let skip : Int?
    let limit : Int?
}
struct Products : Decodable {
    let id : Int?
    let title : String?
    let description : String?
    let price : Int?
    let discountPercentage : Double?
    let rating : Double?
    let stock : Int?
    let brand : String?
    let category : String?
    let thumbnail : String?
    let images : [String]?
}
