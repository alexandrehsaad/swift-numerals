// Roman+Multipliable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Multipliable {
	/// Returns the product of multiplying the two specified value.
	///
	/// ```swift
	/// let two: Roman = 2
	/// print(two * two)
	/// // Prints "IV"
	/// ```
	///
	/// - parameter lhs: The multiplicand.
	/// - parameter rhs: The multiplicator.
	/// - returns: The product.
	public static func * (_ lhs: Self, _ rhs: Self) -> Self {
		let newValue: Self.Value = lhs.value * rhs.value
		return .init(value: newValue)
	}
}
