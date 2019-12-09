//
//  Helpers.swift
//  sssfunPackageDescription
//
//  Created by Denis Bystruev on 09.12.2019.
//
//  http://www.alwaysrightinstitute.com/http-010/
//  docker run -p 1337:1337 -it --name sssfun -v ./sssfun:/sssfun -w/sssfun swift:4.0 /bin/bash

import Foundation
import HTTP

extension HTTPRequest {
    subscript(query q: String) -> String? {
        return URLComponents(string: target)?.queryItems?.first(where: { $0.name == q })?.value
    }
}

extension String {
    var htmlEscaped: String {
        let escapeMap: [Character: String] = [
            "<": "&lt;", ">": "&gt;", "&": "&amp;", "\"": "&quot;"
        ]
        return map { escapeMap[$0] ?? String($0) }.reduce("", +)
    }
}
