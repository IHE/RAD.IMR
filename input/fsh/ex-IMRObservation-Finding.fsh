Instance:   ex-IMRObservation-Finding
InstanceOf: IMRObservation
Title:      "IMR Observation of all findings and technique"
Description: "Example of encoding a complex clinical findings that include multiple components"
Usage: #example
* meta.security = http://terminology.hl7.org/CodeSystem/v3-ActReason#HTEST

* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* partOf = Reference(ImagingStudy/ex-ImagingStudy)
* status = FHIRObservationStatus#final
* category.coding = FHIRObservation#imaging "Imaging"
* code = LOINC#59776-5 "Procedure findings Narrative"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* method.text = "Volumetric, multidetector CT of the chest was performed without intravenous or oral contrast administration. Images are presented for display in the axial plane at 5 mm and 1.25 mm collimation. A series of multiplanar reformation images are also submitted for review."
* valueString = "The imaged portion of a thyroid gland is unremarkable. Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to <imr-ref type=\"image\" id=1>1.2 x 0.8 cm in the right paratracheal station</imr-ref>, <imr-ref type=\"image\" id=2>2.3 x 1.4 cm in the subcarinal station</imr-ref>, and <imr-ref type=\"image\" id=3>1.4 x 0.9 cm in the right hilar stations</imr-ref>. No significant axillary lymphadenopathy is detected. The esophagus is unremarkable. The thoracic aorta is normal in caliber with a typical 3 vessel takeoff from the arch. The pulmonary arterial trunk is normal in caliber. The heart is normal in size without pericardial effusion. 
 
There is focal narrowing of the proximal portion of the bronchial stent in the <imr-ref type=\"image\" id=4>left mainstem bronchus</imr-ref>, which is nearly collapsed and appears new from the prior chest radiograph. Trace fluid or debris is seen in the <imr-ref type=\"image\" id=5>distal lumen of the stent</imr-ref>. A tracheostomy tube is unchanged in position without evidence of complications. There is circumferential thickening of the tracheal and bronchial walls, which is unchanged, in keeping with the patient's known diagnosis of polychondritis. The remainder of the tracheobronchial tree is patent to the subsegmental levels. The airways are normal in caliber. 
 
Within the pulmonary parenchyma, there is diffuse peribronchovascular nodular and ground-glass opacities becoming confluent in the <imr-ref type=\"image\" id=6>right middle</imr-ref> and <imr-ref type=\"image\" id=7> left upper</imr-ref> and <imr-ref type=\"image\" id=8>lower lobes</imr-ref> consistent with multifocal pneumonia. There is a small left and trace right pleural effusion. No pneumothorax is present. There are no suspicious masses or pleural abnormalities. 
 
The patient is status post median sternotomy with intact sternal wires. No blastic or lytic lesion suspicious for malignancy is present. 
 
Although this study is not tailored for the evaluation of subdiaphragmatic contents, the imaged upper abdomen demonstrates diffuse hypoattenuation of the liver consistent with hepatic steatosis."
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/2.1/instance/6.1"
* component[=].id = "1"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/2.1/instance/18.1"
* component[=].id = "2"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/2.1/instance/16.1"
* component[=].id = "3"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/601.1/instance/56.1"
* component[=].id = "4"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/4.1/instance/71.1"
* component[=].id = "5"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/601.1/instance/52.1"
* component[=].id = "6"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/601.1/instance/65.1"
* component[=].id = "7"
* component[+].code = DICOM#112002 "Series Instance UID"
* component[=].valueString = "series/601.1/instance/72.1"
* component[=].id = "8"

// DLP
* component[+].code = DICOM#113838 "DLP"
* component[=].valueQuantity.value = 373
* component[=].valueQuantity.code = UCUM#mGy.cm "mGy.cm"
* component[=].valueQuantity.system = UCUM