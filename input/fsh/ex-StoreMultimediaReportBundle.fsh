Instance: ex-StoreMultimediaReportBundle
InstanceOf: IMRStoreMultimediaReportBundle
Title: "Store Multimedia Report Bundle example"
Description: "Sample Store Multimedia Report Bundle used to store an IMR"
Usage: #example
//* meta.profile = "https://profiles.ihe.net/RAD/IMR/StructureDefinition/imr-store-multimedia-report-bundle"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction
* timestamp = 2022-03-13T23:50:50-05:00
* entry[DiagnosticReport].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300001"
* entry[DiagnosticReport].resource = ex-DiagnosticReport
* entry[DiagnosticReport].request.url = "IMRDiagnosticReport"
* entry[DiagnosticReport].request.method = #POST
* entry[ServiceRequest].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300002"
* entry[ServiceRequest].resource = ex-ServiceRequest
* entry[ServiceRequest].request.url = "IMRServiceRequest"
* entry[ServiceRequest].request.method = #POST
* entry[ImagingStudy].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300012"
* entry[ImagingStudy].resource = ex-ImagingStudy
* entry[ImagingStudy].request.url = "ImagingStudy"
* entry[ImagingStudy].request.method = #POST
