Profile:        IMRDiagnosticReportImagingStudy
Parent:         ImagingStudy
Id:             imr-diagnosticreport-imagingstudy
Title:          "IMR DiagnosticReport ImagingStudy"
Description:    "IHE Interactive Multimedia Report (IMR) profile on ImagingStudy used in DiagnosticReport"

* subject only Reference(Patient)

// Shall reference one ServiceRequest
* basedOn 0..*

* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = DiagnosticReport.basedOn.resolve()
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the basedOn reference type"
* basedOn ^slicing.ordered = false

* basedOn contains serviceRequest 0..*
* basedOn[serviceRequest] only Reference(IMRServiceRequest)

// Must have at least one endpoint at the study level of type IMRStudyEndpoint
* endpoint 1..*
* endpoint only Reference(IMRStudyEndpoint)
