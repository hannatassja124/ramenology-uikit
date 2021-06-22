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
    @NSManaged public var feedback_details: NSSet?
    @NSManaged public var recipe: Recipe?

}

// MARK: Generated accessors for feedback_details
extension Feedback {

    @objc(addFeedback_detailsObject:)
    @NSManaged public func addToFeedback_details(_ value: FeedbackDetail)

    @objc(removeFeedback_detailsObject:)
    @NSManaged public func removeFromFeedback_details(_ value: FeedbackDetail)

    @objc(addFeedback_details:)
    @NSManaged public func addToFeedback_details(_ values: NSSet)

    @objc(removeFeedback_details:)
    @NSManaged public func removeFromFeedback_details(_ values: NSSet)

}

extension Feedback : Identifiable {

}
