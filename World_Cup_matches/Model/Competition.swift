//
//  Competition.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 30/04/1444 AH.
//

import Foundation
import UIKit

struct Comptition : Decodable{
    var id : Int?
    var area : Area?
    var name : String?
    var code : String?
    var type : String?
    var emblem : String?
    var plan : String?
    var currentSeason : CurrentSeason?
}
