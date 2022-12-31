//
//  Season.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 01/05/1444 AH.
//

import Foundation
import UIKit

struct Season : Decodable{
    var id : Int?
    var startDate : String?
    var endDate : String?
    var currentMatchday : Int?
    var winner : Int?
}
