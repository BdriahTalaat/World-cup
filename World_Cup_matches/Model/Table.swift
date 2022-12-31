//
//  Table.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 29/04/1444 AH.
//

import Foundation
import UIKit

struct Table : Codable{
    var position : Int?
    var team : Team?
    var playedGames : Int?
    var form : Int?
    var won : Int?
    var draw : Int?
    var lost : Int?
    var points : Int?
    var goalsFor : Int?
    var goalsAgainst : Int?
    var goalDifference : Int?
    
}
