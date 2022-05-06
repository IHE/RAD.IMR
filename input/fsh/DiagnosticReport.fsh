Profile:        IMRDiagnosticReport
Parent:         DiagnosticReport
Id:             imr-diagnosticreport
Title:          "IMR DiagnosticReport"
Description:    "IHE Interactive Multimedia Report (IMR) profile on DiagnosticReport"

* text MS

// May reference no ServiceRequest for other -ologies in enterprise imaging
* basedOn 0..* MS

* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = resolve()
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the basedOn reference type"
* basedOn ^slicing.ordered = false

* basedOn contains serviceRequest 0..*
* basedOn[serviceRequest] only Reference(IMRServiceRequest)

// Shall reference on Patient
* subject 1..1
* subject only Reference(Patient)

* issued 1..1
* issued ^short = "DateTime that this diagnostic report is signed-off and published."

// At least one performer is an Organization
* performer 1..*

* performer ^slicing.discriminator.type = #type
* performer ^slicing.discriminator.path = resolve()
* performer ^slicing.rules = #open
* performer ^slicing.description = "Slice based on the performer reference type"
* performer ^slicing.ordered = false

* performer contains organization 1..1
* performer[organization] only Reference(Organization)

// At least one resultsInterpreter is a Practitioner or PractitionerRole
* resultsInterpreter 1..*
* resultsInterpreter only Reference(Practitioner or PractitionerRole)

// Shall include at least one referenced study
* imagingStudy 1..1 MS
* imagingStudy ^short = "Study subject to this report"
* imagingStudy ^definition = "Study subject to this report"

// Shall include at least one presentedForm which is the text with embedded multimedia content. May include PDF
* presentedForm 1..* MS

* presentedForm ^slicing.discriminator.type = #pattern
* presentedForm ^slicing.discriminator.path = contentType
* presentedForm ^slicing.rules = #open
* presentedForm ^slicing.description = "Slice based on the presentedForm content type"
* presentedForm ^slicing.ordered = false

* presentedForm obeys IMRAttachmentInvariant
* presentedForm.contentType 1..1 MS
* presentedForm.size 1..1 MS
* presentedForm.hash 1..1 MS
* presentedForm contains html 1..* and pdf 0..*
* presentedForm[html].contentType = MIME#text/html "HTML"
* presentedForm[pdf].contentType = MIME#applicatoin/pdf "PDF"

* extension contains AssociatedStudy named associatedStudy 0..* MS

Extension: AssociatedStudy
Title: "IMR DiagnosticReport Associated Study"
Id: associatedStudy
Description: "Associated studies used in part of diagnostic reporting"
* value[x] only Reference(ImagingStudy or DiagnosticReport)