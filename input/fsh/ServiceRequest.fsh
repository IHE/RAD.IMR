Profile:        IMRServiceRequest
Parent:         ServiceRequest
Id:             imr-servicerequest
Title:          "IMR ServceRequest"
Description:    "IHE Interactive Multimedia Report (IMR) profile on ServiceRequest"

// Must have an identifier which is the accession number
* requisition 1..1
* requisition.type = HL7V2#ACSN "Accession ID"
* requisition.system 1..1
* requisition.value 1..1 MS

* intent = #order

* quantity[x] 0..0

* subject only Reference(Patient)

* category 1..1
* category = SCT#363679005 "Imaging"

* occurrenceDateTime 0..1

* specimen 0..0


