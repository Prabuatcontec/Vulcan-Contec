//
//  LoginModel.swift
//  Vulcan-Contec
//
//  Created by Prabu on 20/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import Foundation

struct LoginModel: Encodable{
    let username: String
    let password:String
}
// MARK: - Welcome
struct LoginResponseModel: Codable {
    let user: User
    let code: JSONNull?
    let succeeded: Bool
    let welcomeDescription: String
    let model, result: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case user, code, succeeded
        case welcomeDescription = "description"
        case model, result
        }
}

struct userDetail:Codable {
    let userName: String
    let jwtToken:String
}
// MARK: - User
struct User: Codable {
    let id: Int
    let userName, email: String
    let phoneNumber: JSONNull?
    let jwtToken: String
    let roles: [Role]
    let userID: JSONNull?
    let menus: [Menu]
    let menuMasterData: JSONNull?
    let siteID: Int
    let siteName: String
    let stationID: Int
    let stationName, code: JSONNull?
    let succeeded: Bool
    let userDescription, result: JSONNull?
    let esdCheck: Bool
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case id, userName, email, phoneNumber, jwtToken, roles
        case userID = "userId"
        case menus, menuMasterData, siteID, siteName, stationID, stationName, code, succeeded
        case userDescription = "description"
        case result, esdCheck, fullName
        }
}

// MARK: - Menu
struct Menu: Codable {
    let id: Int
    let menu: String
    let url: String?
    let parentMenuID: String
    let sortOrder: Int
    
    enum CodingKeys: String, CodingKey {
        case id, menu, url
        case parentMenuID = "parentMenuId"
        case sortOrder
        }
}

// MARK: - Role
struct Role: Codable {
    let id: JSONNull?
    let name: String
    let userCount: Int
    let permissions: [Permission]?
    let code: JSONNull?
    let succeeded: Bool
    let roleDescription, result: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case id, name, userCount, permissions, code, succeeded
        case roleDescription = "description"
        case result
        }
}

enum Permission: String, Codable {
    case usersManage = "UsersManage"
    case usersRead = "UsersRead"
    case valuesCreate = "ValuesCreate"
    case valuesDelete = "ValuesDelete"
    case valuesRead = "ValuesRead"
    case valuesUpdate = "ValuesUpdate"
    case workflowManage = "WorkflowManage"
    case workflowRead = "WorkflowRead"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
        }
    
    public var hashValue: Int {
        return 0
        }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
        }
}
