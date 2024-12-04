//
//  OAuthTokenResponseBody.swift
//  InstaType_PetProject
//
//  Created by Марат Хасанов on 25.07.2024.
//

import Foundation

struct BearerToken: Codable {
    let accessToken: String
    let tokenType: String
    let scope: String
    let createdAt: Int
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case scope
        case createdAt = "created_at"
    }
}

struct OAuthTokenResponseBody {
    func parseData(_ data: Data) -> BearerToken? {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(BearerToken.self, from: data)
            let accessToken = response.accessToken
            let tokenType = response.tokenType
            let scope = response.scope
            let createdAt = response.createdAt
            
            let bearerToken = BearerToken(accessToken: accessToken,
                                          tokenType: tokenType, 
                                          scope: scope,
                                          createdAt: createdAt)
            return bearerToken
        } catch {
            return nil
        }
    }
}
