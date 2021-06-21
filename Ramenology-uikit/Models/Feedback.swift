//
//  Feedback.swift
//  Ramenology-uikit
//
//  Created by Aldo Febrian on 19/06/21.
//

import UIKit

class Feedback {
    var id: Int
    var name: String
    var tag: tag_enum
    var created: String
    var feedbackDetail: [FeedbackDetail]
    
    init(id: Int, name: String, tag: tag_enum, created: String, feedbackDetail: [FeedbackDetail]) {
        self.id = id
        self.name = name
        self.tag = tag
        self.created = created
        self.feedbackDetail = feedbackDetail
    }
}

class FeedbackDetail {
    var id: Int
    var title: String
    var rating: Int
    var description: String
    var level: String
    
    init(id: Int, title: String, rating: Int, description: String, level: String) {
        self.id = id
        self.title = title
        self.rating = (rating > 5 ? 5 : (rating < 1 ? 1 : rating))
        self.description = description
        self.level = level
    }
}
