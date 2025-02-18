.fullScreenCover(isPresented: $showSignatureSheet) {
    NavigationView {
                    SignatureView(signatureData: $signatureData)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        showSignatureSheet = false
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        showSignatureSheet = false
                    }
                }
            }
    }
            }

@State private var newRating = ""

TextField("Add Rating", text: $newRating)
    .onSubmit {
        guard !newRating.isEmpty else { return }
        ratings.append(newRating)
        newRating = ""
    }