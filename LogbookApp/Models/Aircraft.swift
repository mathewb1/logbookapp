//
//  Aircraft.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import Foundation
import SwiftData

/// Enum representing the engine type of an aircraft.
enum EngineType: String, Codable, Hashable, CaseIterable {
    case SEP = "Single Engine Piston"
    case MEP = "Multi Engine Piston"
}

/// Model representing an aircraft record.
@Model
final class Aircraft {
    // MARK: - Properties
    var make: String
    var model: String
    var code: String
    var registration: String
    var engineType: EngineType
    var photo: Data?

    // MARK: - Initializer
    init(
        make: String,
        model: String,
        code: String,
        registration: String,
        engineType: EngineType,
        photo: Data? = nil
    ) {
        self.make = make
        self.model = model
        self.code = code
        self.registration = registration
        self.engineType = engineType
        self.photo = photo
    }
}
```

### Step 4: Review the Code
- **Conventions**: The code follows Swift naming conventions and uses the `@Model` decorator for SwiftData integration.
- **Completeness**: All required fields (`make`, `model`, `code`, `registration`, `engineType`, `photo`) are implemented.
- **Functionality**: The `EngineType` enum is `Codable` and `Hashable`, ensuring compatibility with persistence and SwiftUI views.
- **Imports**: Necessary imports (`Foundation` and `SwiftData`) are included.

### Final Output
The complete file content is as follows:

```
//
//  Aircraft.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import Foundation
import SwiftData

/// Enum representing the engine type of an aircraft.
enum EngineType: String, Codable, Hashable, CaseIterable {
    case SEP = "Single Engine Piston"
    case MEP = "Multi Engine Piston"
}

/// Model representing an aircraft record.
@Model
final class Aircraft {
    // MARK: - Properties
    var make: String
    var model: String
    var code: String
    var registration: String
    var engineType: EngineType
    var photo: Data?

    // MARK: - Initializer
    init(
        make: String,
        model: String,
        code: String,
        registration: String,
        engineType: EngineType,
        photo: Data? = nil
    ) {
        self.make = make
        self.model = model
        self.code = code
        self.registration = registration
        self.engineType = engineType
        self.photo = photo
    }
}