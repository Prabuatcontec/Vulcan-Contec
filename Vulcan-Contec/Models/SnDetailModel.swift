//
//  SnDetailModel.swift
//  Vulcan-Contec
//
//  Created by Prabu on 24/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import Foundation

struct SnDetail: Codable {
    let handlingProfileLoaded: Bool
    let handlingProfile, pendingParts, awapParts, installedParts: JSONNull?
    let itemAttributes: [ItemAttribute]
    let messages: [JSONAny]
    let repairOptions: [RepairOption]
    let timeInRepairDetails: [TimeInRepairDetail]
    let trackingID: Int
    let serialNumber: String
    let customerID, orderID, oemid: Int
    let oem: String
    let oemDataSourceID: Int
    let oemFamily: String
    let oemWarranty, oemWarrantyExpiration: JSONNull?
    let oemModel: String
    let oemccWarrantyExpiration, oemccModel: JSONNull?
    let odmid: Int
    let odm, itemID, productID, modelType: JSONNull?
    let modelTypeName: JSONNull?
    let vulcanModelName, cosmeticsStandard: String
    let isReceived, isRejectedUnit, isCompleteSeedLoading: Bool
    let rejectedDate, warranty: String
    let billingCode: JSONNull?
    let custSym: Int
    let hasBeenTested, testsOK: Bool
    let lastTestType: Int
    let lastTestDate: String
    let lastTestResult: JSONNull?
    let lastTestErrorCode: Int
    let lastTestMessage: JSONNull?
    let workflowID, workflowStepID, repairStatus: Int
    let repairStatusTxt, repairStatusChanged: String
    let repairStatusHistory: JSONNull?
    let repairTechID: String
    let siteID: Int
    let station, welcomeOperator: JSONNull?
    let repairStationID: Int
    let repairStation: JSONNull?
    let repairStationCode: String
    let unitHandlingProfileID: Int
    let market, biller, logisticsPartnerModel: JSONNull?
    let itemType, customerName: String
    let nonRepairable, customerResponsability, npf: Int
    let requestedProcessingAbbreviation: JSONNull?
    let testResultExists: Int
    let testResultResult: JSONNull?
    let testResultDate: String
    let replacedCCTestResultExists: Int
    let replacedCCTestResultResult: JSONNull?
    let replacedCCTestResultDate: String
    let pullToProduction, getCustomerComplaintFromPreload, getOEMWarrantyFromPreload, hasPendingParts: Bool
    let pendingPartsCount: Int
    let hasAWAPParts: Bool
    let awapPartsCount: Int
    let hasInstalledParts: Bool
    let installedPartsCount: Int
    let boxID, palletID, packingLocationID: JSONNull?
    let divisionID, warehouseID: Int
    let preReceiveDate, whseReceiveDate, repairReceiveDate: String
    let repairReceiveWeek: Int
    let repairFirstTouchDate, repairLastActivityDate, packedDate, shippedDate: String
    let recordCreateDate, invoiceDate: String
    let invoiceStatus: JSONNull?
    let unitLoaded: Bool
    let customFields: CustomFields
    let customDataXfer, itemAttributesXFer, unitAddress: String
    let source: JSONNull?
    let hddFailureCode, mCardFailureCode: String
    let isNVMReplaced, isTunerReplaced, isFlashReplaced, isBGAReplaced: Bool
    let dueDate: String
    let trips: Int
    let abbreviation, externalItemType: String
    let pendingActionsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case handlingProfileLoaded, handlingProfile, pendingParts, awapParts, installedParts, itemAttributes, messages, repairOptions, timeInRepairDetails, trackingID, serialNumber, customerID, orderID, oemid, oem, oemDataSourceID, oemFamily, oemWarranty, oemWarrantyExpiration, oemModel, oemccWarrantyExpiration, oemccModel, odmid, odm, itemID, productID, modelType, modelTypeName, vulcanModelName, cosmeticsStandard, isReceived, isRejectedUnit, isCompleteSeedLoading, rejectedDate, warranty, billingCode, custSym, hasBeenTested, testsOK, lastTestType, lastTestDate, lastTestResult, lastTestErrorCode, lastTestMessage, workflowID, workflowStepID, repairStatus, repairStatusTxt, repairStatusChanged, repairStatusHistory, repairTechID, siteID, station
        case welcomeOperator = "operator"
        case repairStationID, repairStation, repairStationCode, unitHandlingProfileID, market, biller, logisticsPartnerModel, itemType, customerName, nonRepairable, customerResponsability, npf, requestedProcessingAbbreviation, testResultExists, testResultResult, testResultDate, replacedCCTestResultExists, replacedCCTestResultResult, replacedCCTestResultDate, pullToProduction, getCustomerComplaintFromPreload, getOEMWarrantyFromPreload, hasPendingParts, pendingPartsCount, hasAWAPParts, awapPartsCount, hasInstalledParts, installedPartsCount, boxID, palletID, packingLocationID, divisionID, warehouseID, preReceiveDate, whseReceiveDate, repairReceiveDate, repairReceiveWeek, repairFirstTouchDate, repairLastActivityDate, packedDate, shippedDate, recordCreateDate, invoiceDate, invoiceStatus, unitLoaded, customFields, customDataXfer, itemAttributesXFer, unitAddress, source, hddFailureCode, mCardFailureCode, isNVMReplaced, isTunerReplaced, isFlashReplaced, isBGAReplaced, dueDate, trips, abbreviation, externalItemType, pendingActionsCount
        }
}


