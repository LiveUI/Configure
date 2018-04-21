//
//  GithubResource.swift
//  InstantResources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


public protocol GithubResource: WebResource {
    
    /// Name of the Github organization
    var organization: String { get }
    
    /// Github repository
    var repository: String { get }
    
    /// Git branch
    var branch: String { get }
    
    /// Path to the file (https://raw.githubusercontent.com/LiveUI/Boost/master/Tests/LinuxMain.swift it would be `Tests/LinuxMain.swift`)
    var path: String { get }
    
    var destinationPath: String { get }
    
}


extension GithubResource {
    
    /// Automatically computed resource url string
    public var resourceUrl: String {
        return "https://raw.githubusercontent.com/\(organization.trailingSlash)\(repository.trailingSlash)\(branch.trailingSlash)\(path)"
    }
    
}
