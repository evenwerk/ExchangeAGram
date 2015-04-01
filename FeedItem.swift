//
//  FeedItem.swift
//  ExchangeAGram
//
//  Created by Tim Even on 28-03-15.
//  Copyright (c) 2015 evenwerk. All rights reserved.
//

import Foundation
import CoreData

@objc(FeedItem)

class FeedItem: NSManagedObject {

    @NSManaged var caption: String
    @NSManaged var image: NSData
    @NSManaged var thumbNail: NSData

}
