Profile:        IMRStudyEndpoint
Parent:         Endpoint
Id:             imr-study-endpoint
Title:          "IMR Study Endpoint"
Description:    "IHE Interactive Multimedia Report (IMR) profile on Endpoint for Study"

* connectionType from IMRStudyEndpointConnectionTypeVS (required)

* payloadType 1..1
* payloadType.coding from IMRStudyEndpointPayloadTypeVS (extensible)

ValueSet: IMRStudyEndpointConnectionTypeVS
Id: imr-study-endpoint-connectiontype-vs
Title: "IMR Study Endpoint ConnectionType Value Set"
Description: "Codes representing the applicable endpoint connectionType to retrieve a study."
* FHIREndpoint#ihe-iid "IHE IDD"
* FHIREndpoint#dicom-wado-rs "DICOM WADO-RS"


ValueSet: IMRStudyEndpointPayloadTypeVS
Id: imr-study-endpoint-payloadtype-vs
Title: "IMR Study Endpoint PayloadType Value Set"
Description: "Codes representing the applicable endpoint payloadType to retrieve a study."
* DICOM#113014 "Study"