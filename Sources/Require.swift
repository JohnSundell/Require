/**
 *  Require
 *  Copyright (c) John Sundell 2017
 *  Licensed under the MIT license. See LICENSE file.
 */

import Foundation

public extension Optional {
    /**
     *  Require this optional to contain a non-nil value
     *
     *  This method will either return the value that this optional contains, or trigger
     *  a `preconditionFailure` with an error message containing debug information.
     *
     *  - parameter hint: Optionally pass a hint that will get included in any error
     *                    message generated in case nil was found.
     *
     *  - return: The value this optional contains.
     */
    func require(hint hintExpression: @autoclosure () -> String? = nil,
                 file: StaticString = #file,
                 line: UInt = #line) -> Wrapped {
        guard let unwrapped = self else {
            let message = buildMessage(hintExpression, file, line)
            
            #if !os(Linux)
            let exception = NSException(
                name: .invalidArgumentException,
                reason: message,
                userInfo: nil
            )
            
            exception.raise()
            #endif
            
            preconditionFailure(message)
        }
        
        return unwrapped
    }
    
    /**
     *  Attempt to extract the wrapped value. If not present then stop programme
     *  execution for debug configurations only. Release configurations will not crash.
     *
     *  This method will either return the value that this optional contains, or trigger
     *  an `assertionFailure` with an error message containing debug information.
     *
     *  - parameter hint: Optionally pass a hint that will get included in any error
     *                    message generated in case nil was found.
     *
     *  - return: The value this optional contains or nil if a value is not present.
     */
    func assert(hint hintExpression: @autoclosure () -> String? = nil,
                file: StaticString = #file,
                line: UInt = #line) -> Wrapped? {
        if let unwrapped = self {
            return unwrapped
        }
        
        let message = buildMessage(hintExpression, file, line)
        
        assertionFailure(message)
        
        return nil
    }
    
    private func buildMessage(_ hintExpression: @autoclosure () -> String? = nil,
                              _ file: StaticString = #file,
                              _ line: UInt = #line) -> String {
        var message = "Required value was nil in \(file), at line \(line)"
        if let hint = hintExpression() {
            message.append(". Debugging hint: \(hint)")
        }
        return message
    }
}
