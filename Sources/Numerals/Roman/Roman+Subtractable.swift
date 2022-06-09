// Roman+Subtractable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Subtractable {
	/// Returns the difference of subracting the second specified value from the first.
	///
	/// ```swift
	/// let two: Roman = 2
	/// let one: Roman = 1
	/// print(two - one)
	/// // Prints "I"
	/// ```
	///
	/// - parameter lhs: The minuend.
	/// - parameter rhs: The subtrahend.
	/// - returns: The difference.
	public static func - (_ lhs: Self, _ rhs: Self) -> Self {
		let newValue: Self.Value = lhs.value - rhs.value
		return .init(value: newValue)
	}
}
