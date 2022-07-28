// Roman+ExpressibleByIntegerLiteral.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: ExpressibleByIntegerLiteral {
	public init(integerLiteral value: IntegerLiteralType) {
		let newValue: Self.Value = .init(value)
		
		self.init(value: newValue)
	}
}
