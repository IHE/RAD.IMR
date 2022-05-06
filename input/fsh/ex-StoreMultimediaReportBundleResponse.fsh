Instance: ex-StoreMultimediaReportBundleResponse
InstanceOf: IMRStoreMultimediaReportBundleResponse
Title: "Store Multimedia Report Bundle Response example"
Description: "Sample Store Multimedia Report Bundle Response in IMR"
Usage: #example
//* meta.profile = "https://profiles.ihe.net/RAD/IMR/StructureDefinition/imr-store-multimedia-report-bundle-response"
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #transaction-response
* link[0].relation = "self"
* link[0].url = "http://example.com/fhir"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "DiagnosticReport/1"
* entry[=].response.lastModified = "2022-03-12T23:55:50-05:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "ServiceRequest/1"
* entry[=].response.lastModified = "2022-03-12T23:55:50-05:00"
* entry[+].response.status = "201 Created"
* entry[=].response.location = "ImagingStudy/1"
* entry[=].response.lastModified = "2022-03-12T23:55:50-05:00"