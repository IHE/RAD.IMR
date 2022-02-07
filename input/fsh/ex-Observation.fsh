Instance:   ex-IMRObservation-FullParagraph
InstanceOf: IMRObservation
Title:      "IMR Observation of a full paragraph of findings"
Description: "Example of encoding a complex clinical findings that include multiple components"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(IMRServiceRequest/ex-ServceRequest)
* partOf = Reference(IMRDiagnosticReportImagingStudy/ex-DiagnosticReportImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#59776-5 "Procedure Findings"
* subject.identifier.type.coding = HL7V2#MR "Medical Record Number"
* subject.identifier.system = "http://www.acme.com/identifiers/patient"
* subject.identifier.value = "111111"
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* valueString = "The imaged portion of a thyroid gland is unremarkable. Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station (2:6), 2.3 x 1.4 cm in the subcarinal station (2:18), and 1.4 x 0.9 cm in the right hilar stations (2:16). No significant axillary lymphadenopathy is detected. The esophagus is unremarkable. The thoracic aorta is normal in caliber with a typical 3 vessel takeoff from the arch. The pulmonary arterial trunk is normal in caliber. The heart is normal in size without pericardial effusion."
* component[+].code = LOINC#59776-5 "Procedure Findings"
* component[=].valueString = "1.2 x 0.8cm in the right paratracheal station"
* component[=].extension[derivedFrom].valueReference = Reference(IMRObservationImagingStudy/ex-IMRObservationImagingStudy)
* component[+].code = LOINC#59776-5 "Procedure Findings"
* component[=].valueString = "2.3 x 1.4cm in the subcarinal station"
* component[=].extension[derivedFrom].valueReference = Reference(IMRObservationImagingStudy/ex-IMRObservationImagingStudy)
* component[+].code = LOINC#59776-5 "Procedure Findings"
* component[=].valueString = "1.4 x 0.9cm in the right hilar station"
* component[=].extension[derivedFrom].valueReference = Reference(IMRObservationImagingStudy/ex-IMRObservationImagingStudy)


Instance: ex-ServiceRequest
InstanceOf: IMRServiceRequest
Title: "IMR ServiceRequest example"
Description: "Simple IMR ServiceRequest example"
Usage: #example
* identifier.type.coding = HL7V2#ACSN "Accession ID"
* identifier.system = "http://www.acme.com/identifiers/accession"
* identifier.value = "12345"
* status = FHIRRequestStatus#completed
* intent = FHIRRequestIntent#order
* category.coding = SCT#363679005 "Imaging"
* subject.identifier.type.coding = HL7V2#MR "Medical Record Number"
* subject.identifier.system = "http://www.acme.com/identifiers/patient"
* subject.identifier.value = "111111"


Instance: ex-DiagnosticReportImagingStudy
InstanceOf: IMRDiagnosticReportImagingStudy
Title: "IMR DiagnosticReport ImagingStudy example"
Description: "Simple IMR ImagingStudy to be used in DiagnosticReport or top level Observation"
Usage: #example
* identifier.type.coding = DICOM#110180 "Study Instance UID"
* identifier.value = "1.2.3.4.5"
* status = FHIRImagingStudyStatus#available
* subject.identifier.type.coding = HL7V2#MR "Medical Record Number"
* subject.identifier.system = "http://www.acme.com/identifiers/patient"
* subject.identifier.value = "111111"
* endpoint = Reference(IMRStudyEndpoint/ex-ImagingStudyEndpoint)


Instance: ex-ObservationImagingStudy
InstanceOf: IMRObservationImagingStudy
Title: "IMR Observation ImagingStudy example"
Description: "Simple IMR ImagingStudy to be used in Observation derivedFrom or component.derivedFrom extension"
Usage: #example
* identifier.type.coding = DICOM#110180 "Study Instance UID"
* identifier.value = "1.2.3.4.5"
* status = FHIRImagingStudyStatus#available
* subject.identifier.type.coding = HL7V2#MR "Medical Record Number"
* subject.identifier.system = "http://www.acme.com/identifiers/patient"
* subject.identifier.value = "111111"
* endpoint = Reference(IMRStudyEndpoint/ex-ImagingStudyEndpoint)
* series.endpoint = Reference(IMRStudyEndpoint/ex-ImagingStudyEndpoint)
* series.uid = "2.16.124.113543.6003.2588828330.45298.17418.2723805630"
* series.modality = DICOM#CT "CT"
* series.instance.uid = "2.16.124.113543.6003.2588828330.45298.17418.2723805630.1"
* series.instance.sopClass = DICOM#1.2.840.10008.5.1.4.1.1.2 "CT Image Storage"



Instance: ex-ImagingStudyEndpoint
InstanceOf: IMRStudyEndpoint
Title: "IMR ImagingStudy Endpoint example"
Description: "Simple IMR Study Endpoint to be used in DiagnosticReport"
Usage: #example
* connectionType = FHIREndpoint#dicom-wado-rs "DICOM WADO-RS"
* payloadType.coding = DICOM#113014 "Study"
* address = "http://my.example.com/wado/study/1.2.3.4.5/series/11.22.33.44.55"
* status = FHIREndpointStatus#active