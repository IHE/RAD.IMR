Instance: ex-DiagnosticReport
InstanceOf: IMRDiagnosticReport
Title: "IMR DiagnosticReport example"
Description: """
This example uses IMR DiagnosticReport to capture the following real world radiology diagnostic report.

--- SAMPLE REPORT ---

Patient Name: John Smith 

MRN: 1234567

Accession Number: 12345

Study Date: December 31, 2020

Study Type: CT CHEST W/O CONTRAST

------------------------------------------------------------ 

FULL REPORT

EXAMINATION: CT CHEST W/O CONTRAST
 
INDICATION: History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am 
 
TECHNIQUE: Volumetric, multidetector CT of the chest was performed without intravenous or oral contrast administration. Images are presented for display in the axial plane at 5 mm and 1.25 mm collimation. A series of multiplanar reformation images are also submitted for review. 
 
DLP: 373 mGy-cm. 
 
COMPARISON: CT of the chest dated January 1, 2020. 
 
FINDINGS:  
 
The imaged portion of a thyroid gland is unremarkable. Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station (2:12) , 2.3 x 1.4 cm in the subcarinal station (2:18), and 1.4 x 0.9 cm in the right hilar stations (2:16). No significant axillary lymphadenopathy is detected. The esophagus is unremarkable. The thoracic aorta is normal in caliber with a typical 3 vessel takeoff from the arch. The pulmonary arterial trunk is normal in caliber. The heart is normal in size without pericardial effusion. 
 
There is focal narrowing of the proximal portion of the bronchial stent in the left mainstem bronchus (601b:56), which is nearly collapsed and appears new from the prior chest radiograph. Trace fluid or debris is seen in the distal lumen of the stent (4:71). A tracheostomy tube is unchanged in position without evidence of complications. There is circumferential thickening of the tracheal and bronchial walls, which is unchanged, in keeping with the patient's known diagnosis of polychondritis. The remainder of the tracheobronchial tree is patent to the subsegmental levels. The airways are normal in caliber. 
 
Within the pulmonary parenchyma, there is diffuse peribronchovascular nodular and ground-glass opacities becoming confluent in the right middle (601:52) and left upper (601:65) and lower lobes (601:72) consistent with multifocal pneumonia. There is a small left and trace right pleural effusion. No pneumothorax is present. There are no suspicious masses or pleural abnormalities. 
 
The patient is status post median sternotomy with intact sternal wires. No blastic or lytic lesion suspicious for malignancy is present. 
 
Although this study is not tailored for the evaluation of subdiaphragmatic contents, the imaged upper abdomen demonstrates diffuse hypoattenuation of the liver consistent with hepatic steatosis. 

 
IMPRESSION:  
 
1. Multifocal pneumonia involving the right middle, left upper and left lower lobes with small left and trace right pleural effusions. 
 
2. Central medianstinal lymphadenopathy is likely reactive. 
 
3. Focal stenosis of the proximal portion of the left main stem bronchial stent, which appears new from the prior chest radiograph. There is trace fluid or debris within the distal lumen of the stent. 
 
4. Unchanged circumferential thickening of the tracheal and bronchial walls, in keeping with the patient's known diagnosis of polychondritis. 
 
5. Hepatic steatosis.
"""
Usage: #example
* text.status = FHIRNarrativeStatus#additional "Additional"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
<h2><span title=\"Codes: {http://loinc.org 29252-4}\">CT Chest WO Contrast</span> (<span title=\"Codes: {http://terminology.hl7.org/CodeSystem/v2-0074 RAD}\">Radiology</span>)</h2>

<table class=\"grid\">
<tr><td>Subject</td><td><b>John Smith </b> (no stated gender), DoB Unknown ( Medical Record Number: 1234567)</td></tr>
<tr><td>When For</td><td>2020-12-31 11:50:50-0500</td></tr>
<tr><td>Reported</td><td>2020-12-31 11:55:50-0500</td></tr>
</table>

<p></p><b>Report Details</b>

