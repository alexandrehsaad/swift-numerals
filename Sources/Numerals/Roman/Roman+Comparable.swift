// Roman+Comparable.swift
// Numerals
//
// Copyright © 2021-2022 Alexandre H. Saad
// Licensed under Apache License v2.0 with Runtime Library Exception
//

extension Roman: Comparable {
	public static func < (lhs: Self, rhs: Self) -> Bool {
		return lhs.value < rhs.value
	}
}
