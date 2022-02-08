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
* reasonReference = Reference(Condition/in-Condition)


Instance: ex-Condition
InstanceOf: Condition
Usage: #example
* subject = Reference(Patient/ex-Patient)
* note.text = "History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am"