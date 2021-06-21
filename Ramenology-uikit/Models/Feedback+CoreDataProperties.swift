//
//  Feedback+CoreDataProperties.swift
//  Ramenology-uikit
//
//  Created by Mughie Arief Mughoni on 21/06/21.
//
//

import Foundation
import CoreData


extension Feedback {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Feedback> {
        return NSFetchRequest<Feedback>(entityName: "Feedback")
    }

    @NSManaged public var created_at: Date?
    @NSManaged public var feedback_category_type: String?
    @NSManaged public var feedback_name: String?
    @NSManaged public var feedback_details: FeedbackDetail?
    @NSManaged public var recipe: Recipe?

}

extension Feedback : Identifiable {

}
