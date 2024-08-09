// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let responseElement = try ResponseElement(json)

import Foundation

// MARK: - ResponseElement
struct ResponseElement: Codable, Identifiable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: ResponseElement convenience initializers and mutators

extension ResponseElement {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ResponseElement.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int? = nil,
        name: String? = nil,
        username: String? = nil,
        email: String? = nil,
        address: Address? = nil,
        phone: String? = nil,
        website: String? = nil,
        company: Company? = nil
    ) -> ResponseElement {
        return ResponseElement(
            id: id ?? self.id,
            name: name ?? self.name,
            username: username ?? self.username,
            email: email ?? self.email,
            address: address ?? self.address,
            phone: phone ?? self.phone,
            website: website ?? self.website,
            company: company ?? self.company
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: Address convenience initializers and mutators

extension Address {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Address.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        street: String? = nil,
        suite: String? = nil,
        city: String? = nil,
        zipcode: String? = nil,
        geo: Geo? = nil
    ) -> Address {
        return Address(
            street: street ?? self.street,
            suite: suite ?? self.suite,
            city: city ?? self.city,
            zipcode: zipcode ?? self.zipcode,
            geo: geo ?? self.geo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: Geo convenience initializers and mutators

extension Geo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Geo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lat: String? = nil,
        lng: String? = nil
    ) -> Geo {
        return Geo(
            lat: lat ?? self.lat,
            lng: lng ?? self.lng
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}

// MARK: Company convenience initializers and mutators

extension Company {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Company.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        name: String? = nil,
        catchPhrase: String? = nil,
        bs: String? = nil
    ) -> Company {
        return Company(
            name: name ?? self.name,
            catchPhrase: catchPhrase ?? self.catchPhrase,
            bs: bs ?? self.bs
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
