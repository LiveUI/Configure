//
//  URL+Resource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


extension URL {
    
    /// Converts URL into a basic web resource
    public func asResource(destination: String) -> WebResource {
        let resource = BasicWebResource(resourceUrl: absoluteString, destinationPath: destination)
        return resource
    }
    
}



extension Array where Element == URL {
    
    /// Convert array of URL's into web resources with mapping closure returning desired destination paths
    public func asResources(_ mapping: ((_ resource: String) -> String)) -> [WebResource] {
        var resources: [WebResource] = []
        for url in self {
            let resource = url.asResource(destination: mapping(url.absoluteString))
            resources.append(resource)
        }
        return resources
    }
    
}
