// Invariant
Invariant:   IMRAttachmentInvariant
Description: "Either data or url SHALL be present"
Expression:  "data.exists() or url.exists()"
Severity:    #error