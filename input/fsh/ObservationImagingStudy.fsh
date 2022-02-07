Profile:        IMRObservationImagingStudy
Parent:         ImagingStudy
Id:             imr-observation-imagingstudy
Title:          "IMR Observation ImagingStudy"
Description:    "IHE Interactive Multimedia Report (IMR) profile on ImagingStudy used in Observation"

// Must have an identifier which is the study instance UID
* identifier 1..*

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type.coding"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier.type.coding"
* identifier ^slicing.ordered = false

* identifier contains studyUID 1..1 MS
* identifier[studyUID].type 1..1 MS
* identifier[studyUID].type.coding = DICOM#110180 "Study Instance UID"
* identifier[studyUID].value 1..1 MS

* subject only Reference(Patient)

// Shall reference one ServiceRequest
* basedOn 0..*

* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = ImagingStudy.basedOn.resolve()
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

// Series must have at least one instance which are the representative instances
* series.instance 1..*

