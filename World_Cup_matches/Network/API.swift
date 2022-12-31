//
//  API.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 29/04/1444 AH.
//

import Foundation
import Alamofire

class API{
    static let appId = "e7c9801e76c74f3ca89eb4916b487673"
    static let baseURL = "https://api.football-data.org/v4/"
    static let headers : HTTPHeaders = ["x-Auth-Token":appId]
}
