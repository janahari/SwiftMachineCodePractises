# 📘 Swift `reduce(into:)` -- Grouping, Counting & Merging Examples

This document explains multiple real‑world use cases of **Swift's
powerful `reduce(into:)`** method.\
All examples are written so you can run them directly in a **Swift
Playground** or Xcode project.

------------------------------------------------------------------------

# ⭐ Why `reduce(into:)`?

`reduce(into:)` allows you to **mutate a result container efficiently**
without creating intermediate copies.\
Perfect for:

-   Grouping data\
-   Counting occurrences\
-   Merging dictionaries\
-   Transforming collections

------------------------------------------------------------------------

# 📌 1. Grouping Tuples by a Property

### **Input**

``` swift
let people = [
    ("Alice", "Engineer"),
    ("Bob", "Designer"),
    ("Charlie", "Engineer"),
    ("Diana", "Designer"),
    ("Mani", "Software")
]
```

### **Using `reduce(into:)`**

``` swift
let groupByProf = people.reduce(into: [String:[String]]()) { result, pair in
    result[pair.1, default: []].append(pair.0)
}
print(groupByProf)
```

### **Result**

    {
      "Engineer": ["Alice", "Charlie"],
      "Designer": ["Bob", "Diana"],
      "Software": ["Mani"]
    }

------------------------------------------------------------------------

# 📌 2. Counting Occurrences of Items

### **Input**

``` swift
let words = ["apple", "banana", "apple", "orange", "banana", "apple"]
```

### **Using `reduce(into:)`**

``` swift
let fruitsGroup = words.reduce(into: [String: Int]()) { result, fruit in
    result[fruit, default: 0] += 1
}
print(fruitsGroup)
```

### **Result**

    {
      "apple": 3,
      "banana": 2,
      "orange": 1
    }

------------------------------------------------------------------------

# 📌 3. Summing Values by Key

### **Input**

``` swift
let transactions = [
    ("John", 100),
    ("Alice", 50),
    ("John", 200),
    ("Alice", 150),
    ("Hari", 90)
]
```

### **Using `reduce(into:)`**

``` swift
let marksResult = transactions.reduce(into:[String:Int]()) { result, entry in
    result[entry.0, default: 0] += entry.1
}
print(marksResult)
```

### **Result**

    {
      "John": 300,
      "Alice": 200,
      "Hari": 90
    }

------------------------------------------------------------------------

# 📌 4. Grouping IDs by Multiple Tags

### **Input**

``` swift
let data = [
    ["id": "1", "tags": ["swift", "ios"]],
    ["id": "2", "tags": ["swift", "macos"]],
    ["id": "3", "tags": ["ios", "macos"]]
]
```

### **Using `reduce(into:)`**

``` swift
let tagResult = data.reduce(into:[String:[String]]()) { result, item in
    guard let id = item["id"] as? String,
          let tags = item["tags"] as? [String] else { return }

    for tag in tags {
        result[tag, default: []].append(id)
    }
}
print(tagResult)
```

### **Result**

    {
      "swift": ["1", "2"],
      "ios": ["1", "3"],
      "macos": ["2", "3"]
    }

------------------------------------------------------------------------

# 📌 5. Merging Dictionaries by Adding Common Keys

### **Input**

``` swift
let dict1 = ["a": 1, "b": 2]
let dict2 = ["b": 3, "c": 4]
```

### **Using `reduce(into:)`**

``` swift
let resultedDict = dict2.reduce(into: dict1) { result, pair in
    result[pair.key, default: 0] += pair.value
}
print(resultedDict)
```

### **Result**

    {
      "a": 1,
      "b": 5,
      "c": 4
    }

------------------------------------------------------------------------

# 🎯 Summary: Why Use `reduce(into:)`?

  -----------------------------------------------------------------------
  Feature                           Benefit
  --------------------------------- -------------------------------------
  **Efficient mutation**            Avoids creating new copies of
                                    dictionaries/arrays

  **Powerful grouping**             Ideal for grouping and counting
                                    elements

  **Clean code**                    Functional, readable, concise

  **Fast**                          Mutates container in place, improving
                                    performance
  -----------------------------------------------------------------------

------------------------------------------------------------------------

# 🚀 Best Practices

-   Prefer `reduce(into:)` when building dictionaries or arrays from
    scratch.
-   Use `default:` to safely handle missing keys.
-   Use with tuples, arrays, and dictionaries for cleaner data
    processing.

------------------------------------------------------------------------

var additionOfNums = addTwoNums
additionOfNums(2,3)


Yes, you can store functions.
But this gives you only 10% of what closures can do.
The REAL Power of Closures (Why we need them)
(A) Closures can capture values

This is the biggest advantage.
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count   // closure captures 'count'
    }
}

let counter = makeCounter()
print(counter()) // 1
print(counter()) // 2
print(counter()) // 3
👉 A normal function cannot do this.
👉 Only closures can remember and mutate external variables.
Functions cannot:

❌ capture values
❌ be written inline
❌ be concise and anonymous
❌ be used flexibly with APIs expecting closure syntax
❌ replace callbacks for async tasks

Closures can do all of these.
