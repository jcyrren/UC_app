//
//  MainDataViewController.swift
//  UC_CoreData_Test
//
//  Created by Katie Collins on 1/30/17.
//  Copyright © 2017 CollinsInnovation. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class MainDataViewController: UIViewController {
    
    @IBOutlet var greeting: UILabel!
    @IBOutlet var activityLevel: UISegmentedControl!
    @IBOutlet var nocturnal: UISegmentedControl!
    @IBOutlet var numStools: UISegmentedControl!
    @IBOutlet var rectBleeding: UISegmentedControl!
    @IBOutlet var stoolConstistency: UISegmentedControl!
    @IBOutlet var abdPain: UISegmentedControl!
    
    //var triggers: Triggers!
    
    let triggerNames: [String] = ["Milk", "Math Test", "Gluten", "Track Race", "Pizza", "Coffee"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let adjectives = ["Hello! Nice to see you!", "How are you doing this on this fine day?", "Eyy 'sup?", "I'm glad you're back."]
        let idx = arc4random_uniform(UInt32(adjectives.count))
        greeting.text = adjectives[Int(idx)]
        
        [[UILabel appearance] setSubstituteFontName:@"Aileron-Light"];
        
        for family: String in UIFont.familyNames
        {
            print("\(family)")
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "continueEntry" {
            let todaysTriggersCntrl = segue.destination as! TodaysTriggersController
            todaysTriggersCntrl.abdPain = abdPain.selectedSegmentIndex
            todaysTriggersCntrl.stoolConsistency = stoolConstistency.selectedSegmentIndex
            todaysTriggersCntrl.numStools = numStools.selectedSegmentIndex
            todaysTriggersCntrl.nocturnal = nocturnal.selectedSegmentIndex
            todaysTriggersCntrl.activityLevel = activityLevel.selectedSegmentIndex
            todaysTriggersCntrl.rectBleeding = rectBleeding.selectedSegmentIndex
            //todaysTriggersCntrl.triggers = triggers
        }
    }
    
}
