import UIKit

var greeting = "Hello, playground"


let people = [
    ("Alice", "Engineer"),
    ("Bob", "Designer"),
    ("Charlie", "Engineer"),
    ("Diana", "Designer"),("Mani","Software")
]

//I need like  key - Value  is Engineer -->  Alice,Charlie

let groupByProf = people.reduce(into: [String:[String]]()) { result, pair in
     result[pair.1, default: []].append(pair.0)
}

print(groupByProf)

let words = ["apple", "banana", "apple", "orange", "banana", "apple"]

let fruitsGroup = words.reduce(into: [String: Int]()) {
    result, fruit in
     result[fruit, default: 0] += 1
}
print(fruitsGroup)
// Result:
// ["apple": 3, "banana": 2, "orange": 1]

let transactions = [
    ("John", 100),
    ("Alice", 50),
    ("John", 200),
    ("Alice", 150),("Hari",90)
]
// Result:
// ["John": 300, "Alice": 200]

let marksResult = transactions.reduce(into:[String:Int]()) { groupedResult, student in
     groupedResult[student.0, default: 0] += student.1
}
print(marksResult)

let data = [
    ["id": "1", "tags": ["swift", "ios"]],
    ["id": "2", "tags": ["swift", "macos"]],
    ["id": "3", "tags": ["ios", "macos"]]
]

let tagResult = data.reduce(into:[String:[String]]()) {
    result , value in
   //Value we will ["Id","",""]
   guard let id = value["id"] as? String, let tags = value["tags"] as? [String] else  {
    return
   }
   for tag in tags {
    result[tag, default: []].append(id)
   }
}
print(tagResult)

// Result:
// [
//   "swift": ["1", "2"],
//   "ios": ["1", "3"],
//   "macos": ["2", "3"]
// ]




let languageGroup = data.reduce(into:[String:[String]]()) {
       result, item in
       guard let tags = item["tags"] as? [String], let id = item["id"] as? String  else { return }
     
      for tag in tags {
        result[tag, default: []].append(id)
      }

}
print(languageGroup)

let dict1 = ["a": 1, "b": 2]
let dict2 = ["b": 3, "c": 4]

let resultedDict = dict2.reduce(into:dict1) {
   result, value in
    result[value.key, default: 0] += value.value
}
print(resultedDict)
// Result: ["a": 1, "b": 5, "c": 4]
