//
//  ConfigurationManager.swift
//  TestKVO
//
//  Created by Hung Chang Lo on 12/04/2017.
//  Copyright © 2017 hungclo. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {

    // MARK: - Properties
    
    var configuration: Configuration
    
    // MARK: -
    
    lazy private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()
    
    // MARK: -
    
    var createAt: String {
        return dateFormatter.string(from: configuration.createAt)
    }
    
    var updateAt: String {
        return dateFormatter.string(from: configuration.updateAt)
    }
    
    // MARK: - Initialization
    
    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration
        
        super.init()
    }
    
    @objc func updateConfiguration() {
        configuration.updateAt = Date()
    }
}
