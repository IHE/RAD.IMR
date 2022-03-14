Profile:        IMRFindMultimediaReportResponse
Parent:         Bundle
Id:             imr-find-multimedia-report-response
Title:          "IMR Find Multimedia Report Response message"
Description:    "A profile on the Find Multimedia Report Response message"
* type = #searchset (exactly)
* total 1..
* entry ^slicing.discriminator[0].type = #profile
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.rules = #open
* entry.fullUrl 1..
* entry contains DocumentReference 0..*
* entry[DocumentReference] ^short = "IMRDiagnosticReport"
* entry[DocumentReference].resource 1..
* entry[DocumentReference].resource only IMRDiagnosticReport