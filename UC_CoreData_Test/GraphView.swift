//
//  GraphView.swift
//  UC_CoreData_Test
//
//  Created by Katie Collins on 2/23/17.
//  Copyright © 2017 CollinsInnovation. All rights reserved.
//

import Foundation
import UIKit

class GraphView: UIView {
    var vals : [Int] = [ 0, 80, 40, 50, 60, 55, 55, 67, 85]
    var number : Int = 9
    
    override func draw(_ rect: CGRect){
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        let p1 = UIBezierPath()
        p1.move(to: CGPoint(x: width/(number + 1), y: pointer(vals: vals, height: height, number : number)[0]))
        var w : Int = 0
        for p in pointer(vals: vals, height: height, number : number) {
            w += 1
            p1.addLine(to: CGPoint(x: w * width/(number + 1), y: p))
            p1.move(to: CGPoint(x: w * width/(number + 1), y: p))
        }
        
        p1.lineWidth = 5
        p1.stroke()
        
        
    }
    
    func pointer(vals: [Int], height : Int, number: Int) -> [Int]{
        
        var modvals : [Int] = []
        for n in 1...number {
            
            modvals.insert(vals[vals.count - n], at: 0)
        }
        var finalvals : [Int] = []
        
        for m in modvals {
            finalvals.append(height - (m * (height/85)))
        }
        
        return finalvals
    }
}
