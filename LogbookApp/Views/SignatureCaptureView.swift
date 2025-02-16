//
//  SignatureCaptureView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI

struct SignatureCaptureView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var paths: [Path] = []
    @State private var currentPath = Path()
    @Binding var signatureData: Data?

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.white
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Canvas { context, size in
                        for path in paths {
                            context.stroke(path, with: .color(.black), lineWidth: 2)
                        }
                        context.stroke(currentPath, with: .color(.black), lineWidth: 2)
                    }
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                currentPath.addLine(to: value.location)
                            }
                            .onEnded { _ in
                                paths.append(currentPath)
                                currentPath = Path()
                            }
                    )
                }
                .frame(height: 300)
                .padding()
                
                HStack {
                    Button("Clear") {
                        paths.removeAll()
                        currentPath = Path()
                    }
                    .foregroundColor(.red)
                    .padding()
                    
                    Spacer()
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                    .padding()
                    
                    Button("Save") {
                        saveSignature()
                    }
                    .foregroundColor(.green)
                    .padding()
                }
            }
            .navigationTitle("Capture Signature")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func saveSignature() {
        let renderer = ImageRenderer(content: ZStack {
            Color.white
            Canvas { context, size in
                for path in paths {
                    context.stroke(path, with: .color(.black), lineWidth: 2)
                }
            }
        })
        
        if let image = renderer.uiImage {
            signatureData = image.pngData()
        }
        
        dismiss()
    }
}

#Preview {
    SignatureCaptureView(signatureData: .constant(nil))
}
```

### Step 4: Review the Code
1. **Drawing Canvas**: The `Canvas` view is used to render the signature. The `DragGesture` captures touch input to draw paths.
2. **Save and Cancel Buttons**: Buttons are implemented to clear the canvas, cancel the operation, or save the signature.
3. **Image Data Conversion**: The `ImageRenderer` converts the drawn paths into a PNG image.
4. **Sheet Presentation**: The `dismiss` environment action is used to close the sheet.

### Final Output
The complete file content is as follows:

```
//
//  SignatureCaptureView.swift
//  LogbookApp
//
//  Created by Mathew Bellamy on 15/02/2025.
//

import SwiftUI

struct SignatureCaptureView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var paths: [Path] = []
    @State private var currentPath = Path()
    @Binding var signatureData: Data?

    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Color.white
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    
                    Canvas { context, size in
                        for path in paths {
                            context.stroke(path, with: .color(.black), lineWidth: 2)
                        }
                        context.stroke(currentPath, with: .color(.black), lineWidth: 2)
                    }
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                currentPath.addLine(to: value.location)
                            }
                            .onEnded { _ in
                                paths.append(currentPath)
                                currentPath = Path()
                            }
                    )
                }
                .frame(height: 300)
                .padding()
                
                HStack {
                    Button("Clear") {
                        paths.removeAll()
                        currentPath = Path()
                    }
                    .foregroundColor(.red)
                    .padding()
                    
                    Spacer()
                    
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.blue)
                    .padding()
                    
                    Button("Save") {
                        saveSignature()
                    }
                    .foregroundColor(.green)
                    .padding()
                }
            }
            .navigationTitle("Capture Signature")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func saveSignature() {
        let renderer = ImageRenderer(content: ZStack {
            Color.white
            Canvas { context, size in
                for path in paths {
                    context.stroke(path, with: .color(.black), lineWidth: 2)
                }
            }
        })
        
        if let image = renderer.uiImage {
            signatureData = image.pngData()
        }
        
        dismiss()
    }
}

#Preview {
    SignatureCaptureView(signatureData: .constant(nil))
}
