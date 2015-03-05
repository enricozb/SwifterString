import UIKit

extension String {
	
	func length() -> Int {
		return countElements(self)
	}
	
	func reverse() -> String {
		var reverseStr = ""
		for character in self {
			reverseStr = "\(character)\(reverseStr)"
		}
		return reverseStr
	}
	
	mutating func reverseSelf() {
		self = self.reverse()
	}
	
	func substringFrom(start: Int) -> String {
		return self.substring(start: start, end: self.length())
	}
	
	func substringTo(end: Int) -> String {
		return self.substring(start: 0, end: end)
	}
	
	func substring (var #start: Int, var end: Int) -> String {
		var flipped = false
		
		if start > end {
		swap(&start, &end)
			flipped = true
		}
		
		let strIndexRange = Range<String.Index>(start: advance(self.startIndex, start), end: advance(self.startIndex, end))
		
		if flipped {
			return self.substringWithRange(strIndexRange).reverse()
		}
		return self.substringWithRange(strIndexRange)
	}
	
	subscript(start: Int, end: Int) -> String {
		return self.substring(start: start, end: end)
	}
	
	subscript (var i: Int) -> Character {
		if i < 0 {
			return self.reverse()[-(i + 1)]
		}
		
		if i >= self.length() {
			NSException(name: "StringIndexBeyondRange", reason: "The index is beyond the maximum index of the String", userInfo: nil).raise()
		}
		
		return self[advance(self.startIndex, i)]
	}
	
	subscript (str: String) -> Int {
		
		let possibleIndex = self.rangeOfString(str)?.startIndex
		
		if let index = possibleIndex {
			return "\(self.rangeOfString(str)!.startIndex)".toInt()!
		}
		else {
			NSException(name: "SubstringIndexNotFound", reason: "The substring was not found in the string", userInfo: nil).raise()
		}
		return -1
	}
	
	subscript (str_start: String, str_end: String) -> String {
		return self[self[str_start] + str_start.length(), self[str_end]]
	}
}