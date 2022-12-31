//
//  Standing.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 29/04/1444 AH.
//

import Foundation
import UIKit

struct Standing : Codable{
    var stage : String?
    var type : String?
    var group : String?
    var table : [Table]?
    
}
struct Standings : Codable{
    var standings : [Standing]?
}
