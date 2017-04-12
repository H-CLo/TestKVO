//
//  ViewController.swift
//  TestKVO_Swift
//
//  Created by Hung Chang Lo on 12/04/2017.
//  Copyright © 2017 hungclo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let configurationManager = ConfigurationManager(withConfiguration: Configuration())
    
    @IBOutlet weak var lbl_Time: UILabel!
    @IBAction func btn_updateTime(_ sender: UIButton) {
        configurationManager.updateConfiguration()
        lbl_Time.text = configurationManager.updateAt
    }
    
    // MARK: - View Life Cycle
    /**
        Observer:
        The first parameter is the object that is added as an observer. This can only be an instance of a class that inherits from the NSObject root class. It is the NSObject root class that defines the addObserver(_:forKeyPath:options:context:) method as well as the method that is invoked when a change is detected.
     
        Key Path
        The key path defines what property the observer is interested in. In the example, the view controller is added as an observer for the updatedAt property of the Configuration instance of the configuration manager of the view controller.
     
        Context
        The context is a more advanced option you will rarely use. It allows you to pass additional data to the observer when a notification is sent.
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addObserver(self, forKeyPath: #keyPath(configurationManager.configuration.updateAt), options: [.old, .new], context: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        NSLog("Hello world 115468464")
        
        if keyPath == #keyPath(configurationManager.configuration.updateAt) {
            // update Time Label
            NSLog("Hello world")
            lbl_Time.text = configurationManager.updateAt
        }
    }

}

