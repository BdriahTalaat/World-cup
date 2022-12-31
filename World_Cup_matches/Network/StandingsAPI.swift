//
//  Standings API.swift
//  World_Cup_matches
//
//  Created by Bdriah Talaat on 29/04/1444 AH.
//

import Foundation
import SwiftyJSON
import Alamofire

class StandingsAPI : API{
    
    //MARK: GET ALL STANDING
    static func getAllStandings (id:Int,completionHandler : @escaping([Standing])->()){
        
        let URLStandings = "\(baseURL)competitions/2000/standings"
       
        AF.request(URLStandings,headers: headers).responseJSON { response in
          
            if response.data != nil{

                do{
                    let standings = try JSONDecoder().decode(Standings.self, from: response.data!)
                    print(standings.standings?.first?.table?.first?.team?.name)
                    
                    completionHandler(standings.standings!)
                }catch let error{
                    print(error)
                }
            }

        }
    }
    
    //MARK: GET ALL MATCH
    static func getAllMatch(id:Int,completionHandler : @escaping([Match])->()){
        
        let URLCometition = "\(baseURL)competitions/\(id)/matches"
        
        AF.request(URLCometition,headers: headers).responseJSON { response in
            
            let jsonData = JSON(response.value)
            let data = jsonData["matches"]
            let decoder = JSONDecoder()
            
            do{
                let match = try decoder.decode([Match].self, from: data.rawData())
                completionHandler(match)
                
            }catch let error{
                print(error)
            }
        }
    }
}
