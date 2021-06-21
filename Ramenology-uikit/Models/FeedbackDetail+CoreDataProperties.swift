//
//  FeedbackDetail+CoreDataProperties.swift
//  Ramenology-uikit
//
//  Created by Mughie Arief Mughoni on 21/06/21.
//
//

import Foundation
import CoreData


extension FeedbackDetail {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FeedbackDetail> {
        return NSFetchRequest<FeedbackDetail>(entityName: "FeedbackDetail")
    }

    @NSManaged public var feedback_detail_description: String?
    @NSManaged public var feedback_detail_name: String?
    @NSManaged public var feedback_detail_rating: String?
    @NSManaged public var feedback: Feedback?

}

extension FeedbackDetail : Identifiable {

}
