//
//  String+Resource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


extension String {
    
    /// Converts string into a basic string resource
    public func asResource(destination: String) -> StringResource {
        let resource = BasicStringResource(resource: self, destinationPath: destination)
        return resource
    }
    
}


extension Array where Element == String {
    
    /// Convert array of strings into resources with mapping closure returning desired destination paths
    public func asResources(_ mapping: ((_ resource: String) -> String)) -> [StringResource] {
        var resources: [StringResource] = []
        for string in self {
            let resource = string.asResource(destination: mapping(string))
            resources.append(resource)
        }
        return resources
    }
    
}
