//
//  DataObject.swift
//  Flapjack
//
//  Created by Ben Kreeger on 11/4/17.
//  Copyright © 2017 O'Reilly Media, Inc. All rights reserved.
//

import Foundation
import CoreData

// Sadly we have to bring in Core Data and define `NSFetchRequestResult` as a super-protocol.
//   Fortunately it adds no methods and is just a typedef for NSObjectProtocol, but hey.
public protocol DataObject: NSFetchRequestResult {
    associatedtype PrimaryKeyType: PrimaryKey

    static var representedName: String { get }
    static var primaryKeyPath: String { get }
    static var defaultSorters: [SortDescriptor] { get }
    var primaryKey: PrimaryKeyType? { get }
    var context: DataContext? { get }
}
