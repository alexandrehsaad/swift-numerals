// Roman+Addable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Addable {
	/// Returns the sum of adding the two specified value.
	///
	/// ```swift
	/// let one: Roman = 1
	/// print(one + one)
	/// // Prints "II"
	/// ```
	///
	/// - parameter lhs: The augend.
	/// - parameter rhs: The addend.
	/// - returns: The sum.
	public static func + (_ lhs: Self, _ rhs: Self) -> Self {
		let newValue: Self.Value = lhs.value + rhs.value
		return .init(value: newValue)
	}
}
