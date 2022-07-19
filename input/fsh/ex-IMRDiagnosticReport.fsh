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
<div>INDICATION: History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am</div>
<p></p>
<div>TECHNIQUE: Volumetric, multidetector CT of the chest was performed without intravenous or oral contrast administration. Images are presented for display in the axial plane at 5 mm and 1.25 mm collimation. A series of multiplanar reformation images are also submitted for review.</div>
<p></p>
<div>DLP: 373 mGy-cm.</div>
<p></p>
<h2>FINDINGS:</h2>
<div>The imaged portion of a thyroid gland is unremarkable. Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/123\">(2:12)</span>, 2.3 x 1.4 cm in the subcarinal station <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/234\">(2:18)</span>, and 1.4 x 0.9 cm in the right hilar stations <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/345\">(2:16)</span>. No significant axillary lymphadenopathy is detected. The esophagus is unremarkable. The thoracic aorta is normal in caliber with a typical 3 vessel takeoff from the arch. The pulmonary arterial trunk is normal in caliber. The heart is normal in size without pericardial effusion.</div>
<p></p>
<div>There is focal narrowing of the proximal portion of the bronchial stent in the left mainstem bronchus (601b:56), which is nearly collapsed and appears new from the prior chest radiograph. Trace fluid or debris is seen in the distal lumen of the stent <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/456\">(4:71)</span>. A tracheostomy tube is unchanged in position without evidence of complications. There is circumferential thickening of the tracheal and bronchial walls, which is unchanged, in keeping with the patient's known diagnosis of polychondritis. The remainder of the tracheobronchial tree is patent to the subsegmental levels. The airways are normal in caliber.</div>
<p></p>
<div>Within the pulmonary parenchyma, there is diffuse peribronchovascular nodular and ground-glass opacities becoming confluent in the right middle <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/567\">(601:52)</span> and left upper <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/678\">(601:65)</span> and lower lobes <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/789\">(601:72)</span> consistent with multifocal pneumonia. There is a small left and trace right pleural effusion. No pneumothorax is present. There are no suspicious masses or pleural abnormalities.</div>
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
* imagingStudy = Reference(ImagingStudy/ex-ImagingStudy)
// FHIR 5.0.0 changes
// * extension[associatedStudy].valueCodeableReference.reference = Reference(ImagingStudy/ex-ImagingStudy-Comparison)
* extension[associatedStudy].valueReference = Reference(ImagingStudy/ex-ImagingStudy-Comparison)
* presentedForm[html].data = "PGh0bWw+Cjxib2R5Pgo8ZGl2IHhtbG5zPVwiaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbFwiPgoKPHRhYmxlIGNsYXNzPVwiZ3JpZFwiPgo8dHI+PHRkPlBhdGllbnQgTmFtZTo8L3RkPjx0ZD48Yj5Kb2huIFNtaXRoPC9iPjwvdGQ+PC90cj4KPHRyPjx0ZD5NUk46PC90ZD48dGQ+MTIzNDU2NzwvdGQ+PC90cj4KPHRyPjx0ZD5BY2Nlc3Npb24gTnVtYmVyOjwvdGQ+PHRkPjEyMzQ1PC90ZD48L3RyPgo8dHI+PHRkPlN0dWR5IERhdGU6PC90ZD48dGQ+MjAyMC0xMi0zMSAxMTo1MDo1MC0wNTAwPC90ZD48L3RyPgo8dHI+PHRkPlN0dWR5IFR5cGU6PC90ZD48dGQ+Q1QgQ2hlc3QgV08gQ29udHJhc3Q8L3RkPjwvdHI+CjwvdGFibGU+Cgo8aHI+PC9ocj4KCjxkaXY+SU5ESUNBVElPTjogSGlzdG9yeTogMjRNIHdpdGggc3RlbnQgcGxhY2VtZW50IGluIHRoZSBsZWZ0IG1haW4gYnJvbmNodXMgcHJlc2VudHMgd2l0aCByaWdodCBzaWRlZCBjaGVzdCBwYWluIHNpbmNlIDlhbTwvZGl2Pgo8cD48L3A+CjxkaXY+VEVDSE5JUVVFOiBWb2x1bWV0cmljLCBtdWx0aWRldGVjdG9yIENUIG9mIHRoZSBjaGVzdCB3YXMgcGVyZm9ybWVkIHdpdGhvdXQgaW50cmF2ZW5vdXMgb3Igb3JhbCBjb250cmFzdCBhZG1pbmlzdHJhdGlvbi4gSW1hZ2VzIGFyZSBwcmVzZW50ZWQgZm9yIGRpc3BsYXkgaW4gdGhlIGF4aWFsIHBsYW5lIGF0IDUgbW0gYW5kIDEuMjUgbW0gY29sbGltYXRpb24uIEEgc2VyaWVzIG9mIG11bHRpcGxhbmFyIHJlZm9ybWF0aW9uIGltYWdlcyBhcmUgYWxzbyBzdWJtaXR0ZWQgZm9yIHJldmlldy48L2Rpdj4KPHA+PC9wPgo8ZGl2PkRMUDogMzczIG1HeS1jbS48L2Rpdj4KPHA+PC9wPgo8aDI+RklORElOR1M6PC9oMj4KPGRpdj5UaGUgaW1hZ2VkIHBvcnRpb24gb2YgYSB0aHlyb2lkIGdsYW5kIGlzIHVucmVtYXJrYWJsZS4gUHJvbWluZW50IG9yIG1pbGRseSBlbmxhcmdlZCBtZWRpYXN0aW5hbCBhbmQgYmlsYXRlcmFsIGhpbGFyIGx5bXBoIG5vZGVzIG1lYXN1cmUgdXAgdG8gMS4yIHggMC44IGNtIGluIHRoZSByaWdodCBwYXJhdHJhY2hlYWwgc3RhdGlvbiAoMjoxMiksIDIuMyB4IDEuNCBjbSBpbiB0aGUgc3ViY2FyaW5hbCBzdGF0aW9uICgyOjE4KSwgYW5kIDEuNCB4IDAuOSBjbSBpbiB0aGUgcmlnaHQgaGlsYXIgc3RhdGlvbnMgKDI6MTYpLiBObyBzaWduaWZpY2FudCBheGlsbGFyeSBseW1waGFkZW5vcGF0aHkgaXMgZGV0ZWN0ZWQuIFRoZSBlc29waGFndXMgaXMgdW5yZW1hcmthYmxlLiBUaGUgdGhvcmFjaWMgYW9ydGEgaXMgbm9ybWFsIGluIGNhbGliZXIgd2l0aCBhIHR5cGljYWwgMyB2ZXNzZWwgdGFrZW9mZiBmcm9tIHRoZSBhcmNoLiBUaGUgcHVsbW9uYXJ5IGFydGVyaWFsIHRydW5rIGlzIG5vcm1hbCBpbiBjYWxpYmVyLiBUaGUgaGVhcnQgaXMgbm9ybWFsIGluIHNpemUgd2l0aG91dCBwZXJpY2FyZGlhbCBlZmZ1c2lvbi48L2Rpdj4KPHA+PC9wPgo8ZGl2PlRoZXJlIGlzIGZvY2FsIG5hcnJvd2luZyBvZiB0aGUgcHJveGltYWwgcG9ydGlvbiBvZiB0aGUgYnJvbmNoaWFsIHN0ZW50IGluIHRoZSBsZWZ0IG1haW5zdGVtIGJyb25jaHVzICg2MDFiOjU2KSwgd2hpY2ggaXMgbmVhcmx5IGNvbGxhcHNlZCBhbmQgYXBwZWFycyBuZXcgZnJvbSB0aGUgcHJpb3IgY2hlc3QgcmFkaW9ncmFwaC4gVHJhY2UgZmx1aWQgb3IgZGVicmlzIGlzIHNlZW4gaW4gdGhlIGRpc3RhbCBsdW1lbiBvZiB0aGUgc3RlbnQgKDQ6NzEpLiBBIHRyYWNoZW9zdG9teSB0dWJlIGlzIHVuY2hhbmdlZCBpbiBwb3NpdGlvbiB3aXRob3V0IGV2aWRlbmNlIG9mIGNvbXBsaWNhdGlvbnMuIFRoZXJlIGlzIGNpcmN1bWZlcmVudGlhbCB0aGlja2VuaW5nIG9mIHRoZSB0cmFjaGVhbCBhbmQgYnJvbmNoaWFsIHdhbGxzLCB3aGljaCBpcyB1bmNoYW5nZWQsIGluIGtlZXBpbmcgd2l0aCB0aGUgcGF0aWVudCdzIGtub3duIGRpYWdub3NpcyBvZiBwb2x5Y2hvbmRyaXRpcy4gVGhlIHJlbWFpbmRlciBvZiB0aGUgdHJhY2hlb2Jyb25jaGlhbCB0cmVlIGlzIHBhdGVudCB0byB0aGUgc3Vic2VnbWVudGFsIGxldmVscy4gVGhlIGFpcndheXMgYXJlIG5vcm1hbCBpbiBjYWxpYmVyLjwvZGl2Pgo8cD48L3A+CjxkaXY+V2l0aGluIHRoZSBwdWxtb25hcnkgcGFyZW5jaHltYSwgdGhlcmUgaXMgZGlmZnVzZSBwZXJpYnJvbmNob3Zhc2N1bGFyIG5vZHVsYXIgYW5kIGdyb3VuZC1nbGFzcyBvcGFjaXRpZXMgYmVjb21pbmcgY29uZmx1ZW50IGluIHRoZSByaWdodCBtaWRkbGUgKDYwMTo1MikgYW5kIGxlZnQgdXBwZXIgKDYwMTo2NSkgYW5kIGxvd2VyIGxvYmVzICg2MDE6NzIpIGNvbnNpc3RlbnQgd2l0aCBtdWx0aWZvY2FsIHBuZXVtb25pYS4gVGhlcmUgaXMgYSBzbWFsbCBsZWZ0IGFuZCB0cmFjZSByaWdodCBwbGV1cmFsIGVmZnVzaW9uLiBObyBwbmV1bW90aG9yYXggaXMgcHJlc2VudC4gVGhlcmUgYXJlIG5vIHN1c3BpY2lvdXMgbWFzc2VzIG9yIHBsZXVyYWwgYWJub3JtYWxpdGllcy48L2Rpdj4KPHA+PC9wPgo8ZGl2PlRoZSBwYXRpZW50IGlzIHN0YXR1cyBwb3N0IG1lZGlhbiBzdGVybm90b215IHdpdGggaW50YWN0IHN0ZXJuYWwgd2lyZXMuIE5vIGJsYXN0aWMgb3IgbHl0aWMgbGVzaW9uIHN1c3BpY2lvdXMgZm9yIG1hbGlnbmFuY3kgaXMgcHJlc2VudC48L2Rpdj4KPHA+PC9wPgo8ZGl2PkFsdGhvdWdoIHRoaXMgc3R1ZHkgaXMgbm90IHRhaWxvcmVkIGZvciB0aGUgZXZhbHVhdGlvbiBvZiBzdWJkaWFwaHJhZ21hdGljIGNvbnRlbnRzLCB0aGUgaW1hZ2VkIHVwcGVyIGFiZG9tZW4gZGVtb25zdHJhdGVzIGRpZmZ1c2UgaHlwb2F0dGVudWF0aW9uIG9mIHRoZSBsaXZlciBjb25zaXN0ZW50IHdpdGggaGVwYXRpYyBzdGVhdG9zaXMuPC9kaXY+CjxwPjwvcD4KCjxoMj5JTVBSRVNTSU9OOjwvaDI+CjxvbD4KPGxpPk11bHRpZm9jYWwgcG5ldW1vbmlhIGludm9sdmluZyB0aGUgcmlnaHQgbWlkZGxlLCBsZWZ0IHVwcGVyIGFuZCBsZWZ0IGxvd2VyIGxvYmVzIHdpdGggc21hbGwgbGVmdCBhbmQgdHJhY2UgcmlnaHQgcGxldXJhbCBlZmZ1c2lvbnMuPC9saT4KCjxsaT5DZW50cmFsIG1lZGlhbnN0aW5hbCBseW1waGFkZW5vcGF0aHkgaXMgbGlrZWx5IHJlYWN0aXZlLjwvbGk+CiAKPGxpPkZvY2FsIHN0ZW5vc2lzIG9mIHRoZSBwcm94aW1hbCBwb3J0aW9uIG9mIHRoZSBsZWZ0IG1haW4gc3RlbSBicm9uY2hpYWwgc3RlbnQsIHdoaWNoIGFwcGVhcnMgbmV3IGZyb20gdGhlIHByaW9yIGNoZXN0IHJhZGlvZ3JhcGguIFRoZXJlIGlzIHRyYWNlIGZsdWlkIG9yIGRlYnJpcyB3aXRoaW4gdGhlIGRpc3RhbCBsdW1lbiBvZiB0aGUgc3RlbnQuPC9saT4KIAo8bGk+VW5jaGFuZ2VkIGNpcmN1bWZlcmVudGlhbCB0aGlja2VuaW5nIG9mIHRoZSB0cmFjaGVhbCBhbmQgYnJvbmNoaWFsIHdhbGxzLCBpbiBrZWVwaW5nIHdpdGggdGhlIHBhdGllbnQncyBrbm93biBkaWFnbm9zaXMgb2YgcG9seWNob25kcml0aXMuPC9saT4KIAo8bGk+SGVwYXRpYyBzdGVhdG9zaXMuPC9saT4KPC9vbD4KPC9kaXY+CjwvYm9keT4KPC9odG1sPg=="
* presentedForm[html].contentType = MIME#text/html "HTML"
* presentedForm[html].hash = "4ED94777DD88C61F3A4D2C50DE6D92E8E53EE5CA"
* presentedForm[html].size = 3514

