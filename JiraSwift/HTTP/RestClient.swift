//
//  RestClient.swift
//  JiraSwift
//
//  Created by Bill Gestrich on 10/29/17.
//  Copyright © 2017 Bill Gestrich. All rights reserved.
//

//import Cocoa

public class RestClient: NSObject {
    
    let baseURL: String
    var headers: [String:String]?
    var auth : BasicAuth?
    
    public init(baseURL: String){
        self.baseURL = baseURL
        super.init()
    }
    
    public convenience init(baseURL: String, auth: BasicAuth){
        self.init(baseURL: baseURL)
        self.auth = auth
    }
    
    func jsonDataFor(relativeURL: String, completion:@escaping ((Data) -> Void)){
        let urlString = baseURL.appending(relativeURL)
        jsonDataFor(fullURL:urlString, completion:completion)
    }
    
    func jsonDataFor(fullURL: String, completion:@escaping ((Data) -> Void)){
        var headersToSet = ["Content-Type":"application/json", "Accept":"application/json"]
        if let headers = self.headers {
            headersToSet += headers
        }
        let http = SimpleHttp(auth:self.auth, headers:headersToSet);
        let url = URL(string: fullURL)!
        http.getJSONData(url:url, completion:completion, errorBlock:{
            print("Error Occurred")
        })
    }
    
}