// MARK: - CustomFields
struct CustomFields: Codable {
    let doc: String
}

// MARK: - ItemAttribute
struct ItemAttribute: Codable {
    let id: Int
    let attributeCode, attributeName: String?
    let attributeValue: String
    let newAttributeValue: String?
    let isEnabled, isRequired, updateOnBGAChange: Bool
    let regexValidation, sfnFieldName: String?
    let captureAtReceiving: Bool
    let scanOrder: Int
    let addressType, itemID, customDataLocation: JSONNull?
    let keyTypeID, linkItemsToItemAttributesID: Int
}

// MARK: - RepairOption
struct RepairOption: Codable {
    let name, linkURL: String
    let rule: Rule
}

// MARK: - Rule
struct Rule: Codable {
    let memberName: MemberName?
    let ruleOperator: Operator
    let targetValue: String?
    let rules: [Rule]
    let inputs: [JSONAny]
    
    enum CodingKeys: String, CodingKey {
        case memberName
        case ruleOperator = "operator"
        case targetValue, rules, inputs
        }
}

enum MemberName: String, Codable {
    case repairStationCode = "RepairStationCode"
}

enum Operator: String, Codable {
    case equal = "Equal"
    case or = "Or"
}

// MARK: - TimeInRepairDetail
struct TimeInRepairDetail: Codable {
    let repairFirstTouchDate, repairLastActivityDate: String
    let timeInRepairDifferenceDays, timeInRepairDifferenceHours, timeInRepairDifferenceMin, timeInRepairDifferenceSeconds: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
        }
    
    public var hashValue: Int {
        return 0
        }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
            }
        }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
        }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
        }
    
    required init?(stringValue: String) {
        key = stringValue
        }
    
    var intValue: Int? {
        return nil
        }
    
    var stringValue: String {
        return key
        }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
        }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
        }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
            }
        if let value = try? container.decode(Int64.self) {
            return value
            }
        if let value = try? container.decode(Double.self) {
            return value
            }
        if let value = try? container.decode(String.self) {
            return value
            }
        if container.decodeNil() {
            return JSONNull()
            }
        throw decodingError(forCodingPath: container.codingPath)
        }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
            }
        if let value = try? container.decode(Int64.self) {
            return value
            }
        if let value = try? container.decode(Double.self) {
            return value
            }
        if let value = try? container.decode(String.self) {
            return value
            }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
                }
            }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
            }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
            }
        throw decodingError(forCodingPath: container.codingPath)
        }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
            }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
            }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
            }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
            }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
                }
            }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
            }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
            }
        throw decodingError(forCodingPath: container.codingPath)
        }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
            }
        return arr
        }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
            }
        return dict
        }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
                } else if let value = value as? Int64 {
                try container.encode(value)
                } else if let value = value as? Double {
                try container.encode(value)
                } else if let value = value as? String {
                try container.encode(value)
                } else if value is JSONNull {
                try container.encodeNil()
                } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
                } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
                } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
                } else if let value = value as? Double {
                try container.encode(value, forKey: key)
                } else if let value = value as? String {
                try container.encode(value, forKey: key)
                } else if value is JSONNull {
                try container.encodeNil(forKey: key)
                } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
                } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
                } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
                }
            }
        }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
            } else if let value = value as? Int64 {
            try container.encode(value)
            } else if let value = value as? Double {
            try container.encode(value)
            } else if let value = value as? String {
            try container.encode(value)
            } else if value is JSONNull {
            try container.encodeNil()
            } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
            } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
            } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
            }
        }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
            } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
            } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
            }
        }
}
