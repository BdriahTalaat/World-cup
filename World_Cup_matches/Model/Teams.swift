//
//  Teams.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 08/05/1444 AH.
//

import Foundation
import UIKit

struct Teams : Decodable{
    var area : Area?
    var id : Int?
    var name : String?
    var shortName : String?
    var tla : String?
    var crest : String?
    var address : String?
    var website : String?
    var founded : Int?
    var clubColors : String?
    var venue : String?
    var runningCompetition : [RunningCompetition]?
    var coach : Coach?
    var squad : [Squad]?
    
}
