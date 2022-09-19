import XCTest
@testable import EasyUserDefaults

final class EasyUserDefaultsTests: XCTestCase {

    func testTestStringValue() {
        var values: [String] = []

        // save single value
        let expectSingleValue = "1"
        let saveSingleResult = MockStringEasyUserDefaults.save(value: expectSingleValue)
        XCTAssertEqual(saveSingleResult, expectSingleValue)
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(values.count, 1)
        XCTAssertEqual(values.first!, expectSingleValue)

        // delete single value
        MockStringEasyUserDefaults.delete(value: expectSingleValue)
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(values.count, 0)

        // save array values
        let expectArrayValue = [
            "1",
            "2",
            "2",
            "3"
        ]
        let result = MockStringEasyUserDefaults.save(value: expectArrayValue)
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(result, expectArrayValue)
        XCTAssertEqual(values, expectArrayValue)

        // delete at index
        MockStringEasyUserDefaults.delete(at: 0)
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(values.count, 3)
        XCTAssertEqual(values, [
            "2",
            "2",
            "3"
        ])

        // delete value
        MockStringEasyUserDefaults.delete(value: "2")
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(values.count, 1)
        XCTAssertEqual(values.first, "3")

        // update value
        try! MockStringEasyUserDefaults.update(value: "0", in: 0)
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(values.first!, "0")

        // update array value
        let expectArrayValue2 = [
            "",
            "",
            ""
        ]
        MockStringEasyUserDefaults.update(value: expectArrayValue2)
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(values, expectArrayValue2)

        // delete all
        let result2 = MockStringEasyUserDefaults.deleteAll()
        values = MockStringEasyUserDefaults.getAll()
        XCTAssertEqual(result2.count, 0)
        XCTAssertEqual(values.count, 0)

    }
}
