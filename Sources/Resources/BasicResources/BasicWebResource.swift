//
//  BasicWebResource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


public struct BasicWebResource: WebResource {
    
    /// Web URL string of the resource
    public let resourceUrl: String
    
    /// Where the final file will be saved
    public let destinationPath: String
    
    
    /// Intializer
    public init(resourceUrl: String, destinationPath: String) {
        self.resourceUrl = resourceUrl
        self.destinationPath = destinationPath
    }
    
}
