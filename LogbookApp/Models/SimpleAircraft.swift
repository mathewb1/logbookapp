//
//  SimpleAircraft.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import Foundation
import SwiftData

/// A basic model representing an aircraft with make and registration details.
@Model
final class Aircraft {
    // MARK: - Properties
    var make: String
    var registration: String

    // MARK: - Initializer
    init(make: String, registration: String) {
        self.make = make
        self.registration = registration
    }
}
```

### Step 4: Review the Code
1. **Conventions**: The code adheres to Swift naming conventions and uses the `@Model` decorator for SwiftData integration.
2. **Completeness**: All required fields (`make` and `registration`) are implemented.
3. **Functionality**: The initializer ensures that the properties are properly set when creating an instance of `Aircraft`.
4. **Imports**: Necessary imports (`Foundation` and `SwiftData`) are included.

### Final Output
The complete file content is as follows:

```
//
//  SimpleAircraft.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import Foundation
import SwiftData

/// A basic model representing an aircraft with make and registration details.
@Model
final class Aircraft {
    // MARK: - Properties
    var make: String
    var registration: String

    // MARK: - Initializer
    init(make: String, registration: String) {
        self.make = make
        self.registration = registration
    }
}