Instance: ex-DiagnosticReport-Using-Observation
InstanceOf: IMRDiagnosticReport
Title: "(Experimental) IMR DiagnosticReport example with experimental IMR Observation"
Description: """
This example uses IMR DiagnosticReport to capture the same real world radiology diagnostic report,
with the addition of using the experimental IMR Observation to capture findings and impressions.
"""
Usage: #example
* text.status = FHIRNarrativeStatus#additional "Additional"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">
<div>INDICATION: History: 24M with stent placement in the left main bronchus presents with right sided chest pain since 9am</div>
<p></p>
<div>TECHNIQUE: Volumetric, multidetector CT of the chest was performed without intravenous or oral contrast administration. Images are presented for display in the axial plane at 5 mm and 1.25 mm collimation. A series of multiplanar reformation images are also submitted for review.</div>
<p></p>
<div>DLP: 373 mGy-cm.</div>
<p></p>
<h2>FINDINGS:</h2>
<div>The imaged portion of a thyroid gland is unremarkable. Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/123\">(2:12)</span>, 2.3 x 1.4 cm in the subcarinal station <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/234\">(2:18)</span>, and 1.4 x 0.9 cm in the right hilar stations <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/345\">(2:16)</span>. No significant axillary lymphadenopathy is detected. The esophagus is unremarkable. The thoracic aorta is normal in caliber with a typical 3 vessel takeoff from the arch. The pulmonary arterial trunk is normal in caliber. The heart is normal in size without pericardial effusion.</div>
<p></p>
<div>There is focal narrowing of the proximal portion of the bronchial stent in the left mainstem bronchus (601b:56), which is nearly collapsed and appears new from the prior chest radiograph. Trace fluid or debris is seen in the distal lumen of the stent <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/456\">(4:71)</span>. A tracheostomy tube is unchanged in position without evidence of complications. There is circumferential thickening of the tracheal and bronchial walls, which is unchanged, in keeping with the patient's known diagnosis of polychondritis. The remainder of the tracheobronchial tree is patent to the subsegmental levels. The airways are normal in caliber.</div>
<p></p>
<div>Within the pulmonary parenchyma, there is diffuse peribronchovascular nodular and ground-glass opacities becoming confluent in the right middle <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/567\">(601:52)</span> and left upper <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/678\">(601:65)</span> and lower lobes <span class=\"imr-ref-ImagingSelection\" id=\"ImagingSelection/789\">(601:72)</span> consistent with multifocal pneumonia. There is a small left and trace right pleural effusion. No pneumothorax is present. There are no suspicious masses or pleural abnormalities.</div>
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
// FHIR 5.0.0 changes
// * extension[associatedStudy].valueCodeableReference.reference = Reference(ImagingStudy/ex-ImagingStudy-Comparison)
* extension[associatedStudy].valueReference = Reference(ImagingStudy/ex-ImagingStudy-Comparison)
* presentedForm[html].data = "PGh0bWw+Cjxib2R5Pgo8ZGl2IHhtbG5zPVwiaHR0cDovL3d3dy53My5vcmcvMTk5OS94aHRtbFwiPgoKPHRhYmxlIGNsYXNzPVwiZ3JpZFwiPgo8dHI+PHRkPlBhdGllbnQgTmFtZTo8L3RkPjx0ZD48Yj5Kb2huIFNtaXRoPC9iPjwvdGQ+PC90cj4KPHRyPjx0ZD5NUk46PC90ZD48dGQ+MTIzNDU2NzwvdGQ+PC90cj4KPHRyPjx0ZD5BY2Nlc3Npb24gTnVtYmVyOjwvdGQ+PHRkPjEyMzQ1PC90ZD48L3RyPgo8dHI+PHRkPlN0dWR5IERhdGU6PC90ZD48dGQ+MjAyMC0xMi0zMSAxMTo1MDo1MC0wNTAwPC90ZD48L3RyPgo8dHI+PHRkPlN0dWR5IFR5cGU6PC90ZD48dGQ+Q1QgQ2hlc3QgV08gQ29udHJhc3Q8L3RkPjwvdHI+CjwvdGFibGU+Cgo8aHI+PC9ocj4KCjxkaXY+SU5ESUNBVElPTjogSGlzdG9yeTogMjRNIHdpdGggc3RlbnQgcGxhY2VtZW50IGluIHRoZSBsZWZ0IG1haW4gYnJvbmNodXMgcHJlc2VudHMgd2l0aCByaWdodCBzaWRlZCBjaGVzdCBwYWluIHNpbmNlIDlhbTwvZGl2Pgo8cD48L3A+CjxkaXY+VEVDSE5JUVVFOiBWb2x1bWV0cmljLCBtdWx0aWRldGVjdG9yIENUIG9mIHRoZSBjaGVzdCB3YXMgcGVyZm9ybWVkIHdpdGhvdXQgaW50cmF2ZW5vdXMgb3Igb3JhbCBjb250cmFzdCBhZG1pbmlzdHJhdGlvbi4gSW1hZ2VzIGFyZSBwcmVzZW50ZWQgZm9yIGRpc3BsYXkgaW4gdGhlIGF4aWFsIHBsYW5lIGF0IDUgbW0gYW5kIDEuMjUgbW0gY29sbGltYXRpb24uIEEgc2VyaWVzIG9mIG11bHRpcGxhbmFyIHJlZm9ybWF0aW9uIGltYWdlcyBhcmUgYWxzbyBzdWJtaXR0ZWQgZm9yIHJldmlldy48L2Rpdj4KPHA+PC9wPgo8ZGl2PkRMUDogMzczIG1HeS1jbS48L2Rpdj4KPHA+PC9wPgo8aDI+RklORElOR1M6PC9oMj4KPGRpdj5UaGUgaW1hZ2VkIHBvcnRpb24gb2YgYSB0aHlyb2lkIGdsYW5kIGlzIHVucmVtYXJrYWJsZS4gUHJvbWluZW50IG9yIG1pbGRseSBlbmxhcmdlZCBtZWRpYXN0aW5hbCBhbmQgYmlsYXRlcmFsIGhpbGFyIGx5bXBoIG5vZGVzIG1lYXN1cmUgdXAgdG8gMS4yIHggMC44IGNtIGluIHRoZSByaWdodCBwYXJhdHJhY2hlYWwgc3RhdGlvbiAoMjoxMiksIDIuMyB4IDEuNCBjbSBpbiB0aGUgc3ViY2FyaW5hbCBzdGF0aW9uICgyOjE4KSwgYW5kIDEuNCB4IDAuOSBjbSBpbiB0aGUgcmlnaHQgaGlsYXIgc3RhdGlvbnMgKDI6MTYpLiBObyBzaWduaWZpY2FudCBheGlsbGFyeSBseW1waGFkZW5vcGF0aHkgaXMgZGV0ZWN0ZWQuIFRoZSBlc29waGFndXMgaXMgdW5yZW1hcmthYmxlLiBUaGUgdGhvcmFjaWMgYW9ydGEgaXMgbm9ybWFsIGluIGNhbGliZXIgd2l0aCBhIHR5cGljYWwgMyB2ZXNzZWwgdGFrZW9mZiBmcm9tIHRoZSBhcmNoLiBUaGUgcHVsbW9uYXJ5IGFydGVyaWFsIHRydW5rIGlzIG5vcm1hbCBpbiBjYWxpYmVyLiBUaGUgaGVhcnQgaXMgbm9ybWFsIGluIHNpemUgd2l0aG91dCBwZXJpY2FyZGlhbCBlZmZ1c2lvbi48L2Rpdj4KPHA+PC9wPgo8ZGl2PlRoZXJlIGlzIGZvY2FsIG5hcnJvd2luZyBvZiB0aGUgcHJveGltYWwgcG9ydGlvbiBvZiB0aGUgYnJvbmNoaWFsIHN0ZW50IGluIHRoZSBsZWZ0IG1haW5zdGVtIGJyb25jaHVzICg2MDFiOjU2KSwgd2hpY2ggaXMgbmVhcmx5IGNvbGxhcHNlZCBhbmQgYXBwZWFycyBuZXcgZnJvbSB0aGUgcHJpb3IgY2hlc3QgcmFkaW9ncmFwaC4gVHJhY2UgZmx1aWQgb3IgZGVicmlzIGlzIHNlZW4gaW4gdGhlIGRpc3RhbCBsdW1lbiBvZiB0aGUgc3RlbnQgKDQ6NzEpLiBBIHRyYWNoZW9zdG9teSB0dWJlIGlzIHVuY2hhbmdlZCBpbiBwb3NpdGlvbiB3aXRob3V0IGV2aWRlbmNlIG9mIGNvbXBsaWNhdGlvbnMuIFRoZXJlIGlzIGNpcmN1bWZlcmVudGlhbCB0aGlja2VuaW5nIG9mIHRoZSB0cmFjaGVhbCBhbmQgYnJvbmNoaWFsIHdhbGxzLCB3aGljaCBpcyB1bmNoYW5nZWQsIGluIGtlZXBpbmcgd2l0aCB0aGUgcGF0aWVudCdzIGtub3duIGRpYWdub3NpcyBvZiBwb2x5Y2hvbmRyaXRpcy4gVGhlIHJlbWFpbmRlciBvZiB0aGUgdHJhY2hlb2Jyb25jaGlhbCB0cmVlIGlzIHBhdGVudCB0byB0aGUgc3Vic2VnbWVudGFsIGxldmVscy4gVGhlIGFpcndheXMgYXJlIG5vcm1hbCBpbiBjYWxpYmVyLjwvZGl2Pgo8cD48L3A+CjxkaXY+V2l0aGluIHRoZSBwdWxtb25hcnkgcGFyZW5jaHltYSwgdGhlcmUgaXMgZGlmZnVzZSBwZXJpYnJvbmNob3Zhc2N1bGFyIG5vZHVsYXIgYW5kIGdyb3VuZC1nbGFzcyBvcGFjaXRpZXMgYmVjb21pbmcgY29uZmx1ZW50IGluIHRoZSByaWdodCBtaWRkbGUgKDYwMTo1MikgYW5kIGxlZnQgdXBwZXIgKDYwMTo2NSkgYW5kIGxvd2VyIGxvYmVzICg2MDE6NzIpIGNvbnNpc3RlbnQgd2l0aCBtdWx0aWZvY2FsIHBuZXVtb25pYS4gVGhlcmUgaXMgYSBzbWFsbCBsZWZ0IGFuZCB0cmFjZSByaWdodCBwbGV1cmFsIGVmZnVzaW9uLiBObyBwbmV1bW90aG9yYXggaXMgcHJlc2VudC4gVGhlcmUgYXJlIG5vIHN1c3BpY2lvdXMgbWFzc2VzIG9yIHBsZXVyYWwgYWJub3JtYWxpdGllcy48L2Rpdj4KPHA+PC9wPgo8ZGl2PlRoZSBwYXRpZW50IGlzIHN0YXR1cyBwb3N0IG1lZGlhbiBzdGVybm90b215IHdpdGggaW50YWN0IHN0ZXJuYWwgd2lyZXMuIE5vIGJsYXN0aWMgb3IgbHl0aWMgbGVzaW9uIHN1c3BpY2lvdXMgZm9yIG1hbGlnbmFuY3kgaXMgcHJlc2VudC48L2Rpdj4KPHA+PC9wPgo8ZGl2PkFsdGhvdWdoIHRoaXMgc3R1ZHkgaXMgbm90IHRhaWxvcmVkIGZvciB0aGUgZXZhbHVhdGlvbiBvZiBzdWJkaWFwaHJhZ21hdGljIGNvbnRlbnRzLCB0aGUgaW1hZ2VkIHVwcGVyIGFiZG9tZW4gZGVtb25zdHJhdGVzIGRpZmZ1c2UgaHlwb2F0dGVudWF0aW9uIG9mIHRoZSBsaXZlciBjb25zaXN0ZW50IHdpdGggaGVwYXRpYyBzdGVhdG9zaXMuPC9kaXY+CjxwPjwvcD4KCjxoMj5JTVBSRVNTSU9OOjwvaDI+CjxvbD4KPGxpPk11bHRpZm9jYWwgcG5ldW1vbmlhIGludm9sdmluZyB0aGUgcmlnaHQgbWlkZGxlLCBsZWZ0IHVwcGVyIGFuZCBsZWZ0IGxvd2VyIGxvYmVzIHdpdGggc21hbGwgbGVmdCBhbmQgdHJhY2UgcmlnaHQgcGxldXJhbCBlZmZ1c2lvbnMuPC9saT4KCjxsaT5DZW50cmFsIG1lZGlhbnN0aW5hbCBseW1waGFkZW5vcGF0aHkgaXMgbGlrZWx5IHJlYWN0aXZlLjwvbGk+CiAKPGxpPkZvY2FsIHN0ZW5vc2lzIG9mIHRoZSBwcm94aW1hbCBwb3J0aW9uIG9mIHRoZSBsZWZ0IG1haW4gc3RlbSBicm9uY2hpYWwgc3RlbnQsIHdoaWNoIGFwcGVhcnMgbmV3IGZyb20gdGhlIHByaW9yIGNoZXN0IHJhZGlvZ3JhcGguIFRoZXJlIGlzIHRyYWNlIGZsdWlkIG9yIGRlYnJpcyB3aXRoaW4gdGhlIGRpc3RhbCBsdW1lbiBvZiB0aGUgc3RlbnQuPC9saT4KIAo8bGk+VW5jaGFuZ2VkIGNpcmN1bWZlcmVudGlhbCB0aGlja2VuaW5nIG9mIHRoZSB0cmFjaGVhbCBhbmQgYnJvbmNoaWFsIHdhbGxzLCBpbiBrZWVwaW5nIHdpdGggdGhlIHBhdGllbnQncyBrbm93biBkaWFnbm9zaXMgb2YgcG9seWNob25kcml0aXMuPC9saT4KIAo8bGk+SGVwYXRpYyBzdGVhdG9zaXMuPC9saT4KPC9vbD4KPC9kaXY+CjwvYm9keT4KPC9odG1sPg=="
* presentedForm[html].contentType = MIME#text/html "HTML"
* presentedForm[html].hash = "4ED94777DD88C61F3A4D2C50DE6D92E8E53EE5CA"
* presentedForm[html].size = 3514

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

