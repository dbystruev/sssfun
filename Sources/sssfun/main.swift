//  http://www.alwaysrightinstitute.com/http-010/
//  docker run -p 1337:1337 -it --name sssfun -v ~/sssfun:/sssfun -w/sssfun swift:4.0 /bin/bash

import Foundation
import HTTP

let server = HTTPServer()
do {
    try server.start(port: 1337, handler: hello)
} catch {
    print(#line, #function, "Failed to start server:", error)
    exit(42)
}

RunLoop.current.run()
