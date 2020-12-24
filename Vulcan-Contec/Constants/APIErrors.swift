//
//  APIErrors.swift
//  Vulcan-Contec
//
//  Created by Prabu on 20/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import Foundation

enum APIErrors: Error{
    case custom(message: String)
}

typealias Handler = (Swift.Result<Any?, APIErrors>) -> Void
