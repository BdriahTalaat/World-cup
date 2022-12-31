//
//  Score.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 02/05/1444 AH.
//

import Foundation
import UIKit

struct Score : Decodable{
    var winner : String?
    var duration : String?
    var fullTime : FullTime?
    var halfTime : FullTime?
}
