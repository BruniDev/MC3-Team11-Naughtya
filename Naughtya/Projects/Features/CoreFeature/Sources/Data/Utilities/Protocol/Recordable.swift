//
//  Recordable.swift
//  CoreFeature
//
//  Created by byo on 2023/07/25.
//  Copyright © 2023 Naughtya. All rights reserved.
//

import Foundation
import CloudKit

public protocol Recordable {
    static var recordType: CloudKitRecordType { get }

    var id: CKRecord.ID? { get }
    var dictionary: [String: Any?] { get }

    static func build(ckRecord: CKRecord) -> Self
}
