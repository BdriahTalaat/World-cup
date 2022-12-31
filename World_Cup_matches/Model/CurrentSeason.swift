//
//  CurrentSeason.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 30/04/1444 AH.
//

import Foundation
import UIKit

class CurrentSeason:Decodable{
    var id : Int?
    var startDate : String?
    var endDate : String?
    var currentMatchday : Int?
    var winner : Int?
}
