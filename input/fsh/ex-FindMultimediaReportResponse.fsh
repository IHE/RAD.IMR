Instance:   ex-findMultimediaReportResponse
InstanceOf: IMRFindMultimediaReportResponse
Title:      "Example of an IMR Find Multimedia Report Response"
Description: "Example of an IMR Find Multimedia Report Bundle Search Set"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST
* type = #searchset
* link[0].relation = "self"
* link[0].url = "http://example.org/DiagnosticReport?basedOn.identifier=9876&status=final"
* total = 1
* timestamp = 2022-03-12T11:32:24Z
* entry[0].fullUrl = "http://example.org/DiagnosticReport/ex-DiagnosticReport"
* entry[0].resource = ex-DiagnosticReport