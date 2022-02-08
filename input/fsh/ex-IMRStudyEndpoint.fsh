Instance: ex-IMRStudyEndpoint-Series
InstanceOf: IMRStudyEndpoint
Title: "IMR Endpoint for Series example"
Description: "Simple IMR Series Endpoint"
Usage: #example
* connectionType = FHIREndpoint#dicom-wado-rs "DICOM WADO-RS"
* payloadType.coding = DICOM#113015 "Series"
* address = "http://my.example.com/wadors/study/1.2.3.4.5/series/11.22.33.44.55"
* status = FHIREndpointStatus#active


Instance: ex-IMRStudyEndpoint-Study
InstanceOf: IMRStudyEndpoint
Title: "IMR Endpoint for Study example"
Description: "Simple IMR Study Endpoint"
Usage: #example
* connectionType = FHIREndpoint#dicom-wado-rs "DICOM WADO-RS"
* payloadType.coding = DICOM#113014 "Study"
* address = "http://my.example.com/wadors/study/1.2.3.4.5"
* status = FHIREndpointStatus#active


Instance: ex-IMRStudyEndpoint-Study-Comparison
InstanceOf: IMRStudyEndpoint
Title: "IMR Endpoint for Study example"
Description: "Simple IMR Study Endpoint fpr the comparison study"
Usage: #example
* connectionType = FHIREndpoint#dicom-wado-rs "DICOM WADO-RS"
* payloadType.coding = DICOM#113014 "Study"
* address = "http://my.example.com/wadors/study/5.6.7.8.9"
* status = FHIREndpointStatus#active