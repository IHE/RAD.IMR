Instance: ex-ServiceRequest
InstanceOf: IMRServiceRequest
Title: "IMR ServiceRequest example"
Description: "Simple IMR ServiceRequest example with a condition"
Usage: #example
* identifier.type.coding = HL7V2#ACSN "Accession ID"
* identifier.system = "http://www.acme.com/identifiers/accession"
* identifier.value = "12345"
* status = FHIRRequestStatus#completed
* intent = FHIRRequestIntent#order
* category.coding = SCT#363679005 "Imaging"
* subject = Reference(Patient/ex-Patient)