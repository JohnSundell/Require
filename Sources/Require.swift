import Foundation

public extension Optional {
    func require(hint hintExpression: @autoclosure () -> String? = nil,
                 file: StaticString = #file,
                 line: UInt = #line) -> Wrapped {
        guard let unwrapped = self else {
            var message = "Required value was nil"

            if let hint = hintExpression() {
                message.append(". Debugging hint: \(hint)")
            }

            preconditionFailure(message, file: file, line: line)
        }

        return unwrapped
    }
}
