//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Jamie on 2018/5/27.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    // MARK: Meal class test
    
    // confirm that the Meal initialization return a Meal object when passed valid parameters
    func testMealInitializationSucceeded() {
        // zero rating
        let zeroRatingMeal = Meal(name: "zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // highest positive rating
        let positiveRatingMeal = Meal(name: "positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // confirm that the Meal initialier returns nil when passed a negative rating or an empty name
    func testMealInitializationFails() {
        // negative rating
        let negativeMealRating = Meal(name: "negative rating", photo: nil, rating: -1)
        XCTAssertNil(negativeMealRating)
        
        // rating exceeds maximum
        let largeRatingMeal = Meal(name: "large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        // empty string
        let emptyStringMeal = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
    
    }
    
}
