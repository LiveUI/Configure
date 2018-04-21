//
//  StringResource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


public protocol StringResource: Resource {
    
    /// String representation of the resource
    var resource: String { get }
    
}


extension StringResource {
    
    /// Default implementation for alwaysOverride
    public var alwaysOverride: Bool {
        return false
    }
    
    /// Default encoding
    public var encoding: String.Encoding {
        return .utf8
    }
    
    /// Retrieve data for the resource
    public func data() throws -> Data {
        guard let data = resource.data(using: encoding) else {
            throw ResourcesManager.Error.failedDataConversion
        }
        return data
    }
    
}
