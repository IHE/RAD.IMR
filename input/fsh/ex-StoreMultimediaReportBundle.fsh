Instance: ex-StoreMultimediaReportBundle
InstanceOf: IMRStoreMultimediaReportBundle
Title: "Store Multimedia Report Bundle example"
Description: "Sample Store Multimedia Report Bundle used to store an IMR"
Usage: #example
* meta.profile = "http://profiles.ihe.net/RAD/IMR/StructureDefinition/imr-store-multimedia-report-bundle"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2022-03-13T23:50:50-05:00
* entry[DiagnosticReport].fullUrl = "http://example.org/DiagnosticReport/ex-DiagnosticReport"
* entry[DiagnosticReport].resource = ex-DiagnosticReport
* entry[DiagnosticReport].request.url = "IMRDiagnosticReport"
* entry[DiagnosticReport].request.method = #POST
* entry[ServiceRequest].fullUrl = "http://example.org/ServiceRequest/ex-ServiceRequest"
* entry[ServiceRequest].resource = ex-ServiceRequest
* entry[ServiceRequest].request.url = "IMRServiceRequest"
* entry[ServiceRequest].request.method = #POST
* entry[ImagingStudy].fullUrl = "http://example.org/ImagingStudy/ex-ImagingStudy"
* entry[ImagingStudy].resource = ex-ImagingStudy
* entry[ImagingStudy].request.url = "ImagingStudy"
* entry[ImagingStudy].request.method = #POST
