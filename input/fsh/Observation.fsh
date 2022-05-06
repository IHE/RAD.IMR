Profile:        IMRObservation
Parent:         Observation
Id:             imr-observation
Title:          "(Experimental) Imaging Observation"
Description:    "Experimental profile on Observation for Imaging"

// Shall reference one ServiceRequest
* basedOn 1..* MS

* basedOn ^slicing.discriminator.type = #type
* basedOn ^slicing.discriminator.path = resolve()
* basedOn ^slicing.rules = #open
* basedOn ^slicing.description = "Slice based on the basedOn reference type"
* basedOn ^slicing.ordered = false

* basedOn contains serviceRequest 1..*
* basedOn[serviceRequest] only Reference(IMRServiceRequest)

// Specify the category to be imaging
* category 1..*

* category ^slicing.discriminator.type = #pattern
* category ^slicing.discriminator.path = "coding"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category.coding"
* category ^slicing.ordered = false

* category contains imaging 1..1 MS
* category[imaging].coding = FHIRObservation#imaging

// Shall reference on Patient
* subject 1..1
* subject only Reference(Patient)

* effectiveDateTime 1..1 MS

// At least one performer is an Organization
* performer only Reference(Practitioner or PractitionerRole or Organization)

* value[x] 1..1 MS

* method 0..1 MS

// Maximum one study to be referenced in derivedFrom
* derivedFrom 0..* MS

* derivedFrom ^slicing.discriminator.type = #type
* derivedFrom ^slicing.discriminator.path = resolve()
* derivedFrom ^slicing.rules = #open
* derivedFrom ^slicing.description = "Slice based on the derivedFrom reference type"
* derivedFrom ^slicing.ordered = false

* derivedFrom contains imagingStudy 0..1
* derivedFrom[imagingStudy] only Reference(ImagingStudy)

* code MS
* code from IMRObservationCodeVS (extensible)

ValueSet:  IMRObservationCodeVS
Id: imr-observation-code-vs
Title: "(Experimental) Imaging Observation Code Value Set"
Description: "Experimental: Codes representing the different kinds of findings in radiology report."
* LOINC#59776-5 "Procedure Findings"
* LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)"