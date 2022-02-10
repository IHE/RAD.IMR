Instance:   ex-IMRObservation-Impression-1
InstanceOf: IMRObservation
Title:      "IMR Observation of Impression 1"
Description: "Example of encoding an impression as text"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* partOf = Reference(ImagingStudy/ex-ImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* valueString = "Multifocal pneumonia involving the right middle, left upper and left lower lobes with small left and trace right pleural effusions."

Instance:   ex-IMRObservation-Impression-2
InstanceOf: IMRObservation
Title:      "IMR Observation of Impression 2"
Description: "Example of encoding an impression as text"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* partOf = Reference(ImagingStudy/ex-ImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* valueString = "Central medianstinal lymphadenopathy is likely reactive."

Instance:   ex-IMRObservation-Impression-3
InstanceOf: IMRObservation
Title:      "IMR Observation of Impression 3"
Description: "Example of encoding an impression as text"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* partOf = Reference(ImagingStudy/ex-ImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* valueString = "Focal stenosis of the proximal portion of the left main stem bronchial stent, which appears new from the prior chest radiograph. There is trace fluid or debris within the distal lumen of the stent."


Instance:   ex-IMRObservation-Impression-4
InstanceOf: IMRObservation
Title:      "IMR Observation of Impression 4"
Description: "Example of encoding an impression as text"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* partOf = Reference(ImagingStudy/ex-ImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* valueString = "Unchanged circumferential thickening of the tracheal and bronchial walls, in keeping with the patient's known diagnosis of polychondritis."



Instance:   ex-IMRObservation-Impression-5
InstanceOf: IMRObservation
Title:      "IMR Observation of Impression 5"
Description: "Example of encoding an impression as text"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* partOf = Reference(ImagingStudy/ex-ImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#19005-8 "Radiology Imaging study [Impression] (narrative)"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* valueString = "Hepatic steatosis."