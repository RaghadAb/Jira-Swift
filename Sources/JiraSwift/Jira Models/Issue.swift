//
//  Issue.swift
//  JiraSwift
//
//  Created by Bill Gestrich on 10/28/17.
//  Copyright © 2017 Bill Gestrich. All rights reserved.
//

import Foundation

public struct Issue : Codable {
    public var id: String = ""
    public var key: String = ""
    public var urlString: String = ""
    public var fields : Fields
    
    enum CodingKeys : String, CodingKey {
        case id
        case key
        case urlString = "self"
        case fields
    }
    
    public struct Fields : Codable {
        
        let epic: String?
        public var summary: String
        var fixVersions: [FixVersion]?
        public let assignee: Assignee?
        public var description : String?
        public var issueType : IssueType
        
        enum CodingKeys : String, CodingKey {
            case epic = "customfield_10017"
            case summary
            case fixVersions
            case assignee
            case description
            case issueType = "issuetype"
        }
    }
    
    public struct FixVersion : Codable {
        let description : String?
        let name : String
        enum CodingKeys : String, CodingKey {
            case description
            case name
        }
    }
    
    public struct IssueType : Codable {
        public var id: String = ""
        public var name: String = ""
        public var description: String = ""
        public var iconUrl : String
        
        enum CodingKeys : String, CodingKey {
            case id
            case name
            case description
            case iconUrl
        }
    }
}