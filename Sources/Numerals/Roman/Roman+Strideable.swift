// Roman+Strideable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Strideable {
	public typealias Stride = Int
	
	public func advanced(by amount: Self.Stride) -> Self {
		let newValue: Self.Stride = .init(self.value) + amount
		return .init(integerLiteral: newValue)
	}
	
	public func distance(to other: Self) -> Self.Stride {
		let newValue: Self.Value = other.value - self.value
		return .init(newValue)
	}
}
