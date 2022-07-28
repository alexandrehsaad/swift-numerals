// Roman+Numeric.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Numeric {
	public typealias Magnitude = Self
	
	public init?<Source>(exactly source: Source)
	where Source: BinaryInteger {
		guard let value: Self.Value = .init(exactly: source),
				0...3999 ~= value else {
			return nil
		}
		
		self.init(value: value)
	}
}
