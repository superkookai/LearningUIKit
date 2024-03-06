//
//  Utils.swift
//  LearningUIKit
//
//  Created by Weerawut Chaiyasomboon on 6/3/2567 BE.
//

import Foundation

let apiKey = "da9bc8815fb0fc31d5ef6b3da097a009"

let jsonDecoder: JSONDecoder = {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return decoder
}()
