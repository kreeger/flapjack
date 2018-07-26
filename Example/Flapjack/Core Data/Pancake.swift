//
//  Pancake.swift
//  FlapjackExample
//
//  Created by Ben Kreeger on 7/19/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
//

import Foundation
import CoreData
import Flapjack

@objc(Pancake)
public class Pancake: NSManagedObject {
    @NSManaged private(set) public var identifier: String
    @NSManaged public var flavor: String?
    @NSManaged public var radius: Double
    @NSManaged public var height: Double
    @NSManaged private(set) public var toppings: [String]
    @NSManaged private(set) public var createdAt: Date
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        setPrimitiveValue(UUID().uuidString, forKey: #keyPath(identifier))
        setPrimitiveValue(Date(), forKey: #keyPath(createdAt))
        setPrimitiveValue([String](), forKey: #keyPath(toppings))
    }
    
    func addTopping(_ topping: String) {
        var mToppings = toppings
        mToppings.append(topping)
        toppings = mToppings
    }
}


extension Pancake: DataObject {
    public static var representedName: String { return "Pancake" }
    public static var primaryKeyPath: String { return #keyPath(identifier) }
    public static var defaultSorters: [SortDescriptor] {
        return [
            SortDescriptor(#keyPath(flavor), ascending: true, caseInsensitive: true),
            SortDescriptor(#keyPath(radius), ascending: false),
            SortDescriptor(#keyPath(height), ascending: false)
        ]
    }
}
