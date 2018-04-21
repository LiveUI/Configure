//
//  Debug.swift
//  Resources
//
//  Created by Ondrej Rafaj on 21/04/2018.
//

import Foundation


class Debug {
    
    static func log(message: String) {
        print("[Resources]: \(message)")
    }
    
    static func log(error: Error) {
        print("[Resources Error]: \(error.localizedDescription)")
    }
    
}