<div>INDICATION: History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am</div>
<p></p>
<div>TECHNIQUE: Volumetric, multidetector CT of the chest was performed without intravenous or oral contrast administration. Images are presented for display in the axial plane at 5 mm and 1.25 mm collimation. A series of multiplanar reformation images are also submitted for review.</div>
<p></p>
<div>DLP: 373 mGy-cm.</div>
<p></p>
<h2>FINDINGS:</h2>
<div>The imaged portion of a thyroid gland is unremarkable. Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station (2:12) , 2.3 x 1.4 cm in the subcarinal station (2:18), and 1.4 x 0.9 cm in the right hilar stations (2:16). No significant axillary lymphadenopathy is detected. The esophagus is unremarkable. The thoracic aorta is normal in caliber with a typical 3 vessel takeoff from the arch. The pulmonary arterial trunk is normal in caliber. The heart is normal in size without pericardial effusion.</div>
<p></p>
<div>There is focal narrowing of the proximal portion of the bronchial stent in the left mainstem bronchus (601b:56), which is nearly collapsed and appears new from the prior chest radiograph. Trace fluid or debris is seen in the distal lumen of the stent (4:71). A tracheostomy tube is unchanged in position without evidence of complications. There is circumferential thickening of the tracheal and bronchial walls, which is unchanged, in keeping with the patient's known diagnosis of polychondritis. The remainder of the tracheobronchial tree is patent to the subsegmental levels. The airways are normal in caliber.</div>
<p></p>
<div>Within the pulmonary parenchyma, there is diffuse peribronchovascular nodular and ground-glass opacities becoming confluent in the right middle (601:52) and left upper (601:65) and lower lobes (601:72) consistent with multifocal pneumonia. There is a small left and trace right pleural effusion. No pneumothorax is present. There are no suspicious masses or pleural abnormalities.</div>
<p></p>
<div>The patient is status post median sternotomy with intact sternal wires. No blastic or lytic lesion suspicious for malignancy is present.</div>
<p></p>
<div>Although this study is not tailored for the evaluation of subdiaphragmatic contents, the imaged upper abdomen demonstrates diffuse hypoattenuation of the liver consistent with hepatic steatosis.</div>
<p></p>

<h2>IMPRESSION:</h2>
<ol>
<li>Multifocal pneumonia involving the right middle, left upper and left lower lobes with small left and trace right pleural effusions.</li>

<li>Central medianstinal lymphadenopathy is likely reactive.</li>
 
<li>Focal stenosis of the proximal portion of the left main stem bronchial stent, which appears new from the prior chest radiograph. There is trace fluid or debris within the distal lumen of the stent.</li>
 
<li>Unchanged circumferential thickening of the tracheal and bronchial walls, in keeping with the patient's known diagnosis of polychondritis.</li>
 
<li>Hepatic steatosis.</li>
</ol>
</div>"
* basedOn = Reference(ServiceRequest/ex-ServiceRequest)
* status = FHIRDiagnosticReportStatus#final "Final"
* category = FHIRDiagnosticService#RAD "Radiology"
* code = LOINC#29252-4 "CT Chest WO Contrast"
* subject = Reference(Patient/ex-Patient)
* effectiveDateTime = 2020-12-31T23:50:50-05:00
* issued = 2020-12-31T23:55:50-05:00
* performer = Reference(Organization/ex-Organization)
* resultsInterpreter = Reference(Practitioner/ex-Practitioner)
* result[0] = Reference(Observation/ex-IMRObservation-Finding)
* result[1] = Reference(Observation/ex-IMRObservation-Impression-1)
* result[2] = Reference(Observation/ex-IMRObservation-Impression-2)
* result[3] = Reference(Observation/ex-IMRObservation-Impression-3)
* result[4] = Reference(Observation/ex-IMRObservation-Impression-4)
* result[5] = Reference(Observation/ex-IMRObservation-Impression-5)
* imagingStudy = Reference(ImagingStudy/ex-ImagingStudy)
* extension[associatedStudy].valueCodeableReference.reference = Reference(ImagingStudy/ex-ImagingStudy-Comparison)
// * extension[indication].valueString = "History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am"
* presentedForm.data = "VGhpcyBpcyBhIHNhbXBsZQ=="
* presentedForm.contentType = MIME#text/html "HTML"
* presentedForm.hash = "25DF2D14B7A81BF0582323E1B337E9EE03C03C10"
* presentedForm.size = 16

Instance: ex-Organization
InstanceOf: Organization
Title: "Organization example"
Description: "Simple Organization to be used in DiagnosticReport"
Usage: #example
* name = "YourHospital"


Instance: ex-Practitioner
InstanceOf: Practitioner
Title: "Practitioner example"
Description: "Simple Practitioner to be used in DiagnosticReport"
Usage: #example
* name.family = "Guy"
* name.given = "Funny"

