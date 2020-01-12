import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SwiftLibGit2ExecutableTests.allTests),
    ]
}
#endif
