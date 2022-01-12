//
//  Created by ApodiniMigrator on 12.01.22
//  Copyright © 2022 TUM LS1. All rights reserved.
//

import XCTest
@testable import ApodiniMigratorExampleClient
@testable import ApodiniMigratorClientSupport

final class ApodiniMigratorExampleClientTests: XCTestCase {
    func testCategoryStatus() throws {
        let json: JSONValue =
        """
        "available"
        """
        
        let instance = XCTAssertNoThrowWithResult(try CategoryStatus.instance(from: json))
        XCTAssertNoThrow(try CategoryStatus.encoder.encode(instance))
    }
    
    func testEmpty() throws {
        let json: JSONValue =
        """
        {
        
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try Empty.instance(from: json))
        XCTAssertNoThrow(try Empty.encoder.encode(instance))
    }
    
    func testEvent() throws {
        let json: JSONValue =
        """
        {
        "category" : {
        "group" : "marketing",
        "id" : "8FBC4917-201C-40AC-8993-0F5F57599146",
        "status" : "available",
        "title" : ""
        },
        "date" : 663678000,
        "duration" : 0,
        "id" : "EE94FD89-A076-4EC9-AF78-76A49C728FCD",
        "imagePath" : "https://github.com/Apodini/Apodini",
        "maxParticipants" : null,
        "organizer" : "0E775EF5-3A61-4665-A110-0A652BA48C51",
        "reviews" : [],
        "summary" : "",
        "tags" : [],
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try Event.instance(from: json))
        XCTAssertNoThrow(try Event.encoder.encode(instance))
    }
    
    func testEventCategory() throws {
        let json: JSONValue =
        """
        {
        "group" : "marketing",
        "id" : "EDA91E6B-3211-4264-875C-F8C634640332",
        "status" : "available",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try EventCategory.instance(from: json))
        XCTAssertNoThrow(try EventCategory.encoder.encode(instance))
    }
    
    func testEventCategoryGroup() throws {
        let json: JSONValue =
        """
        "marketing"
        """
        
        let instance = XCTAssertNoThrowWithResult(try EventCategoryGroup.instance(from: json))
        XCTAssertNoThrow(try EventCategoryGroup.encoder.encode(instance))
    }
    
    func testEventMediator() throws {
        let json: JSONValue =
        """
        {
        "date" : null,
        "duration" : null,
        "maxParticipants" : null
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try EventMediator.instance(from: json))
        XCTAssertNoThrow(try EventMediator.encoder.encode(instance))
    }
    
    func testExperience() throws {
        let json: JSONValue =
        """
        "beginner"
        """
        
        let instance = XCTAssertNoThrowWithResult(try Experience.instance(from: json))
        XCTAssertNoThrow(try Experience.encoder.encode(instance))
    }
    
    func testHomeFeed() throws {
        let json: JSONValue =
        """
        {
        "categories" : [],
        "events" : [],
        "greeting" : "",
        "id" : "B093216C-1480-44A9-919C-8014BEA25247",
        "searchBarText" : "",
        "subtitle" : "",
        "userID" : "7E575669-6D7F-49E5-BE77-D75CDB6ECE9B"
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeed.instance(from: json))
        XCTAssertNoThrow(try HomeFeed.encoder.encode(instance))
    }
    
    func testHomeFeedCategory() throws {
        let json: JSONValue =
        """
        {
        "categoryID" : "2370339A-1B62-411C-BD5B-FD1878D0D84D",
        "eventsCount" : 0,
        "imageURL" : "https://github.com/Apodini/Apodini",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeedCategory.instance(from: json))
        XCTAssertNoThrow(try HomeFeedCategory.encoder.encode(instance))
    }
    
    func testHomeFeedEvent() throws {
        let json: JSONValue =
        """
        {
        "eventID" : "3EE7D805-1CC5-4BB4-B953-BF0647622D26",
        "eventsCount" : 0,
        "imageURL" : "https://github.com/Apodini/Apodini",
        "subtitle" : "",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try HomeFeedEvent.instance(from: json))
        XCTAssertNoThrow(try HomeFeedEvent.encoder.encode(instance))
    }
    
    func testRating() throws {
        let json: JSONValue =
        """
        "outstanding"
        """
        
        let instance = XCTAssertNoThrowWithResult(try Rating.instance(from: json))
        XCTAssertNoThrow(try Rating.encoder.encode(instance))
    }
    
    func testReview() throws {
        let json: JSONValue =
        """
        {
        "content" : "",
        "eventID" : "6401B0B3-D6B6-4D0B-9F47-719144B2924A",
        "id" : "14FB4B5F-79DD-46E6-B183-40D22000159F",
        "rating" : "outstanding",
        "reviewerID" : "99EDE485-5F0C-4093-943F-0F5EBB8952A3",
        "summary" : "",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try Review.instance(from: json))
        XCTAssertNoThrow(try Review.encoder.encode(instance))
    }
    
    func testReviewForm() throws {
        let json: JSONValue =
        """
        {
        "content" : "",
        "rating" : "outstanding",
        "summary" : "",
        "title" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try ReviewForm.instance(from: json))
        XCTAssertNoThrow(try ReviewForm.encoder.encode(instance))
    }
    
    func testUser() throws {
        let json: JSONValue =
        """
        {
        "birthday" : 663678000,
        "email" : "",
        "eventsOfInterest" : [],
        "experience" : "beginner",
        "homeFeed" : null,
        "id" : "6081B0FB-00DD-4143-9DD2-696904992428",
        "name" : "",
        "ownEvents" : [],
        "participatingEvents" : [],
        "password" : "",
        "reviews" : [],
        "subscribedToNewsLetter" : false,
        "surname" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try User.instance(from: json))
        XCTAssertNoThrow(try User.encoder.encode(instance))
    }
    
    func testUserLogin() throws {
        let json: JSONValue =
        """
        {
        "password" : "",
        "userName" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try UserLogin.instance(from: json))
        XCTAssertNoThrow(try UserLogin.encoder.encode(instance))
    }
    
    func testUserRegisterForm() throws {
        let json: JSONValue =
        """
        {
        "birthday" : 663678000,
        "email" : "",
        "name" : "",
        "password" : "",
        "subscribedToNewsLetter" : false,
        "surname" : ""
        }
        """
        
        let instance = XCTAssertNoThrowWithResult(try UserRegisterForm.instance(from: json))
        XCTAssertNoThrow(try UserRegisterForm.encoder.encode(instance))
    }
    
    func XCTAssertNoThrowWithResult<T>(_ expression: @autoclosure () throws -> T) -> T {
        XCTAssertNoThrow(try expression())
        do {
            return try expression()
        } catch {
            preconditionFailure("Expression threw an error: \(error.localizedDescription)")
        }
    }
}
