import Foundation

extension Double {
    func toInt() -> Int {
        let roundedValue = rounded(.up)
        return Int(exactly: roundedValue) ?? 0
    }
}
