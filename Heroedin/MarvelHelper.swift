//
//  MarvelHelper.swift
//  Heroedin
//
//  Created by teo on 10/03/2017.
//  Copyright © 2017 teo. All rights reserved.
//

import CryptoSwift
import Alamofire
import SwiftyJSON

final class MarvelHelper: NSObject {
    static let sharedInstance: MarvelHelper = MarvelHelper()
    
    func getHash(ts: NSInteger) -> String{
        let apikey = "238e13bf87bfe57f205193cfec7c43a7"
        let secret = "28e8b7f1984a11d3b943a137691ecb6ee807a018"
        
        if ts == 0 {
            return ""
        }
        
        let prehash = String(format: "%d%@%@", ts,secret, apikey)
        let hash = prehash.md5()
        return hash
    }
    
    func getUrlForApi(api: String) -> String {
        let ts = NSInteger( Date().timeIntervalSince1970 )
        let apikey = "238e13bf87bfe57f205193cfec7c43a7"
        
        let hash = self.getHash(ts: ts)
        
        let url = "http://gateway.marvel.com" + api + "ts=\(ts)&apikey=" + apikey + "&hash=" + hash
        return url
    }
    
    func getCarachters(offset: NSInteger, handler: @escaping (DataResponse<Any>) -> Void ){
        
        let apirequest = String(format:"/v1/public/characters?offset=%d&",offset)
        
        let url = self.getUrlForApi(api:apirequest)
    
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
        .responseJSON(completionHandler: handler)
    }
}
