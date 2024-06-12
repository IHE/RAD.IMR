Profile:        IMRServiceRequest
Parent:         ServiceRequest
Id:             imr-servicerequest
Title:          "IMR ServiceRequest"
Description:    """
IHE Interactive Multimedia Report (IMR) profile on ServiceRequest

An IMR ServiceRequest captures the service request (a.k.a. order) for an imaging procedure.
An IMR ServiceRequest is usually created before an imaging study is acquired (e.g. in radiology)
while some other departments (e.g. cardiology) may not create an order at all.
"""

// Must have an identifier which is the accession number
* identifier 1..*

* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type.coding"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Slice based on the identifier.type.coding"
* identifier ^slicing.ordered = false

* identifier contains accession 1..1 MS
* identifier[accession].type 1..1 MS
* identifier[accession].type.coding = HL7V2#ACSN
* identifier[accession].value 1..1 MS

* intent from IMRServiceRequestIntentVS (required)

* subject only Reference(Patient)

ValueSet: IMRServiceRequestIntentVS
Id: imr-servicerequest-intent-vs
Title: "IMR ServiceRequest intent Value Set"
Description: "Codes representing the applicable intent for an imaging ServiceRequest."
* FHIRRequestIntent#order "Order"
* FHIRRequestIntent#original-order "Original Order"
* FHIRRequestIntent#reflex-order "Reflex Order"
* FHIRRequestIntent#filler-order "Filler Order"
* FHIRRequestIntent#instance-order "Instance Order"

* ^experimental = false
