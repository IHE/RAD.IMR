Profile:        IMRObservationImagingStudy
Parent:         ImagingStudy
Id:             imr-observation-imagingstudy
Title:          "IMR Observation ImagingStudy"
Description:    "IHE Interactive Multimedia Report (IMR) profile on ImagingStudy used in Observation"

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

// Must have only one series
* series 1..1

// Must have at least one endpoint at the series level of type IMRStudyEndpoint
* series.endpoint 1..*
* series.endpoint only Reference(IMRStudyEndpoint)

* series.specimen 0..0

// Series must have one instance which is the representative instance to be displayed immediately
* series.instance 1..1

