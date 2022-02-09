Profile:        IMRDiagnosticReport
Parent:         DiagnosticReport
Id:             imr-diagnosticreport
Title:          "IMR DiagnosticReport"
Description:    "IHE Interactive Multimedia Report (IMR) profile on DiagnosticRpoert"

// Shall reference one ServiceRequest
* basedOn 1..*

* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = DiagnosticReport.basedOn.resolve()
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the basedOn reference type"
* basedOn ^slicing.ordered = false

* basedOn contains serviceRequest 1..*
* basedOn[serviceRequest] only Reference(IMRServiceRequest)

* status from IMRDiagnosticReportStatusVS

* category 1..*

// Shall reference on Patient
* subject 1..1
* subject only Reference(Patient)

* effectiveDateTime 1..1 MS

* issued 1..1

// At least one performer is an Organization
* performer 1..*

* performer ^slicing.discriminator.type = #type
* performer ^slicing.discriminator.path = DiagnosticReport.performer.resolve()
* performer ^slicing.rules = #open
* performer ^slicing.description = "Slice based on the performer reference type"
* performer ^slicing.ordered = false

* performer contains organization 1..1
* performer[organization] only Reference(Organization)

// At least one resultsInterpreter is a Practitioner
* resultsInterpreter 1..*

* resultsInterpreter ^slicing.discriminator.type = #type
* resultsInterpreter ^slicing.discriminator.path = DiagnosticReport.resultsInterpreter.resolve()
* resultsInterpreter ^slicing.rules = #open
* resultsInterpreter ^slicing.description = "Slice based on the resultsInterpreter reference type"
* resultsInterpreter ^slicing.ordered = false

* resultsInterpreter contains practitioner 1..*
* resultsInterpreter[practitioner] only Reference(Practitioner or PractitionerRole)

// May include result which captured measurements
* result 1..* MS
* result only Reference(IMRObservation)

// Shall include at least one referenced study
* imagingStudy 1..1 MS
* imagingStudy only Reference(IMRDiagnosticReportImagingStudy)
* imagingStudy ^short = "Study subject to this report"
* imagingStudy ^definition = "Study subject to this report"

// Shall include at least one presentedForm which is the text with embedded multimedia content. May include PDF
* presentedForm 1..* MS

* presentedForm ^slicing.discriminator.type = #pattern
* presentedForm ^slicing.discriminator.path = "presentedForm.contentType"
* presentedForm ^slicing.rules = #open
* presentedForm ^slicing.description = "Slice based on the presentedForm content type"
* presentedForm ^slicing.ordered = false

* presentedForm obeys IMRAttachmentInvariant
* presentedForm.contentType 1..1 MS
* presentedForm.size 1..1 MS
* presentedForm.hash 1..1 MS
* presentedForm contains html 1..* and rtf 0..* and pdf 0..*
* presentedForm[html].contentType = MIME#text/html "HTML"
* presentedForm[rtf].contentType = MIME#application/rtf "Rich Text Format"
* presentedForm[pdf].contentType = MIME#applicatoin/pdf "PDF"

* extension contains ComparisonStudy named comparisonStudy 0..* MS
* extension contains IMRDiagnosticReportIndication named indication 0..* MS

Extension: ComparisonStudy
Title: "IMR DiagnosticReport Comparison Study"
Id: comparisonStudy
Description: "Comparison study used in part of diagnostic reporting"
* value[x] only Reference(IMRDiagnosticReportImagingStudy or IMRDiagnosticReport)

Extension: IMRDiagnosticReportIndication
Title: "IMR DiagnosticReport Indication"
Id: indication
Description: "Indication that provides contextual information used during the reporting"
* value[x] only string or CodeableConcept

ValueSet: IMRDiagnosticReportStatusVS
Id: imr-diagnosticreport-status-vs
Title: "IMR DiagnosticReport Status Value Set"
Description: "Status codes that are applicable to imaging diagnostic report lifecycle."
* FHIRDiagnosticReportStatus#partial "Partial"
* FHIRDiagnosticReportStatus#preliminary "Preliminary"
* FHIRDiagnosticReportStatus#final "Final"
* FHIRDiagnosticReportStatus#amended "Amended"
* FHIRDiagnosticReportStatus#corrected "Corrected"
* FHIRDiagnosticReportStatus#appended "Appended"
* FHIRDiagnosticReportStatus#cancelled "Cancelled"