//
//  String+Tools.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


extension String {
    
    /// Adds a trailing slash to string (to a path component)
    var trailingSlash: String {
        if !hasSuffix("/") {
            return appending("/")
        }
        return self
    }
    
}
