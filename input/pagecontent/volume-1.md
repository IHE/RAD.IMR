

The Interactive Multimedia Report (IMR) Profile specifies how a diagnostic report with interactive multimedia content can be reliably encoded, communicated and presented.

## 1:52.1 IMR Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

Figure 1:52.1-1 shows the actors directly involved in the IMR Profile and the relevant transactions
between them. If needed for context, other actors that may be indirectly involved due to their participation
in other related profiles are shown in dotted lines. Actors which have a required
grouping are shown in conjoined boxes (see [Section 1:52.3](#1523-imr-required-actor-groupings)).

<div>
    <img src="IHE_IMR_actor.drawio.png" width="80%">
</div>
<br clear="all">

**Figure 1:52.1-1: IMR Actor Diagram**

Table 1:52.1-1 lists the transactions for each actor directly involved in the IMR Profile. To claim compliance with this profile, an actor shall support all required transactions (labeled “R”) and may support the optional transactions (labeled “O”).

**Table 1:52.1-1: IMR Profile - Actors and Transactions**

<table class="grid">
  <thead>
    <tr>
      <th>Actors</th>
      <th>Transactions</th>
      <th>Initiator or Responder</th>
      <th>Optionality</th>
      <th>Reference</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Report Creator</td>
      <td>Store Multimedia Report [RAD-141]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="RAD-141.html">RAD TF-2: 4.141</a></td>
    </tr>
    <tr>
      <td rowspan="3">Report Repository</td>
      <td>Store Multimedia Report [RAD-141]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="RAD-141.html">RAD TF-2: 4.141</a></td>
    </tr>
    <tr>
      <td>Find Multimedia Report  [RAD-143]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="RAD-143.html">RAD TF-2: 4.143</a></td>
    </tr>
    <tr>
      <td>Retrieve Rendered Multimedia Report [RAD-144]</td>
      <td>Responder</td>
      <td>R</td>
      <td><a href="RAD-144.html">RAD TF-2: 4.144</a></td>
    </tr>
    <tr>
      <td rowspan="5">Report Reader</td>
      <td>Store Multimedia Report [RAD-141]</td>
      <td>Responder</td>
      <td>O (Note 1)</td>
      <td><a href="RAD-141.html">RAD TF-2: 4.141</a></td>
    </tr>
    <tr>
      <td>Display Multimedia Report [RAD-142]</td>
      <td>N/A (Note 2)</td>
      <td>R</td>
      <td><a href="RAD-142.html">RAD TF-2: 4.142</a></td>
    </tr>
    <tr>
      <td>Find Multimedia Report [RAD-143]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="RAD-143.html">RAD TF-2: 4.143</a></td>
    </tr>
    <tr>
      <td>WADO-RS Retrieve [RAD-107]</td>
      <td>Initiator</td>
      <td>O</td>
      <td>RAD TF-2: 4.107</td>
    </tr>
    <tr>
      <td>Display Analysis Result [RAD-136]</td>
      <td>N/A (Note 2)</td>
      <td>O</td>
      <td>RAD AIR: 4.136</td>
    </tr>    
    <tr>
      <td rowspan="3">Rendered Report Reader</td>
      <td>Store Multimedia Report [RAD-141]</td>
      <td>Responder</td>
      <td>O (Note 1)</td>
      <td><a href="RAD-141.html">RAD TF-2: 4.141</a></td>
    </tr>
    <tr>
      <td>Find Multimedia Report [RAD-143]</td>
      <td>Initiator</td>
      <td>O (Note 1)</td>
      <td><a href="RAD-143.html">RAD TF-2: 4.143</a></td>
    </tr>
    <tr>
      <td>Retrieve Rendered Multimedia Report [RAD-144]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="RAD-144.html">RAD TF-2: 4.144</a></td>
    </tr>
    <tr>
      <td>Image Manager / Image Archive</td>
      <td>WADO-RS Retrieve [RAD-107]</td>
      <td>Responder</td>
      <td>R</td>
      <td>RAD TF-2: 4.107</td>
    </tr>
  </tbody>
</table>


> Note 1: The actor shall support at least one of [RAD-141] or [RAD-143].

> Note 2: These transactions are not typical IHE transactions between two devices; the primary focus is on the required behavior of the display rather than messaging between two actors. Therefore the notion of Initiator or Responder is not applicable (N/A) for the actor on the transaction.

### 1:52.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on this profile's actors.

#### 1:52.1.1.1 Report Creator

A Report Creator encodes diagnostic reports with multimedia content using FHIR DiagnosticReport resources. Each resulting DiagnosticReport resource also includes a default rendered report in the same DiagnosticReport resource, either as base64 encoded binary, or by reference using a URL.

A Report Creator may support creating multiple renditions of the same multimedia report for different consumers (e.g., consumers that do not render the detailed multimedia contents on its own, or external consumers that do not have access to studies inside the enterprise firewall).

A Report Creator stores the DiagnosticReport resources to Report Repositories, Report Readers, or Rendered Report Readers. 

> Note: In IMR, the Report Creator is the actor responsible for authoring the report. How the Report Creator receives the multimedia content in the report is out of scope for this release of IMR. For instance, a Report Creator may be grouped with an Image Display, or a Report Creator may be integrated with an Image Display via proprietary APIs or standard context sharing mechanism such as FHIRcast.

#### 1:52.1.1.2 Report Repository

A Report Repository stores multimedia reports received from Report Creators and makes the reports available for other consumers through query/retrieve.

A Report Repository may modify how the embedded rendered report can be accessed, if necessary. For example, a Report Repository may adjust an internal URL to an externally accessible URL, or it may retrieve the rendered report referenced by a URL and embed it directly in the DiagnosticReport resource as base64 encoded in query responses. How a Report Repository may adjust the accessibility of the rendered report is out of scope of IMR.

#### 1:52.1.1.3 Report Reader

A Report Reader presents to the user the report, including the multimedia content included in the report as well as all hyperlinks. When users click on the hyperlinks, the Report Reader presents the referenced images to the user in a way that the user can interact with the images (e.g., windowing, zooming, panning, toggle annotations, etc.).

A Report Reader shall support the display requirements as defined in [Display Requirements](#152116-display-requirements) A Report Reader may support additional advanced behavior.

> Note: This requirement can be satisfied by either implementing the required behaviors, or grouping with another actor (e.g. Image Display Invoker in IID) that provides the required behaviors.

> Note: The Report Reader may satisfy the baseline image viewing capabilities by retrieving DICOM objects and rendered by itself, or retrieve rendering of DICOM objects using WADO-RS Retrieve [RAD-107], or a combination of both.

> Note: The retrieve rendered images functionality of WADO-RS Retrieve [RAD-107] is available in CP-RAD-475.

A Report Reader shall use the information in DiagnosticReport.result.derivedFrom.endpoint.address and DiagnosticReport.result.component.valueString to construct valid WADO-RS URLs that conform to the semantics as RetrieveInstance or RetrieveFrames as defined in WADO-RS Retrieve [RAD-107] to retrieve the corresponding original DICOM objects or rendered images.

A Report Reader that supports the Advanced Image Viewing Option shall be able to construct WADO-RS URLs that confirm to the RetrieveSeries and RetrieveStudy semantics.

A Report Reader that supports the Advanced Measurement Viewing Option shall be able to display measurement objects that are not presentation states.

#### 1:52.1.1.4 Rendered Report Reader

A Rendered Report Reader presents to the user the rendered report that is included in the DiagnosticReport resource, including the multimedia content includes in the rendered report as well as all hyperlinks. When the user clicks on the hyperlinks, the Rendered Report Reader retrieves the linked contents and display them to the user.

A Rendered Report Reader shall retrieve and display the HTML report specified in DiagnosticReport.presentedForm.

A Rendered Report Reader that supports the PDF Report Option shall also be able to retrieve and display the PDF report specified in DiagnosticReport.presentedForm. See [PDF Report Option](#15221-pdf-report-option) for details.

A Rendered Report Reader shall support the display requirements as defined in [Display Requirements](#152116-display-requirements) A Rendered Report Reader may support additional advanced behavior.

> Note: There are no additional image viewing capabilities required for Rendered Report Readers. In other words, the image viewing capabilities presented by the Rendered Report Readers is limited by how the Report Creator created the rendered report. For example, for image references, one Report Creator may render them using WADO-RS links which will show a static rendered image, while another Report Creator may render them using IID Invoke Image Display links which will launch a viewer to show the referenced image with additional interactivity such as scrolling, zooming, etc.

#### 1.52.1.1.5 Image Manager / Image Archive

An Image Manager / Image Archive provides the images and related objects to the Report Readers or Image Displays.

An Image Manager / Image Archive is able to support both DICOMweb and DIMSE clients.

An Image Manager / Image Archive shall support returning images in the requested rendered media type as defined in DICOM [PS3.18 Section 9.5](https://dicom.nema.org/medical/dicom/current/output/html/part18.html#sect_9.5) "Retrieve Rendered Instance Transaction".

#### 1.52.1.1.6 Display Requirements

This transaction does not specify particular SOP classes that must be displayed.

##### 1.52.1.1.6.1 Image Objects

The actor shall display all requested DICOM image objects (single frame or multi-frame) for which it claims compliance in any IHE Content or Workflow profile or DICOM Conformance Statement. All supported DICOM image objects included in the selected studies shall be displayable, except images identified as “for processing”, raw data instances, and instances of private SOP Classes. It is permissible to display “for processing”, raw data instances, and instances of private SOP Classes.

The actor shall support image viewing capabilities as defined in [Basic Image Review (BIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_BIR.pdf) Profile, Section 4.16.4.2.2.5 as defined in Table 1.52.1.1.6-1. The actor shall support all required display requirements (labeled “R”) and may support the optional display requirements (labeled “O”).

**Table 1.52.1.1.6-1: Image Viewing Capability Required in IMR**

| Capability | Report Reader | Rendered Report Reader | BIR Reference 
|------------|----------------|-------------------------|-------------|
| Layout, Tiling, Selection, Rotation and Flipping | R (Note 1) | O | Section 4.16.5.2.2.5.2 |
| Windowing and Rendering | R | O | Section 4.16.4.2.2.5.4 |
| Scrolling | R<br><br>Required if IMR Advanced Image Viewing Option is supported | O | Section 4.16.4.2.2.5.5 |
| Zooming and Panning | R | O | Section 4.16.4.2.2.5.6 |
| Laterality and Spatial Cross-Referencing | R<br><br>Required only Laterality | R<br><br>Required only Laterality | Section 4.16.4.2.2.5.7 |
| Annotation | R | O | Section 4.16.4.2.2.5.8 |
| Cine | R<br><br>Required if the Display supports sop classes that cine is  applicable | O | Section 4.16.4.2.2.5.9 |
{: .grid}

> Note 1: A Report Reader is permissible to only support a single viewport.

The actor may provide basic viewing tools for the user to interact with the images.

> Note: The actor is only required to display objects specifically referenced in the DiagnosticReport resource.
>
> Multiplanar reconstruction, or MPR, involves the process of converting data from an imaging modality acquired in a certain plane, usually axial, into another plane such as coronal or sagittal or oblique. It is most commonly performed with thin-slice data from volumetric CT in the axial plane, but it may be accomplished with scanning in any plane and whichever modality capable of cross-sectional imaging, including magnetic resonance imaging (MRI).
>
> Although MPR is a feature available in many PACS implementations, it is an advanced operation that is computationally intensive. For the interactive image viewing capability on interactive multimedia report, MPR is not expected to be available. If viewing of the images from different planes is desirable, then the acquired data should be reconstructed to other planes and then be saved as separate set of images. These new set of reconstructed images can then be referenced in the DiagnosticReport resource.
>
> The actor is not required to support reconstruction.

##### 1.52.1.1.6.2 Non-Image Objects

The Report Reader shall be capable of display Grayscale Softcopy Presentation State objects with their referenced images.

## 1:52.2 IMR Actor Options

Options that may be selected for each actor in this implementation guide, are listed in Table 1:52.2-1 below. Dependencies between options, when applicable, are specified in notes.

**Table 1:52.2-1: IMR - Actors and Options**

<table class="grid">
  <thead>
    <tr>
      <th>Actor</th>
      <th>Option Name</th>
      <th>Reference</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">Report Creator</td>
      <td>PDF Report</td>
      <td><a href="#15221-pdf-report-option">Section 1:52.2.1</a></td>
    </tr>
    <tr>
      <td>HL7 Text Report</td>
      <td><a href="#15222-hl7-text-report-option">Section 1:52.2.2</a></td>
    </tr>
    <tr>
      <td>Report Repository</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
    <tr>
      <td rowspan="2">Report Reader</td>
      <td>Advanced Image Viewing</td>
      <td><a href="#15223-advanced-image-viewing-option">Section 1:52.2.3</a></td>
    </tr>
    <tr>
      <td>Advanced Measurement Viewing</td>
      <td><a href="#15224-advanced-measurement-viewing-option">Section 1:52.2.4</a></td>
    </tr>
    <tr>
      <td>Rendered Report Reader</td>
      <td>PDF Report</td>
      <td><a href="#15221-pdf-report-option">Section 1:52.2.1</a></td>
    </tr>
    <tr>
      <td>Image Manager / Image Archive</td>
      <td>No options defined</td>
      <td>–</td>
    </tr>
  </tbody>
</table>

### 1:52.2.1 PDF Report Option

The PDF Report Option involves rendering and presenting multimedia reports in PDF format.

A Report Creator that supports this option shall be able to generate a rendered multimedia report in PDF format, preserving the image references as either hyperlinks or embedded static images in the rendered PDF file, and embed the rendered report in DiagnosticReport.presentedForm in the Store Multimedia Reports [RAD-141] transaction. See [Rendered Report In PDF](RAD-141.html#24141412222-rendered-report-in-pdf-format) for details.

> Note: How the Report Creator lays out the report into PDF is out of scope of IMR, provided that the rendered report preserves the readability of the report. For example, consider the case that there are multiple measurements in the same paragraph, each has its separate image reference(s). If the image references are rendered as inline static images, then the resulting paragraph may be broken up and become hard to read.

A Rendered Report Reader that supports this option
- shall identify the PDF rendered report according to the contentType attribute
- shall retrieve and display the PDF rendered report specified in either DiagnosticReport.presentedForm.data or DiagnosticReport.presentedForm.url
- shall be able to launch the hyperlinks included in the PDF report.
- shall be able to select either the HTML or PDF rendered reports in DiagnosticReport.presentedForm to retrieve and display

### 1:52.2.2 HL7 Text Report Option

The HL7 Text Report Option involves rendering and presenting multimedia reports in text format. Such text would be suitable for inclusion in HL7 messages for consumption by non-IMR actors.

A Report Creator that supports this option shall be able to create a text-only rendering of the report, including the textual representation of all measurements, and may include unambiguous textual representation of image references.

> Note: How the Report Creator lays out the report into text-only format is out of scope of IMR, provided that that text-only report preserves the readability of the report.

> Note: A textual representation of image references may look like (2,16) which means series 2 instance 16. Specific format for textual representation of image references is out of scope of IMR. As a result, interpretation of such information, if necessary, requires pre-arranged agreement between the Report Creator and non-IMR actors. The Report Creator may support different formats based on configuration.

A Report Creator shall be able to encode the text-only report in an HL7 ORU message and transmit the report to non-IMR Report Readers using MLLP. A Report Creator may use Send Imaging Result [RAD-128] in the IHE [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile.


### 1:52.2.3 Advanced Image Viewing Option

The Advanced Image Viewing Option involves the user being able to view images with advanced imaging tools.

A Report Reader that supports this option shall provide scrolling display requirements (See [Display Requirements](#152116-display-requirements) for details).

### 1:52.2.4 Advanced Measurement Viewing Option

The Advanced Measurement Viewing Option involves the user being able to view measurements that are not presentation states.

A Report Reader that supports this option shall support the Display Analysis Result [RAD-136] transaction.

> Note: The Display Analysis Result [RAD-136] transaction is defined in the [AI Results](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf) Supplement.

## 1:52.3 IMR Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or
content modules in this profile ***in addition to all*** of the requirements for the grouped actor (Column 3).

In some cases, required groupings are defined as at least one of an enumerated set of possible actors; this is designated by merging column one into a single cell spanning multiple potential grouped actors. Notes are used to highlight this situation.

Section 1:52.5 describes some optional groupings that may be of interest for security
considerations and Section 1:52.6 describes some optional groupings in other related profiles.

**Table 1:52.3-1: IMR Required Actor Groupings**

| IMR Actor | Grouping Condition | Actor(s) to be grouped with | Reference |
|-----------|--------------------|-----------------------------|-----------|
| Report Creator | Required | ITI CT / Time Client | [ITI TF-1: 7.1](https://profiles.ihe.net/ITI/TF/Volume1/ch-7.html#7.1) |
| Report Repository | -- | None | -- |
| Report Reader | -- | None | -- |
| Rendered Report Reader | -- | None | -- |
| Image Manager / Image Archive | -- | None | -- |
{: .grid}

## 1:52.4 Interactive Multimedia Report Overview

### 1:52.4.1 Concepts

**TODO** Reference the HIMSS-SIIM IMR Technical Consideration Whitepaper when it is published

#### 1:52.4.1.1 Structure in Radiology Reporting

In reporting, structure can significantly improve usability, both for machine consumption and human consumption. Structure can refer to several aspects within a report as follows:

##### Report Content Organization 

This aspect of structure involves organizing the content of the report into labelled sections.

In a radiology report, although there are many variations of what information a report should contain depending on the procedure and specialty, there are general common sections in a report such as Indication, Methods, Findings, Impressions, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile specifies using multiple OBX segments for different sections. This Interactive Multimedia Report Profile does not explicitly define sections. A Report Creator may include sections in FHIR DiagnosticReport.text elements and DiagnosticReport.presentedForm pre-rendered reports.

##### Report Content Encoding

This aspect of structure involves representing certain content items, such as anatomy or findings, using coded values.

Also known as 'structured reporting' or 'synoptic reporting', encoding structure refers to the use of fully coded values in pre-coordinated form or post-coordinated form, in which the values are drawn from some value sets or standardized nomenclature / coded values such as LOINC or SNOMED-CT, in order to represent the full concept.

This has been successfully used in certain disciplines such as cancer screening, but it is less common in general radiology reporting practice.

##### Report Presentation

This aspect of structure involves guiding how the report content is presented to readers.

While Report Content Structure and Report Content Encoding Structure focus on imposing structure to data elements, they do not impose any requirements on how these data elements will be presented to the user. The FHIR Composition resource is designed for presentation structure using elements like *section*.

> As of FHIR R4, FHIR DiagnosticReport and Composition are two independent resources with no explicit relationship. Future versions of FHIR may integrate FHIR DiagnosticReport and Composition to enable better presentation structure.

Report Presentation is out of scope for IMR.

##### Message Structure

In the most basic form, the clinical report is conveyed between the sender and the receiver using some kind of message format. The message format defines a structure for the overall payload, including the metadata and the actual report content. For example, HL7 v2 ORU messages or FHIR DiagnosticReport resources define such a message structure that governs where different content should be placed, such as patient, order, report content, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile specifies using HL7 v2 ORU as the message structure while this Interactive Multimedia Report Profile specifies using FHIR DiagnosticReport resource.

This Interactive Multimedia Report Profile includes specific requirements related to the Message Structure and Report Content Structure aspects described above. The IMR Profile does not include specific requirements related to Report Content Encoding, although coded content is permitted and implementations are encouraged to explore this aspect of structured reporting.

#### 1:52.4.1.2 Source of Multimedia Content

There are two sources of multimedia content for radiology reporting:

- User-defined
    - These are the content provided by the user. This includes, but is not limited to, annotations, measurements, image references, etc.
- System-defined
    - These are the content provided by a system. For example, a parametric map generated by the modality or region of interest generated by an AI model.

These content should be available to the report authoring system so that it can incorporate the details automatically.

#### 1:52.4.1.3 Creation and Usage of Multimedia Content

A key element for an interactive multimedia report is the ability to include clinical findings such as measurements, region of interest (ROI), etc. with interactive links to the source images. Traditionally, these annotations, markups, presentation states, and key images could be captured as DICOM objects such as Grayscale Softcopy Presentation State (GSPS), Structured Report (SR), or Key Object Selection Document (KOS). However, these objects are designed to capture evidence for long-term reference instead of real-time communication or composition. Most PACS will create these evidence objects at the end of a session in order to capture all the data points created by the image-centric specialist in one object, rather than create multiple evidence objects resulting in one per data point. As a result, these evidence objects in DICOM are good resources for subsequent interactive access when viewing an IMR, but not good candidates as the payload for real-time communication during a reporting session. As the image-centric specialist captures measurements, regions of interest, and other data points, ideally the PACS can provide those data points to the reporting system in real-time without introducing any unnecessary interruptions, or adding transitory content to the permanent record.

> Note: Real time communication is out of scope of IMR.

#### 1:52.4.1.4 Placement of Multimedia Content

A rudimentary approach is to place all references/multimedia content at the bottom of the report.

Although this can be useful, a more sophisticated placement of multimedia contents is the ability to insert them in context of the findings and impressions. Consider this sample finding statement

```
Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station
```

References to measurements and/or images can be added as hyperlinks in context as follow:

```
<imr-ref type='ImagingSelection' imaging-selection='ImagingSelection/12345'>Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station</imr-ref>
```

As a result, a user can access the matching multimedia content in context while reading the report.

This sophisticated placement of multimedia contents requires a more complex interaction between the PACS and the Reporting System because both systems need to know the current context and be able to mark their respective data accordingly. This also requires a low latency communication because any pause required by the radiologist to synchronize the two systems during a reporting session will cause significant distraction to the radiologist.

Report Creators in IMR are required to support placing image references in context of the findings and impressions.

#### 1:52.4.1.5 Imaging Context in Report 

An imaging context in IMR can include image references and non-image references.

> Note: IMR focuses on specifying references to imaging context in a report. Other references to external resources (e.g. Lung-RADS, survey) are out of scope of IMR.

##### Image References

An image reference is a reference to an image to which a finding or observation pertains, or which best presents the finding.

Each image reference in a report is in the context of a series. Furthermore, each image reference includes one of the following context detail patterns:

- a single frame in a single-frame object (e.g. object 10)
- a single frame in a multi-frame object (e.g. object 10 frame 3)
- a range of frames in a single frame object (e.g. object 3-5)
- a range of frames in a multi-frame object (e.g. object 10 frame 3-5)
- a discrete list of frames in a single frame object (e.g. object 10,14,17)
- a discrete list of frames in a multi-frame object (e.g. object 10 frame 10,14,17)
- all frames in a multi-frame object
- all objects in a series
- all frames in a dimension in a multi-frame object (as a discrete list of frames)
- one or more frames in a parametric map

> Note: The attribute `frame` is optional for single-frame object.

> Note: Different references in the same report are permitted to use different context detail patterns.

> Note: DICOM Concatenation is not addressed here since it only appears during transmission, not as a persistently stored object reviewed during reporting.

In most cases, the image references refer to the same study as the study being reported. The image references may also refer to a comparison study that is used during reporting.

##### Non-Image References

A non-image reference is a reference to an object that references other images and provides additional information that can be presented in association with referenced images. 

In addition to image references, an imaging context may also specify non-image references such as locations, regions, annotations, etc. These non-image references refers to data encoded using various DICOM objects such as Structured Report (SR), different types of Presentation States (PR) and Segmentation.

Each non-image reference in a report is in the context of an image reference. Furthermore, each non-image reference includes one of the following context detail patterns:

- a rough location (e.g. an arrow pointing to a point of interest)
- a specific location (e.g. a specific coordinates in an image))
- a specific region (e.g. a contour of lesion boundary)
- a bounding region (e.g. a box or circle around a feature of interest)
- a measurement (e.g. a line segment in an image and the length of the line)

> Note: See [AI Results](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf) Section 6.5.3.4, 6.5.3.5 and 6.5.3.6 for details regarding how locations, regions and parametric maps are captured as DICOM objects.

#### 1:52.4.1.6 DiagnosticReport Referenced Resources

Multimedia reports are encoded using a FHIR DiagnosticReport resource as the top level resource. The DiagnosticReport resource references other resources that provide additional report content, imaging procedure context, and organizational context. Some of these referenced resources are created and managed by other enterprise systems (e.g. the patient resource is managed by the EMR). Others are created together with the DiagnosticReport.

##### Report Content

TODO: Describe how there narrative text and findings and measurements are referenced. All these are created at reporting time by the Report Creator.

A DiagnosticReport resource captures findings and impressions as narrative text.

Since a DiagnosticReport resource is the top level resource used to capture a multimedia report, therefore every time a multimedia report is created, a DiagnosticReport resource is created.

##### Imaging Procedure Context

TODO: Describe how there is ServiceRequest and ImagingStudy and the imaging data itself those are created prior / during reporting by the ordering / EMR / VNA (i.e. not Report Creator).

A DiagnosticReport resource may reference a ServiceRequest resource to capture the procedure information. A DiagnosticReport resource also references one or more ImagingStudy resources to capture the study that is subject of the report as well as other associated studies.

Although the procedure and imaging study exist in other systems prior to reporting, the corresponding ServiceRequest or ImagingStudy resources may not. Therefore a Report Creator may create these dependent resources along with DiagnosticReport during report creation.

##### Organizational Context

A DiagnosticReport references organizational level resources such as `Patient`, `Organization`, `Practitioner` and `PractitionerRole`. *TODO: State which system(s) are responsible for these resources*. Therefore, it is a prerequisite that these organizational resources already exist prior to the creation of DiagnosticReport resource. Then a Report Creator will only reference these organizational resources during report creation.

TODO: Deployment prerequisite to have these organizational context

#### 1:52.4.1.7 Referenced FHIR Resource vs Contained FHIR Resource

A DiagnosticReport resource incorporates other resources. According to FHIR, those other resources can be incorporated as either referenced FHIR resources or contained FHIR resources. In IMR, when storing a DiagnosticReport resource, all incorporated resources are included as referenced. Contained resources are not permitted in IMR because they cannot be retrieved as independent resources. 

Contained resources are not preferred when resources have independent identity from the containing resource. This is because contained resources cannot be reused across multiple resources. If the same content is included multiple times, such duplication can lead to possible integrity problems.

A FHIR server that provides the FHIR [Search](http://hl7.org/fhir/search.html) capability returns query responses with references to other resources, such as Patient, IMR Observation, IMR ImagingStudy, etc. To access the content of referenced resources, the requester will have to retrieve them separately.

Optionally, a FHIR server may support the [_include](http://hl7.org/fhir/search.html#include) search result parameter. If the requester specifies this parameter in the search request, then the FHIR Server will include the specified referenced resources in the same response. The advantage is that the requester only needs to issue a single query request and the result will contain all the necessary data. The disadvantages are (1) the payload size may increase significantly, (2) the server will need to perform more work and may return the response slower, (3) it is an optional capability of the server so the requester cannot depend on it being available.

### 1:52.4.2 Use Cases

The IMR Profile encodes multimedia content in diagnostic reports such that later the user can interact with the linked multimedia content in the reports.

Note that the IMR Profile is focused on intra-enterprise use cases. Other inter-enterprise use cases may be supported in future updates. The design of the IMR does not prohibit addressing inter-enterprise use cases in the future.

#### 1:XX.4.2.1 Use Case 1: Pre-Rendered Report

##### 1:XX.4.2.1.1 Pre-Rendered Report Use Case Description

The Report Creator encodes the diagnostic report with multimedia content when saving dictated report. This use case shows the multimedia report being stored in the Report Repository. Alternatively, the Report Creator could send the report directly to one or more Report Readers and/or Rendered Report Readers.

A Clinician wants to review studies and associated diagnostic reports for a patient. She searches the EMR for the patient. As a result, the EMR returns a list of studies and associated diagnostic reports for the patient, from which she selects the report of interest.

##### 1:XX.4.2.1.2 Pre-Rendered Report Process Flow

<div>
{%include uc1-presenting-interactive-report-presentedform.svg%}
</div>
<br clear="all">

**Figure 1:XX.4.2.1.2-1: Pre-Rendered Report Process Flow in IMR Profile**

#### 1:XX.4.2.2 Use Case 2: Locally Processed Report

##### 1:XX.4.2.2.1 Locally Processed Report Use Case Description

This use case is similar to Use Case #1, but instead of presenting a pre-rendered copy of the report that has been included in the multimedia report object, the Report Reader processes the multimedia report object according to its own rendering configuration.

TODO ***

The Clinician clicks on the interactive links.

In this use case, the Report Reader retrieves rendered objects using WADO-RS and display them. Alternatively, the Report Reader retrieves DICOM objects, renders and display them.

The Clinicians can navigate the series and see the measurements with annotations as described in the report.

##### 1:52.4.2.2.2 Consume and Interact with Multimedia Report by Advanced Consumers Process Flow

Figure 1:52.4.2.2.2-1 shows how the Clinician can use the EMR with native IMR Report Reader support to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-standalone.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.2.2-1: Consume and Interact with Multimedia Report by Advanced Consumers Process Flow in IMR Profile**

#### 1:XX.4.2.4 Use Case 4: Consume and Interact with Multimedia Report by Advanced Consumers with Integrated Image Display Invoker

##### 1:52.4.2.4.1 Consume and Interact with Multimedia Report by Advanced Consumers with Integrated Image Display Invoker Use Case Description

If the EMR delegates image viewing responsibility to an external Image Display by implementing Image Display Invoker in IID, then the EMR can implement the Report Reader to support displaying the multimedia report content according to its rendering configuration as in Use Case #2. Furthermore, the Report Reader capability is integrated with the Image Display Invoker capability to display the referenced images embedded in IMR multimedia reports.

In this case, when viewing IMR multimedia reports for a patient in the EMR, it displays the reports with interactive links to the multimedia content. The Clinician clicks on the interactive links. The EMR / Report Reader launches the integrated Image Display Invoker which in turn invokes the configured Image Display in context based on the information in the link. The Image Display retrieves and displays the images with interactive tools. The Clinicians can navigate the series and see the measurements with annotations as described in the report.

##### 1:52.4.2.4.2 Consume and Interact with Multimedia Report by Advanced Consumers with Integrated Image Display Invoker Process Flow

Figure 1:52.4.2.4.2-1 shows how the Clinician can use the EMR that supports IMR Report Reader with integrated Image Display Invoker to interact with the multimedia content available in the report.

<div>
{%include uc4-presenting-interactive-report-EMR.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.4.2-1: Consume and Interact with Multimedia Report by Advanced Consumers with Integrated Image Display Invoker Process Flow in IMR Profile**

#### 1:52.4.2.5 Use Case 5: Consume and Interact with Multimedia Report for Comparison Study in PACS

##### 1:52.4.2.5.1 Consume and Interact with Multimedia Report for Comparison Study in PACS Use Case Description

A radiologist is in the process of dictating a study. Comparison studies are displayed along with the current study. The comparison studies have associated multimedia reports. The Report Reader integrated with an Image Display displays the multimedia reports to the radiologist with interactive links. When the Radiologist clicks on the links, the Report Reader triggers the viewport in the Image Display currently showing the comparison study to show the specific image in which the measurements are derived from. If needed, the Radiologist can redo the measurements on the comparison studies to confirm the data submitted.

##### 1:52.4.2.5.2 Consume and Interact with Multimedia Report for Comparison Study in PACS Process Flow

Figure 1:52.4.2.5.2-1 shows how the Radiologist can use the PACS workstation (Image Display) that is integrated with IMR Report Reader to interact with the multimedia content available in the report.

<div>
{%include uc5-presenting-interactive-report-PACS.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.5.2-1: Consume and Interact with Multimedia Report for Comparison Study in PACS Process Flow in IMR Profile**

## 1:52.5 IMR Security Considerations

Refer to RAD TF-1x: Appendix F “Security Environment Considerations”.

Protected Healthcare Information (PHI) is present in the DICOM instances being stored,
retrieved, processed, and displayed, as well as in the API being invoked.

See ITI TF-2: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for FHIR based transactions.

General [Security and Privacy guidance](http://hl7.org/fhir/secpriv-module.html) is provided in the FHIR Specification.

### 1:52.5.1 Security Considerations for Actors

This profile strongly recommends all actors group with an ITI ATNA Secure Application or
Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- [Record Audit Event](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html) [ITI-20] transaction which would record when and where analysis
785 results are distributed and displayed.
- [Authenticate Node](https://profiles.ihe.net/ITI/TF/Volume2/ITI-19.html) [ITI-19] transaction to further ensure the integrity of transactions via
node authentication and communication encryption.

Furthermore, for the FHIR-based transactions, this profile strongly recommends the use of ITI [Internet User Authorization](https://profiles.ihe.net/ITI/TF/Volume1/ch-34.html) (IUA) Profile to ensure that communications are only allowed for authenticated and authorized users and/or systems.

### 1:52.5.2 Security Considerations for Multimedia Reports

Multimedia report instances as defined in this profile contain personal demographic information
and clinical information. It is appropriate for products implementing the Interactive Multimedia Report Profile to include appropriate PHI controls. Specifying such mechanisms and features is outside the scope of this profile.

The rendered report included in the DiagnosticReport resource may be referenced by a URL. The rendered report itself may also include hyperlinks for image references. It is recommended for any deployment to have network configurations that only allow trusted known clients (e.g., by IP address or subnet).

The Rendered Report Readers should verify if these URLs are legitimate and from a trusted source, minimizing the chance of phishing attack and executing malicious script embedded inside a report.

## 1:52.6 IMR Cross-Profile Considerations

**Scheduled Workflow (SWF.b)**: A Report Reader may be grouped with an Image Display in SWF.b to satisfy the image viewing capabilities requirements by retrieving DICOM objects via DIMSE services. The Image Display may provide additional image viewing capabilities. The grouped Image Display may be used to view prior studies as well.

**Invoke Image Display (IID)**: A Report Reader may be grouped with an Image Display Invoker in IID to satisfy the image viewing capabilities requirements. The invoked Image Display may provide additional image viewing capabilities.

> Note: The Retrieve Display of Series Images functionality and IHE-IMR viewer type are available in CP-RAD-474.

**Results Distribution (RD)**: A Report Creator that supports the HL7 Text Report Option can use Result Distribution to send the text report to other consumers.

**Basic Image Review (BIR)**: A Report Reader may be grouped with an Image Display in BIR to provide the required image display functionality.

**Management of Radiology Report Templates (MRRT)**: A Report Creator in MRRT may be grouped with a Report Creator in IMR. As a result, the grouped Report Creator can use the report templates to assist the radiologist in creating the diagnostic report, and capture the final report in the IMR DiagnosticReport format.

**AI Result (AIR)**: An Evidence Creator may be grouped with an IMR Report Creator to include AI results in the diagnostic report. An Image Display in AIR may be grouped with an IMR Report Reader to show analysis results captured in DICOM Structured Report, Segmentation or Parametric Map objects.

**Internet User Authorization (IUA)**: TODO

**Patient Identifier Cross-reference for Mobile (PIXm)**: TODO

**Patient Demographics Query for Mobile (PDQm)**: TODO

**Mobile Care Services Discovery (mCSD)** TODO