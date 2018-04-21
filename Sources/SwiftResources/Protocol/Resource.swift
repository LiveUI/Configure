//
//  Resource.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


/// Basic resource protocol
public protocol Resource {
    
    /// Where is the file supposed to be saved, including filename
    var destinationPath: String { get }
    
    /// Override the file every time the manager runs (default on system resources is false)
    var alwaysOverride: Bool { get }
    
    /// Return resources converted data 
    func data() throws -> Data
    
}


extension Resource {
    
    /// Optional validation method for any resource
    public func validate() -> Bool {
        return true
    }
    
}
