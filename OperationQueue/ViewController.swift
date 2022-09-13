//
//  ViewController.swift
//  OperationQueue
//
//  Created by Kim Nghĩa on 13/09/2022.
//
import Foundation
import UIKit

class ViewController: UIViewController {

    let imageUrl1: String = "https://api.opendota.com/apps/dota2/images/dota_react/heroes/antimage.png?"
    let imageUrl2: String = "https://api.opendota.com/apps/dota2/images/dota_react/heroes/axe.png?"
    let imageUrl3: String = "https://api.opendota.com/apps/dota2/images/dota_react/heroes/bane.png?"
    let imageUrl4: String = "https://api.opendota.com/apps/dota2/images/dota_react/heroes/bloodseeker.png?"
    
    let queue = OperationQueue()
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func download(_ sender: Any) {
        
        queue.isSuspended = false
        queue.maxConcurrentOperationCount = 1
        
        let operation1 = BlockOperation(block: { [self] in
            img1.downloaded(from: imageUrl1)
        })

        operation1.completionBlock = {
            print("Operation 1 completed")
        }

        let operation2 = BlockOperation(block: { [self] in
            img2.downloaded(from: imageUrl2)
        })

        operation2.completionBlock = {
            print("Operation 2 completed")
        }

        let operation3 = BlockOperation(block: { [self] in
            img3.downloaded(from: imageUrl3)
        })

        operation3.completionBlock = {
            print("Operation 3 completed")
        }

        let operation4 = BlockOperation(block: { [self] in
            img4.downloaded(from: imageUrl4)
        })

        operation4.completionBlock = {
            print("Operation 4 completed")
        }
        
        operation3.addDependency(operation2)
        operation4.addDependency(operation3)
        operation1.addDependency(operation4)
        
        queue.addOperations([operation1, operation2, operation3, operation4], waitUntilFinished: false)
    }
    

    
    @IBAction func cancel(_ sender: Any) {
        queue.isSuspended = true
        
    }
}

