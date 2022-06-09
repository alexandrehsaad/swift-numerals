// RomanSymbol+Comparable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension RomanSymbol: Comparable {
	/// Returns a boolean value indicating whether the value of the first argument is less than that of the second argument.
	///
	/// ```swift
	/// let zero: RomanSymbol = .N
	/// let one: RomanSymbol = .I
	/// print(zero < one)
	/// // Prints "true"
	/// ```
	///
	/// - parameter lhs: A value to compare.
	/// - parameter rhs: Another value to compare.
	/// - returns: `true` if lhs is smaller, and `false` otherwise.
	internal static func < (lhs: Self, rhs: Self) -> Bool {
		return lhs.value < rhs.value
	}
}
