import UIKit

var greeting = "Hello, playground"
// @:?!()$#,./\
let text = "abc\\"
let specialCharacterRegex = "[@:?!()$#,./\\\\]+"
text.range(of: specialCharacterRegex, options: .regularExpression) != nil
