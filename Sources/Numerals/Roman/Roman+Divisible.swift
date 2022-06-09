// Roman+Divisible.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Divisible {
	/// Returns the quotient of dividing the first specified value by the second.
	///
	/// ```swift
	/// let six: Roman = 6
	/// let two: Roman = 2
	/// print(six / two)
	/// // Prints "III"
	/// ```
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The quotient.
	public static func / (lhs: Self, rhs: Self) -> Self {
		let newValue: Self.Value = lhs.value / rhs.value
		return .init(value: newValue)
	}
	
	/// Returns the remainder of dividing the first specified value by the second.
	///
	/// - parameter lhs: The dividend.
	/// - parameter rhs: The divisor.
	/// - returns: The remainder.
	public static func % (lhs: Self, rhs: Self) -> Self {
		let newValue: Self.Value = lhs.value % rhs.value
		return .init(value: newValue)
	}
}
