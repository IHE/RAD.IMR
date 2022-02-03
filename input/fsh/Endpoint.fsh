Profile:        IMRStudyEndpoint
Parent:         Endpoint
Id:             imr-study-endpoint
Title:          "IMR Study Endpoint"
Description:    "IHE Interactive Multimedia Report (IMR) profile on Endpoint for Study"

* connectionType from IMRStudyEndpointVS (required)
* payloadType = DICOM#113014 "Study"

ValueSet: IMRStudyEndpointVS
Id: imr-study-endpoint-vs
Title: "IMR Study Endpoint Value Set"
Description: "Codes representing the applicable endpoints to retrieve a study."
* FHIREndpoint#ihe-iid "IHE IDD"
* FHIREndpoint#dicom-wado-rs "DICOM WADO-RS"