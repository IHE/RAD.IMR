Instance: ex-DiagnosticReport
InstanceOf: IMRDiagnosticReport
Title: "IMR DiagnosticReport example"
Description: "Simple IMR DiagnosticReport"
Usage: #example
* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* status = FHIRDiagnosticReportStatus#final "Final"
* category = FHIRDiagnosticService#RAD "Radiology"
* code = LOINC#29252-4 "CT Chest WO Contrast"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* issued = 2020-12-31T23:55:50-05:00
* performer = Reference(Organization/ex-Organization)
* resultsInterpreter = Reference(Practitioner/ex-Practitioner)
* result[0] = Reference(Observation/ex-IMRObservation-Finding)
* result[1] = Reference(Observation/ex-IMRObservation-Impression-1)
* result[2] = Reference(Observation/ex-IMRObservation-Impression-2)
* result[3] = Reference(Observation/ex-IMRObservation-Impression-3)
* result[4] = Reference(Observation/ex-IMRObservation-Impression-4)
* result[5] = Reference(Observation/ex-IMRObservation-Impression-5)
* imagingStudy = Reference(ImagingStudy/ex-ImagingStudy)
* extension[associatedStudy].valueReference = Reference(ImagingStudy/ex-ImagingStudy-Comparison)
// * extension[indication].valueString = "History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am"
* presentedForm.data = "VGhpcyBpcyBhIHNhbXBsZQ=="
* presentedForm.contentType = MIME#text/html "HTML"
* presentedForm.hash = "25DF2D14B7A81BF0582323E1B337E9EE03C03C10"
* presentedForm.size = 16

Instance: ex-Organization
InstanceOf: Organization
Title: "Organization example"
Description: "Simple Organization to be used in DiagnosticReport"
Usage: #example
* name = "YourHospital"


Instance: ex-Practitioner
InstanceOf: Practitioner
Title: "Practitioner example"
Description: "Simple Practitioner to be used in DiagnosticReport"
Usage: #example
* name.family = "Guy"
* name.given = "Funny"

