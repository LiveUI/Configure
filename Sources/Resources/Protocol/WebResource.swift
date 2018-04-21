//
//  WebResource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


public protocol WebResource: Resource {
    
    /// Web URL string of the resource
    var resourceUrl: String { get }
    
}


extension WebResource {
    
    /// Default implementation for alwaysOverride
    public var alwaysOverride: Bool {
        return false
    }
    
    /// Retrieve data for the resource
    public func data() throws -> Data {
        guard let url = URL(string: resourceUrl) else {
            throw ResourcesManager.Error.invalidUrl
        }
        do {
            // QUESTION: Do we need anything better if this will be only used once in a while?
            let data = try Data(contentsOf: url)
            return data
        } catch {
            throw ResourcesManager.Error.failedFetchingData(error)
        }
    }
    
}
