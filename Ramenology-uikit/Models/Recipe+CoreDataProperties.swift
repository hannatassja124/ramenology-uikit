//
//  Recipe+CoreDataProperties.swift
//  Ramenology-uikit
//
//  Created by Mughie Arief Mughoni on 21/06/21.
//
//

import Foundation
import CoreData


extension Recipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

    @NSManaged public var category: String?
    @NSManaged public var created_at: Date?
    @NSManaged public var recipe_cooking_time: Int32
    @NSManaged public var recipe_name: String?
    @NSManaged public var recipe_picture: Data?
    @NSManaged public var recipe_source_url: String?
    @NSManaged public var recipe_total_serving: Int32
    @NSManaged public var feedbacks: NSSet?
    @NSManaged public var ingredients: NSSet?
    @NSManaged public var processes: NSSet?

}

// MARK: Generated accessors for feedbacks
extension Recipe {

    @objc(addFeedbacksObject:)
    @NSManaged public func addToFeedbacks(_ value: Feedback)

    @objc(removeFeedbacksObject:)
    @NSManaged public func removeFromFeedbacks(_ value: Feedback)

    @objc(addFeedbacks:)
    @NSManaged public func addToFeedbacks(_ values: NSSet)

    @objc(removeFeedbacks:)
    @NSManaged public func removeFromFeedbacks(_ values: NSSet)

}

// MARK: Generated accessors for ingredients
extension Recipe {

    @objc(addIngredientsObject:)
    @NSManaged public func addToIngredients(_ value: Ingredient)

    @objc(removeIngredientsObject:)
    @NSManaged public func removeFromIngredients(_ value: Ingredient)

    @objc(addIngredients:)
    @NSManaged public func addToIngredients(_ values: NSSet)

    @objc(removeIngredients:)
    @NSManaged public func removeFromIngredients(_ values: NSSet)

}

// MARK: Generated accessors for processes
extension Recipe {

    @objc(addProcessesObject:)
    @NSManaged public func addToProcesses(_ value: Process)

    @objc(removeProcessesObject:)
    @NSManaged public func removeFromProcesses(_ value: Process)

    @objc(addProcesses:)
    @NSManaged public func addToProcesses(_ values: NSSet)

    @objc(removeProcesses:)
    @NSManaged public func removeFromProcesses(_ values: NSSet)

}

extension Recipe : Identifiable {

}
