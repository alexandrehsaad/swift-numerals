// Roman.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

/// A representation of a roman numeral.
public struct Roman {
	/// The underlying value.
	internal typealias Value = UInt16
	
	/// Creates a new instance with the specified value.
	///
	/// - parameter value: The value of this instance.
	/// - Warning: The value must be inbetween negative eight and positive seven included.
	internal init(value: Self.Value) {
		precondition(0...3999 ~= value)
		self.value = value
	}
	
	/// The underlying value.
	internal let value: Self.Value
}
