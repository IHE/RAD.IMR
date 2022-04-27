Instance: ex-ImagingStudy
InstanceOf: IMRImagingStudy
Title: "IMR ImagingStudy example"
Description: "Simple IMR ImagingStudy to be used in DiagnosticReport and Observation"
Usage: #example
* identifier.type.coding = DICOMUID#110180 "Study Instance UID"
* identifier.value = "1.2.3.4.5"
* status = FHIRImagingStudyStatus#available
* modality = DICOM#CT "Computed Tomography"
* subject = Reference(Patient/ex-Patient)
* started = 2020-12-31T23:30:50-05:00
* endpoint = Reference(Endpoint/ex-IMRStudyEndpoint-Study)
* procedureCode.coding = LOINC#29252-4 "CT Chest WO Contrast"
* series.uid = "1.2.3.4.5.1"
* series.modality = DICOM#CT "Computed Tomography"


Instance: ex-ImagingStudy-Comparison
InstanceOf: IMRImagingStudy
Title: "IMR ImagingStudy example"
Description: "Simple IMR ImagingStudy to be used as a comparison study in DiagnosticReport"
Usage: #example
* identifier.type.coding = DICOMUID#110180 "Study Instance UID"
* identifier.value = "5.6.7.8.9"
* status = FHIRImagingStudyStatus#available
* modality = DICOM#CT "Computed Tomography"
* subject = Reference(Patient/ex-Patient)
* started = 2020-01-01T23:30:50-05:00
* endpoint = Reference(Endpoint/ex-IMRStudyEndpoint-Study)
* procedureCode.coding = LOINC#29252-4 "CT Chest WO Contrast"
* series.uid = "5.6.7.8.9.1"
* series.modality = DICOM#CT "Computed Tomography"