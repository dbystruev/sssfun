//
//  HelloHTTP.swift
//  sssfunPackageDescription
//
//  Created by Denis Bystruev on 09.12.2019.
//
//  http://www.alwaysrightinstitute.com/http-010/
//  docker run -p 1337:1337 -it --name sssfun -v ~/sssfun:/sssfun -w/sssfun swift:4.0 /bin/bash

import Foundation
import HTTP
import cows

func hello(request: HTTPRequest, response: HTTPResponseWriter) -> HTTPBodyProcessing {
    let q = request[query: "q"]?.lowercased() ?? ""
    let cow = q.isEmpty
        ? vaca() // random cow
        : allCows.first(where: { $0.lowercased().contains(q) })
            ?? "No such cow"
    
    response.writeHeader(status: .ok,
                         headers: ["Content-Type": "text/html"])
    response.writeBody(
        """
        <center>
            <form action="/hello/" method="get">
                Find Beef: <input name="q" placeholder="e.g. 'moon'">
                <a href="/hello/">[random]</a>
            </form>
        <pre>\(cow.htmlEscaped)</pre>
        </center>
        """
    )
    response.done()
    return .discardBody
}
