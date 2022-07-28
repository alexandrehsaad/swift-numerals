// Collection+.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Collection
where Self.Element: Equatable {
	/// Returns a boolean value indicating whether the elements of this sequence are equal.
	///
	/// - returns: A boolean indicating whether all the elements are equal.
	internal var areEqual: Bool {
		return self.dropFirst().allSatisfy({ (element) in
			self.first == element
		})
	}
}
