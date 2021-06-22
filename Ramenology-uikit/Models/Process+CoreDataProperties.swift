//
//  Process+CoreDataProperties.swift
//  Ramenology-uikit
//
//  Created by Mughie Arief Mughoni on 21/06/21.
//
//

import Foundation
import CoreData


extension Process {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Process> {
        return NSFetchRequest<Process>(entityName: "Process")
    }

    @NSManaged public var process_description: String?
    @NSManaged public var process_order: Int32
    @NSManaged public var recipe: Recipe?

}

extension Process : Identifiable {

}
