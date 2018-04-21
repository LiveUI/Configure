//
//  BasicStringResource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


public struct BasicStringResource: StringResource {
    
    /// String representation of the resource
    public let resource: String
    
    /// Where the final file will be saved
    public let destinationPath: String
    
    
    /// Intializer
    public init(resource: String, destinationPath: String) {
        self.resource = resource
        self.destinationPath = destinationPath
    }
    
}
