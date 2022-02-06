Profile:        IMRProvideReportBundle
Parent:         Bundle
Id:             imr-bundle
Title:          "IMR Provide Report Bundle"
Description:    "IHE Interactive Multimedia Report (IMR) profile on Bundle"
* meta.profile 1..*
* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS
* entry contains 
    DiagnosticReport 1..1 and
    ServiceRequest 1..1 and
    Patient 1..1 and
    Organization 1..* and
    Practitioner 1..* and
    Observation 1..* and
    ImagingStudy 1..*
* entry[DiagnosticReport].resource only IMRDiagnosticReport 
* entry[DiagnosticReport] ^short = "the DiagnosticReport"
* entry[DiagnosticReport] ^definition = "The DiagnosticReport defines the overall diagnostic report."
* entry[DiagnosticReport].resource 1..1
* entry[DiagnosticReport].request 1..1
* entry[DiagnosticReport].request.method = #POST

* entry[ServiceRequest].resource only IMRServiceRequest 
* entry[ServiceRequest] ^short = "the ServiceRequest"
* entry[ServiceRequest] ^definition = "The target ServiceRequest (or order) for this DiagnosticReport."
* entry[ServiceRequest].resource 1..1
* entry[ServiceRequest].request 1..1
* entry[ServiceRequest].request.method from IMRProvideReadWriteUpdateVS

* entry[Patient].resource ^type.code = "Patient"
* entry[Patient].resource ^type.profile = Canonical(Patient)
* entry[Patient] ^short = "the Patient"
* entry[Patient] ^definition = "the patient that is the subject of this DiagnosticReport"
* entry[Patient].resource 1..1
* entry[Patient].request 1..1
* entry[Patient].request.method from IMRProvideReadWriteUpdateVS

* entry[Organization].resource ^type.code = "Organization"
* entry[Organization].resource ^type.profile = Canonical(Organization)
* entry[Organization] ^short = "the Organization"
* entry[Organization] ^definition = "The organization responsible for the DiagnosticReport."
* entry[Organization].resource 1..1
* entry[Organization].request 1..1
* entry[Organization].request.method from IMRProvideReadWriteVS

* entry[Practitioner].resource ^type.code = "Practitioner"
* entry[Practitioner].resource ^type.profile = Canonical(Practitioner)
* entry[Practitioner] ^short = "the Practitioner"
* entry[Practitioner] ^definition = "the Practitioner responsible for the interpretation of the DiagnosticReport."
* entry[Practitioner].resource 1..1
* entry[Practitioner].request.method from IMRProvideReadWriteVS

* entry[Observation].resource only IMRObservation
* entry[Observation] ^short = "the Observation"
* entry[Observation] ^definition = "the observation (or finding) that is captured in this DiagnosticReport."
* entry[Observation].resource 1..1
* entry[Observation].request.method from IMRProvideReadWriteVS

* entry[ImagingStudy].resource only IMRObservationImagingStudy or IMRDiagnosticReportImagingStudy
* entry[ImagingStudy] ^short = "the ImagingStudy"
* entry[ImagingStudy] ^definition = "the ImagingStudy referenced by the Observation or by the DiagnoistcReport."
* entry[ImagingStudy].resource 1..1
* entry[ImagingStudy].request.method from IMRProvideReadWriteVS

ValueSet: IMRProvideReadWriteUpdateVS
Id: imr-provide-readwriteupdate-vs
Title: "IMR Read Write Update Types ValueSet"
Description: "A ValueSet that allows read, write or update actions. Where the resource would typically be indicated as a GET (read), but might be created or updated depending on policy."
* http://hl7.org/fhir/http-verb#GET
* http://hl7.org/fhir/http-verb#POST
* http://hl7.org/fhir/http-verb#PUT

ValueSet: IMRProvideReadWriteVS
Id: imr-provide-readwrite-vs
Title: "IMR Read Write Types ValueSet"
Description: "A ValueSet that allows read or write actions. Where the resource would typically be indicated as a POST (write), but might be created or updated depending on policy."
* http://hl7.org/fhir/http-verb#GET
* http://hl7.org/fhir/http-verb#POST



Profile:        IMRProvideReportBundleResponse
Parent:         Bundle
Id:             imr-provide-report-bundle-response
Title:          "IMR Provide Report Bundle Response"
Description:    """
A profile on the Bundle transaction-response for [RAD-Y3] Query Multimedia Report Bundle response.

- shall be a transaction response
- shall have at least 1 entry for each entry in the request, in the same order as received in the request
  - entry response location must be indicated
"""
* type = #transaction-response
* entry 1..* 
* entry ^short = "One entry for each entry in the request, in the same order as received"
* entry.response 1..
* entry.response ^short = "Indicating the results of processing the entry"
* entry.response.location 1..