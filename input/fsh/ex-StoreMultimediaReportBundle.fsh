Instance: ex-StoreMultimediaReportBundle
InstanceOf: IMRStoreMultimediaReportBundle
Title: "Store Multimedia Report Bundle example"
Description: "Sample Store Multimedia Report Bundle used to store an IMR"
Usage: #example
* meta.profile = "https://profiles.ihe.net/RAD/IMR/StructureDefinition/imr-store-multimedia-report-bundle"
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
* entry[Patient].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300003"
* entry[Patient].resource = ex-Patient
* entry[Patient].request.url = "Patient"
* entry[Patient].request.method = #POST
* entry[Organization].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300004"
* entry[Organization].resource = ex-Organization
* entry[Organization].request.url = "Organization"
* entry[Organization].request.method = #POST
* entry[Practitioner].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300005"
* entry[Practitioner].resource = ex-Practitioner
* entry[Practitioner].request.url = "Practitioner"
* entry[Practitioner].request.method = #POST
* entry[Observation][+].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300006"
* entry[Observation][=].resource = ex-IMRObservation-Finding
* entry[Observation][=].request.url = "Observation"
* entry[Observation][=].request.method = #POST
* entry[Observation][+].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300007"
* entry[Observation][=].resource = ex-IMRObservation-Impression-1
* entry[Observation][=].request.url = "Observation"
* entry[Observation][=].request.method = #POST
* entry[Observation][+].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300008"
* entry[Observation][=].resource = ex-IMRObservation-Impression-2
* entry[Observation][=].request.url = "Observation"
* entry[Observation][=].request.method = #POST
* entry[Observation][+].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300009"
* entry[Observation][=].resource = ex-IMRObservation-Impression-3
* entry[Observation][=].request.url = "Observation"
* entry[Observation][=].request.method = #POST
* entry[Observation][+].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300010"
* entry[Observation][=].resource = ex-IMRObservation-Impression-4
* entry[Observation][=].request.url = "Observation"
* entry[Observation][=].request.method = #POST
* entry[Observation][+].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300011"
* entry[Observation][=].resource = ex-IMRObservation-Impression-5
* entry[Observation][=].request.url = "Observation"
* entry[Observation][=].request.method = #POST
* entry[ImagingStudy].fullUrl = "urn:uuid:aaaaaaaa-bbbb-cccc-dddd-e00333300012"
* entry[ImagingStudy].resource = ex-ImagingStudy
* entry[ImagingStudy].request.url = "ImagingStudy"
* entry[ImagingStudy].request.method = #POST
