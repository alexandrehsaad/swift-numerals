// Roman+Decodable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Decodable {
	public init(from decoder: Decoder) throws {
		let container: SingleValueDecodingContainer = try decoder.singleValueContainer()
		let value: Self.Value = try container.decode(Self.Value.self)
		
		self = .init(value: value)
	}
}
