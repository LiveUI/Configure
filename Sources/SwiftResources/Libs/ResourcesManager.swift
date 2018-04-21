//
//  ResourcesManager.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


class ResourcesManager {
    
    /// Resources errors
    public enum Error: Swift.Error {
        case resourceValidationFailed
        case invalidUrl
        case failedFetchingData(Swift.Error?)
        case failedDataConversion
    }
    
    /// Default instance of ResourceManager
    public static let `default` = ResourcesManager()
    
    /// Holds reference to all available resources
    public internal(set) var resources: [Resource] = []
    
    /// Add resource to the manager
    public func add(_ resource: Resource) throws {
        guard resource.validate() else {
            throw Error.resourceValidationFailed
        }
        resources.append(resource)
    }
    
    /// Run install
    public func run() throws {
        for resource in resources {
            if resource.alwaysOverride || !self.resource(exists: resource) {
                Debug.log(message: "Installing \(resource.destinationPath)")
                let data = try resource.data()
                let url = URL(fileURLWithPath: resource.destinationPath)
                try data.write(to: url)
                Debug.log(message: "Finished \(resource.destinationPath)\n")
            } else {
                Debug.log(message: "Skipping \(resource.destinationPath)")
            }
        }
    }
    
    // MARK: Private interface
    
    private func resource(exists resource: Resource) -> Bool {
        return FileManager.default.fileExists(atPath: resource.destinationPath)
    }
    
}
