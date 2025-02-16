import Foundation
import SwiftData

enum EngineType: String, Codable, Hashable, CaseIterable {
    case SEP = "Single Engine Piston"
    case MEP = "Multi Engine Piston"
}

@Model
final class Aircraft {
    var make: String
    var model: String
    var code: String
    var registration: String
    var engineType: EngineType
    var photo: Data?

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
import Foundation
import SwiftData

enum EngineType: String, Codable, Hashable, CaseIterable {
    case SEP = "Single Engine Piston"
    case MEP = "Multi Engine Piston"
}

@Model
final class Aircraft {
    var make: String
    var model: String
    var code: String
    var registration: String
    var engineType: EngineType
    var photo: Data?

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