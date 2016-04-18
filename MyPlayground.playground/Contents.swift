//: Playground - noun: a place where people can play

import Cocoa

var str: String = "1 234 556 000"
var num: Int = 12345560065560

extension Int {
    public func divByBits() -> String {
        let rev = "\(abs(self))".reverse()
        var diving = ""
        var cnt = rev.characters.count
        
        var b = 0
        var e = 2
        
        while cnt > 3 {
            diving = "\(diving)\(rev[b...e]) "
            b += 3
            e += 3
            cnt = cnt - 3
        }
        
        if (cnt <= 3) {
            diving = "\(diving) \(rev[rev.characters.count-cnt...rev.characters.count-1]) "
        }
        
        return "\(self < 0 ? "-" : "")\(diving.reverse())"
    }
}

extension String {
    public func reverse() -> String {
        var rev = ""
        for w in self.characters {
            rev = "\(w)\(rev)"
        }
        
        return rev
    }
    
    subscript (i: Int) -> Character {
        return self[self.startIndex.advancedBy(i)]
    }
    
    subscript(integerRange: Range<Int>) -> String {
        let start = startIndex.advancedBy(integerRange.startIndex)
        let end = startIndex.advancedBy(integerRange.endIndex)
        let range = start..<end
        return self[range]
    }
}

num.divByBits()




