//
//  BasicGithubResource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


public struct BasicGithubResource: GithubResource {
    
    /// Name of the Github organization
    public let organization: String
    
    /// Github repository
    public let repository: String
    
    /// Git branch
    public let branch: String
    
    /// Path to the file (https://raw.githubusercontent.com/LiveUI/Boost/master/Tests/LinuxMain.swift it would be `Tests/LinuxMain.swift`)
    public let path: String
    
    /// Where the final file will be saved
    public let destinationPath: String
    
    
    /// Intializer
    public init(organization: String, repository: String, branch: String, path: String, destinationPath: String) {
        self.organization = organization
        self.repository = repository
        self.branch = branch
        self.path = path
        self.destinationPath = destinationPath
    }
    
}
