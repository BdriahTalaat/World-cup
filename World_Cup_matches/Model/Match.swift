//
//  Match.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 01/05/1444 AH.
//

import Foundation
import UIKit

struct Match : Decodable{
    var area : Area?
    var competition : Comptition?
    var season : Season?
    var id : Int?
    var utcDate :String?
    var status : String?
    var matchday : Int?
    var stage : String?
    var group : String?
    var lastUpdated : String?
    var homeTeam : HomeTeam
    var awayTeam : HomeTeam
    var score : Score?
}
