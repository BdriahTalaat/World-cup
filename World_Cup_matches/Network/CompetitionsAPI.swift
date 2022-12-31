//
//  competitionsAPI.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 30/04/1444 AH.
//

import Foundation
import SwiftyJSON
import Alamofire

class CompetitionAPI : API{
   
    //MARK: GET ALL COMPETITION
    static func getAllCompetition(completionHandler : @escaping([Comptition])->()){
        
        let URLCometition = "\(baseURL)competitions/"
        
        AF.request(URLCometition,headers: headers).responseJSON { response in
            
            let jsonData = JSON(response.value)
            let data = jsonData["competitions"]
            let decoder = JSONDecoder()
            
            do{
                let competition = try decoder.decode([Comptition].self, from: data.rawData())
                completionHandler(competition)
                
            }catch let error{
                print(error)
            }
        }
    }
    
    //MARK: TEAMS
    static func getAllTeam(id:Int,completionHandler : @escaping([Teams])->()){
        
        let URLCometition = "\(baseURL)competitions/\(id)/teams"
        
        AF.request(URLCometition,headers: headers).responseJSON { response in
            
            let jsonData = JSON(response.value)
            let data = jsonData["teams"]
            let decoder = JSONDecoder()
            
            do{
                let teams = try decoder.decode([Teams].self, from: data.rawData())
                completionHandler(teams)
                
            }catch let error{
                print(error)
            }
        }
    }
}
