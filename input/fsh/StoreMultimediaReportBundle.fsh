Profile:        IMRStoreMultimediaReportBundle
Parent:         Bundle
Id:             imr-store-multimedia-report-bundle
Title:          "IMR Store Multimedia Report Bundle"
Description:    "IHE Interactive Multimedia Report (IMR) profile on Bundle"
* meta.profile 1..*
* type = #transaction
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = resource
* entry ^slicing.rules = #closed
* entry ^slicing.description = "Slicing based on the profile conformance of the entry"
* entry and entry.resource MS
* entry contains 
    DiagnosticReport 1..1 and
    ServiceRequest 0..* and
    Observation 0..* and
    ImagingStudy 0..*
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
* entry[ServiceRequest].request.method = #POST

* entry[Observation].resource only IMRObservation
* entry[Observation] ^short = "the Observation"
* entry[Observation] ^definition = "the observation (or finding) that is captured in this DiagnosticReport."
* entry[Observation].resource 1..1
* entry[Observation].request.method = #POST

* entry[ImagingStudy].resource only IMRImagingStudy
* entry[ImagingStudy] ^short = "the ImagingStudy"
* entry[ImagingStudy] ^definition = "the ImagingStudy referenced by the Observation or by the DiagnoistcReport."
* entry[ImagingStudy].resource 1..1
* entry[ImagingStudy].request.method = #POST


Profile:        IMRStoreMultimediaReportBundleResponse
Parent:         Bundle
Id:             imr-store-multimedia-report-bundle-response
Title:          "IMR Store Multimedia Report Bundle Response"
Description:    """
A profile on the Bundle transaction-response for [RAD-141] Store Multimedia Report Response.

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