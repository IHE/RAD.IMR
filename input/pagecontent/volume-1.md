

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
      <td><a href="#152111-report-creator">Report Creator</a></td>
      <td>Store Multimedia Report [RAD-141]</td>
      <td>Initiator</td>
      <td>R</td>
      <td><a href="RAD-141.html">RAD TF-2: 4.141</a></td>
    </tr>
    <tr>
      <td rowspan="3"><a href="#152112-report-repository">Report Repository</a></td>
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
      <td rowspan="5"><a href="#152113-report-reader">Report Reader</a></td>
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
      <td>RAD TF-2: 4.107 (Note 3)</td>
    </tr>
    <tr>
      <td>Display Analysis Result [RAD-136]</td>
      <td>N/A (Note 2)</td>
      <td>O</td>
      <td>RAD TF-2: 4.136 (Note 4)</td>
    </tr>    
    <tr>
      <td rowspan="3"><a href="#152114-rendered-report-reader">Rendered Report Reader</a></td>
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
      <td><a href="#152115-image-manager--image-archive">Image Manager / Image Archive</a></td>
      <td>WADO-RS Retrieve [RAD-107]</td>
      <td>Responder</td>
      <td>R</td>
      <td>RAD TF-2: 4.107</td>
    </tr>
  </tbody>
</table>


> Note 1: The actor shall support at least one of [RAD-141] or [RAD-143].

> Note 2: These transactions are not typical IHE transactions between two devices; the primary focus is on the required behavior of the display rather than messaging between two actors. Therefore the notion of Initiator or Responder is not applicable (N/A) for the actor on the transaction.

> Note 3: WADO-RS Retrieve [RAD-107] is defined in the [Web-based Image Access (WIA)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_WIA.pdf) Supplement.

> Note 4: Display Analysis Results [RAD-136] is defined in the [AI Results (AIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf) Supplement.

### 1:52.1.1 Actors Description and Actor Profile Requirements
Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on this profile's actors.

#### 1:52.1.1.1 Report Creator

A Report Creator encodes diagnostic reports with multimedia content using FHIR `DiagnosticReport` resources. Each resulting `DiagnosticReport` resource also includes at least one rendered report in HTML format in the same `DiagnosticReport` resource, either as base64 encoded binary, or by reference using a URL.

A Report Creator may support creating multiple rendered reports of the same multimedia report for different consumers (e.g., consumers that do not render the detailed multimedia contents on its own, or external consumers that do not have access to studies inside the enterprise firewall).

A Report Creator stores the `DiagnosticReport` resources to Report Repositories, Report Readers, or Rendered Report Readers. 

> Note: Storing reports directly to the Report Readers or Rendered Report Reader is intended to provide a similar integration path to using HL7 ORU. This enables a transition path from traditional HL7 ORU report integration to IMR with minimal new infrastructure.

> Note: How the Report Creator receives the multimedia content it includes in the report is out of scope for this version of IMR. To obtain multimedia content, a Report Creator may be grouped with an Evidence Creator, or a Report Creator may be integrated with an Image Display via proprietary APIs or standard context sharing mechanism such as FHIRcast.

#### 1:52.1.1.2 Report Repository

A Report Repository stores multimedia reports received from Report Creators and makes the reports available for other consumers through query/retrieve.

A Report Repository may modify how the embedded rendered report can be accessed, if necessary. For example, a Report Repository may adjust an internal URL to an externally accessible URL, or it may retrieve the rendered report referenced by a URL and embed it directly, base64 encoded, in the `DiagnosticReport` resource in a query response. How a Report Repository adjusts the accessibility of the rendered report is out of scope of IMR.

#### 1:52.1.1.3 Report Reader

A Report Reader displays reports, including [observation imaging context](#152415-observation-imaging-context-in-report) referenced in the report. Based on the referenced `ImagingSelection` resources defined in each observation imaging context, the Report Reader generates corresponding hyperlinks when the report is displayed to the user. When users click on the hyperlinks, the Report Reader presents the initial view of the referenced images to the user, such that the user can interact with the images (e.g., windowing, zooming, panning, toggle annotations, etc.).

##### 1.52.1.1.3.1 Display Requirements

When a user clicks on the hyperlinks, the Report Reader shall display the initial view of the corresponding observation imaging context to the user.

> Note: The observation imaging context is captured in an `ImagingSelection` resource. See [RAD-141](RAD-141.html#2414141222-observation-imaging-context-in-an-imr-diagnosticreport-resource)

A Report Reader shall support the display requirements for different object types in the observation imaging context as defined in the following sections. A Report Reader may support additional advanced behavior. This requirement may be satisfied by either implementing the required behaviors, or by grouping with another actor (e.g. Image Display Invoker in IID) that provides the required behaviors. The Report Reader may satisfy the baseline image viewing capabilities either by retrieving DICOM objects and rendering them, or by retrieving rendered DICOM objects using WADO-RS Retrieve [RAD-107], or a combination of both.

> Note: The retrieve rendered images functionality of WADO-RS Retrieve [RAD-107] is defined in CP-RAD-475.

The Report Reader is only required to display objects referenced in the observation imaging context captured in an `ImagingSelection` resource. The Report Reader may display additional images if it supports the Advanced Image Viewing Option.

###### 1.52.1.1.3.1.1 Image References

The Report Reader shall be able to display any referenced DICOM image objects (single frame or multi-frame) for which it claims support in any IHE Content or Workflow profile or DICOM Conformance Statement.

The Report Reader shall support display capabilities defined in Table 1.52.1.1.3.1.1-1 [Basic Image Review (BIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_BIR.pdf) Profile.

**Table 1.52.1.1.3.1.1-1: Image Viewing Capability Required in IMR**

| Capability | BIR Reference |
|------------|-------------|
| Layout, Tiling, Selection, Rotation and Flipping (Note 1) | Section 4.16.5.2.2.5.2 |
| Windowing and Rendering | Section 4.16.4.2.2.5.4 |
| Zooming and Panning | Section 4.16.4.2.2.5.6 |
| Laterality | Section 4.16.4.2.2.5.7 |
| Annotation | Section 4.16.4.2.2.5.8 |
| Cine | Section 4.16.4.2.2.5.9 |
{: .grid}

> Note 1: A Report Reader is permitted to only support a single viewport.

The Report Reader may provide additional tools for the user to interact with the images.

###### 1.52.1.1.3.1.2 Non-Image References

The Report Reader shall be capable of displaying Grayscale Softcopy Presentation State (GSPS) objects with their referenced images.

> Note: The Report Reader is permitted to ignore referenced images in the GSPS object that are outside the observation imaging context defined in the ImagingSelection resource unless Advanced Image Viewing Option is supported.

The Report Reader shall be capable of displaying the following non-image references specified in the `ImagingSelection.instance.imageRegion` or `ImagingSelection.imageRegion`.

#### 1:52.1.1.4 Rendered Report Reader

Rather than render the report content, as the Report Reader does, a Rendered Report Reader presents to the user the pre-rendered version of the report that is included in the `DiagnosticReport` resource. The 
pre-rendered report includes multimedia content and hyperlinks. When the user clicks on the hyperlinks, the Rendered Report Reader retrieves the linked contents and display them to the user.

A Rendered Report Reader shall retrieve and display the HTML report specified in `DiagnosticReport.presentedForm`.

> Note: There are no additional image viewing capabilities required for Rendered Report Readers. In other words, the image viewing capabilities presented by the Rendered Report Readers is defined by how the Report Creator created the rendered report. For example, for image references, one Report Creator may render them using WADO-RS links which will show a static rendered image, while another Report Creator may render them using IID Invoke Image Display links which will launch a viewer to show the referenced image with additional interactivity such as scrolling, zooming, etc. The Rendered Report Reader may provide additional image viewing capabilities.

#### 1.52.1.1.5 Image Manager / Image Archive

An Image Manager / Image Archive provides the images and related objects to the Report Readers.

An Image Manager / Image Archive is able to support DICOMweb WADO-RS Retrieve.

An Image Manager / Image Archive returns images in the requested rendered media type as defined in DICOM [PS3.18 Section 9.5](https://dicom.nema.org/medical/dicom/current/output/html/part18.html#sect_9.5) "Retrieve Rendered Instance Transaction".

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

A Report Creator that supports this option shall be able to generate a rendered multimedia report in PDF format, preserving the image references as either hyperlinks or embedded static images in the rendered PDF file, and associate the rendered report in `DiagnosticReport.presentedForm` in the Store Multimedia Reports [RAD-141] transaction. See [Rendered Report In PDF](RAD-141.html#24141412232-rendered-report-in-pdf-format) for details.

> Note: How the Report Creator lays out the report into PDF is out of scope of IMR, provided that the rendered report preserves the readability of the report. For example, consider the case that there are multiple measurements in the same paragraph, each having a separate image reference(s). If the image references are rendered as inline static images, then the resulting paragraph may be broken up and become hard to read.

A Rendered Report Reader that supports this option:
- shall identify the PDF rendered report according to the contentType attribute
- shall retrieve and display the PDF rendered report specified in either `DiagnosticReport.presentedForm.data` or `DiagnosticReport.presentedForm.url`
- shall be able to launch the hyperlinks included in the PDF report.
- shall be able to select either the HTML or PDF rendered reports in `DiagnosticReport.presentedForm` to retrieve and display

### 1:52.2.2 HL7 Text Report Option

The HL7 Text Report Option involves rendering and presenting multimedia reports in text format. Such text would be suitable for inclusion in HL7 messages for consumption by non-IMR actors.

A Report Creator that supports this option shall be able to create a text-only rendering of the report, including the textual representation of all measurements, and may include unambiguous textual representation of image references.

> Note: How the Report Creator lays out the report into text-only format is out of scope of IMR, provided that that text-only report preserves the readability of the report.

> Note: A textual representation of image references may look like (2,16) which means series 2 instance 16. Specific format for textual representation of image references is out of scope of IMR. As a result, interpretation of such information, if necessary, requires pre-arranged agreement between the Report Creator and non-IMR actors. The Report Creator may support different formats based on configuration.

A Report Creator shall be able to encode the text-only report in an HL7 ORU message and transmit the report to non-IMR Report Readers using MLLP. A Report Creator may use the Send Imaging Result [RAD-128] transaction in the IHE [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile.

### 1:52.2.3 Advanced Image Viewing Option

The Advanced Image Viewing Option involves the user being able to view images with advanced imaging tools.

A Report Reader that supports the Advanced Image Viewing option:
- shall support scrolling display requirements as defined Section 4.16.4.2.2.5.5 in the [Basic Image Review (BIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_BIR.pdf) supplement.
- shall be able to construct WADO-RS URLs that confirm to the RetrieveSeries and RetrieveStudy semantics.

> Note: Multiplanar Reconstruction (MPR) is available in many PACS implementations; it is an advanced operation that is computationally intensive. For the interactive image viewing capability in an interactive multimedia report, MPR is not expected to be available. If viewing of the images from different planes is desirable, then the acquired data should be reconstructed to other planes and then be saved as separate set of images. These new set of reconstructed images can then be referenced in the `DiagnosticReport` resource.

### 1:52.2.4 Advanced Measurement Viewing Option

The Advanced Measurement Viewing Option involves the user being able to view measurements that are not presentation states.

A Report Reader that supports the Advanced Measurement Viewing Option shall be able to display measurement objects that are not presentation states.

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

This aspect of structure involves organizing the content of the report into labelled sections and subsections.

In a radiology report, although there are many variations of what information a report should contain depending on the procedure and specialty, there are general common sections in a report such as Indication, Methods, Findings, Impressions, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile specifies using multiple OBX segments for different sections. This Interactive Multimedia Report Profile does not explicitly define sections. A Report Creator may include sections in FHIR `DiagnosticReport.text` elements and `DiagnosticReport.presentedForm` pre-rendered reports.

##### Report Content Encoding

This aspect of structure involves representing certain content items, such as anatomy or findings, using coded values.

Also known as 'structured reporting' or 'synoptic reporting', encoding structure refers to the use of fully coded values in pre-coordinated form or post-coordinated form, in which the values are drawn from some value sets or standardized nomenclature / coded values such as LOINC or SNOMED-CT, in order to represent the full concept.

This has been successfully used in certain disciplines such as cancer screening, but it is less common in general radiology reporting practice.

##### Report Presentation

This aspect of structure involves guiding how the report content is presented to readers.

While Report Content Structure and Report Content Encoding Structure focus on imposing structure to data elements, they do not impose any requirements on how these data elements will be presented to the user. The FHIR `Composition` resource is designed for presentation structure using elements like *section*.

> As of FHIR R4, FHIR `DiagnosticReport` and `Composition` are two independent resources with no explicit relationship. Future versions of FHIR may integrate FHIR `DiagnosticReport` and `Composition` to enable better presentation structure.

In IMR, Report Presentation is controlled by the Report Creator for rendered reports, or is controlled by the Report Reader otherwise.

##### Message Structure

In the most basic form, the clinical report is conveyed between the sender and the receiver using some kind of message format. The message format defines a structure for the overall payload, including the metadata and the actual report content. For example, HL7 v2 ORU messages or FHIR `DiagnosticReport` resources define such a message structure that governs where different content should be placed, such as patient, order, report content, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile specifies using HL7 v2 ORU as the message structure while this Interactive Multimedia Report Profile specifies using FHIR `DiagnosticReport` resource.

This Interactive Multimedia Report Profile includes specific requirements related to the Message Structure and Report Content Structure aspects described above. The IMR Profile does not include specific requirements related to Report Content Encoding, although coded content is permitted and implementations are encouraged to explore this aspect of structured reporting.

#### 1:52.4.1.2 Source of Multimedia Content

There are two sources of multimedia content for radiology reporting:

- User-defined
    - These are the content provided by the user. This includes, but is not limited to, annotations, measurements, image references, etc.
- System-defined
    - These are the content provided by a system. For example, a parametric map generated by the modality or region of interest generated by an AI model.

These content should be available to the report authoring system so that it can incorporate the details automatically.

#### 1:52.4.1.3 Communication of Multimedia Content

A key element for an interactive multimedia report is the ability to include relevant images and associated clinical findings such as measurements, region of interest (ROI), etc. with interactive links to the source images.

Traditionally, these annotations, markups, presentation states, and key images could be captured as DICOM objects such as Grayscale Softcopy Presentation State (GSPS), Structured Report (SR), or Key Object Selection Document (KOS). However, these objects are designed to capture evidence for long-term reference instead of real-time communication or composition. Some PACS will create these evidence objects at the end of a session in order to capture all the data points created by the image-centric specialist in one object, rather than create multiple evidence objects resulting in one per data point. As a result, these evidence objects in DICOM are good resources for subsequent interactive access when viewing an IMR, but may not be good candidates as as a mean to communication report contents from the PACS to the reporting system during a reporting session.

As the image-centric specialist captures measurements, regions of interest, and other data points, ideally the PACS can provide those data points to the reporting system in real-time without introducing any unnecessary interruptions, or adding transitory content to the permanent record. There is currently no widely adopted standard mechanism to support this real-time communication. Some reporting systems provide proprietary API that the PACS can leverage to achieve this.

> Note: IMR focuses on encoding multimedia content in a report by the Report Creator, and interactive display requirements by the Report Reader. Real time communication is out of scope of IMR and may be addressed in future profiles.

#### 1:52.4.1.4 Placement of Multimedia Content

A rudimentary approach is to place all references/multimedia content at the bottom of the report.

Although this can be useful, a more sophisticated placement of multimedia contents is the ability to insert them in context of the findings and impressions. Consider this sample finding statement

```
Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station
```

References to measurements and/or images can be added as hyperlinks in context as follow:

```
<span class="imr-ref-ImagingSelection" id="ImagingSelection/12345">Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station</span>
```

As a result, a user can access the matching multimedia content in context while reading the report.

This sophisticated placement of multimedia contents requires a more complex interaction between the PACS and the Reporting System because both systems need to know the current context and be able to mark their respective data accordingly. This also requires a low latency communication because any pause required by the radiologist to synchronize the two systems during a reporting session will cause significant distraction to the radiologist.

Report Creators in IMR are required to support placing image references in context of the findings and impressions.

#### 1:52.4.1.5 Observation Imaging Context in Report 

An observation imaging context in IMR can include image references and non-image references.

> Note: IMR focuses on specifying references to observation imaging context in a report. Other references to external resources (e.g. ACR Lung-RADS website, citations or report reader surveys) are out of scope of IMR.

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

In addition to image references, an observation imaging context may also specify non-image references such as locations, regions, annotations, etc. These non-image references refers to data encoded using various DICOM objects such as Structured Report (SR), different types of Presentation States (PR) and Segmentation.

Each non-image reference in a report is in the context of an image reference. Furthermore, each non-image reference includes one of the following context detail patterns:

- a rough location (e.g. an arrow pointing to a point of interest)
- a specific location (e.g. a specific coordinates in an image))
- a specific region (e.g. a contour of lesion boundary)
- a bounding region (e.g. a box or circle around a feature of interest)
- a measurement (e.g. a line segment in an image and the length of the line)

> Note: See [AI Results](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf) Section 6.5.3.4, 6.5.3.5 and 6.5.3.6 for details regarding how locations, regions and parametric maps are captured as DICOM objects.

#### 1:52.4.1.6 DiagnosticReport Referenced Resources

Multimedia reports are encoded using a FHIR `DiagnosticReport` resource as the top level resource. The `DiagnosticReport` resource references other resources that provide additional report content, imaging procedure context, and organizational context. Some of these referenced resources are created and managed by other enterprise systems (e.g. the patient resource is managed by the EMR). Others are created together with the `DiagnosticReport`.

##### Imaging Procedure Context

Prior to reporting, the EMR creates an order, which provides the procedure context for the report.

During reporting, the radiologist views the study to be reported, and possibly one or more other studies for comparison.

A `DiagnosticReport` resource may reference a `ServiceRequest` resource to capture the procedure information. A `DiagnosticReport` resource also references one or more `ImagingStudy` resources to capture the reviewed studies.

Although the procedure and imaging study exist in other systems prior to reporting, the corresponding `ServiceRequest` or `ImagingStudy` resources may not. Therefore even though the Report Creator is not the source of truth for the order and imaging studies, the Report Creator may create these dependent resources along with `DiagnosticReport` during report creation.

##### Report Content

At reporting time, the Report Creator captures the findings and measurements reported by the radiologist as narrative text. These narrative text are stored in FHIR `DiagnosticReport.text`.

The narrative text may include `ImagingSelection` resources to capture the observation imaging context so that the user can view the corresponding images and measurements at a later time.

Since a `DiagnosticReport` resource is the top level resource used to capture a multimedia report, every time a multimedia report is created, a `DiagnosticReport` resource is created.

##### Organizational Context

In additional to the imaging procedure context and the report content, a report also captures organizational context such as the patient which is the subject of the report, which organization is responsible for the report, and who is responsible for the report content. Generally the EMR manages the patient records, the organization structure and the pool of practitioners available. 

A `DiagnosticReport` references organizational level resources such as `Patient`, `Organization`, `Practitioner` and `PractitionerRole`. Since these organization context exist prior to the report being created and are managed by systems other than the reporting system, it is a prerequisite that these organizational resources already exist prior to the creation of `DiagnosticReport` resource. As a result, a Report Creator will only reference these organizational resources during report creation.

#### 1:52.4.1.7 Inter-Enterprise Use Cases

Supporting inter-enterprise use cases will involve addressing additional issues such as external users access control, potentially resolving links, potentially including resources such as patient when they may not be known or exist in the receiving hospital, or may need to be reconciled on receipt.

To handle inter-enterprise use cases, the currently profile does not address these issues. Future updates may address them.

#### 1:52.4.1.8 Referenced FHIR Resource vs Contained FHIR Resource

A `DiagnosticReport` resource incorporates other resources. According to FHIR, those other resources can be incorporated as either referenced FHIR resources or contained FHIR resources. In IMR, when storing a `DiagnosticReport` resource, all incorporated resources are included as referenced. Contained resources are not permitted in IMR because they cannot be retrieved as independent resources. 

Contained resources are not preferred when resources have independent identity from the containing resource. This is because contained resources cannot be reused across multiple resources. If the same content is included multiple times, such duplication can lead to possible integrity problems.

A FHIR server that provides the FHIR [Search](http://hl7.org/fhir/search.html) capability returns query responses with references to other resources, such as `Patient`, `IMR ServiceRequest`, `IMR ImagingStudy`, etc. To access the content of referenced resources, the requester will have to retrieve them separately.

Optionally, a FHIR server may support the [_include](http://hl7.org/fhir/search.html#include) search result parameter. If the requester specifies this parameter in the search request, then the FHIR Server will include the specified referenced resources in the same response. The advantage is that the requester only needs to issue a single query request and the result will contain all the necessary data. The disadvantages are (1) the payload size may increase significantly, (2) the server will need to perform more work and may return the response slower, (3) it is an optional capability of the server so the requester cannot depend on it being available.

### 1:52.4.2 Use Cases

The IMR Profile encodes multimedia content in diagnostic reports such that later the user can interact with the linked multimedia content in the reports.

#### 1:52.4.2.1 Use Case 1: Pre-Rendered Report

##### 1:52.4.2.1.1 Pre-Rendered Report Use Case Description

The Report Creator encodes the diagnostic report with multimedia content when saving dictated report. This use case shows the multimedia report being stored in the Report Repository. Alternatively, the Report Creator could send the report directly to one or more Report Readers and/or Rendered Report Readers.

Later, a Clinician wants to review studies and associated diagnostic reports for a patient. She searches the EMR for the patient. The EMR returns a list of studies and associated diagnostic reports for the patient, from which she selects the report of interest.

##### 1:52.4.2.1.2 Pre-Rendered Report Process Flow

<div>
{%include uc1-presenting-interactive-report-presentedform.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.1.2-1: Pre-Rendered Report Process Flow in IMR Profile**

#### 1:52.4.2.2 Use Case 2: Locally Processed Report

##### 1:52.4.2.2.1 Locally Processed Report Use Case Description

This use case is similar to Use Case #1, but instead of presenting the pre-rendered report content included in the multimedia report, the Report Reader processes the multimedia report according to its own rendering configuration.

Later, the Clinician clicks on the interactive links included in the report. The EMR (Report Reader) fetches the images and other related observation imaging context such as measurements and present them to the user. 

Furthermore, the EMR presents additional interactive tools to the Clinician. For example, the Clinicians can scroll through the images within the series.

##### 1:52.4.2.2.2 Locally Processed Report Process Flow

Figure 1:52.4.2.2.2-1 shows how the Clinician can use the EMR with native IMR Report Reader support to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-standalone.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.2.2-1: Locally Processed Report Process Flow in IMR Profile**

#### 1:52.4.2.4 Use Case 3: External Image Viewer

##### 1:52.4.2.4.1 External Image Viewer Use Case Description

This use case is similar to Use Case #2, but instead of locally processing the report content, included in the multimedia report, the EMR locally processes the report content, and invokes an external viewer which handles presenting the images and associated multimedia reports as in Use Case #1.

##### 1:52.4.2.4.2 External Image Viewer Process Flow

Figure 1:52.4.2.4.2-1 shows the Clinician using the EMR to show the report content, which in turn invokes an external viewer to enable interactive display of images and other observation imaging context.

<div>
{%include uc4-presenting-interactive-report-EMR.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.4.2-1: External Image Viewer Process Flow in IMR Profile**

#### 1:52.4.2.5 Use Case 4: Comparison Study With Multimedia Report

##### 1:52.4.2.5.1 Comparison Study With Multimedia Report Use Case Description

A radiologist is in the process of dictating a study. Comparison studies are displayed along with the current study. The comparison studies have associated multimedia reports. The Report Reader integrated with an Image Display displays the multimedia reports to the radiologist with interactive links. When the Radiologist clicks on the links, the Report Reader triggers the viewport in the Image Display currently showing the comparison study to show the specific images in which the measurements are derived from, and the annotations and measurements overlay on top of the images.

##### 1:52.4.2.5.2 Comparison Study with Multimedia Report Process Flow

Figure 1:52.4.2.5.2-1 shows how the Radiologist can use the PACS workstation (Image Display) that is integrated with IMR Report Reader to interact with the multimedia content available in the report.

<div>
{%include uc5-presenting-interactive-report-PACS.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.5.2-1: Comparison Study with Multimedia Report Process Flow in IMR Profile**

## 1:52.5 IMR Security Considerations

Refer to RAD TF-1x: Appendix F “Security Environment Considerations”.

Protected Healthcare Information (PHI) is present in the DICOM instances being stored, retrieved, processed, and displayed, as well as in the API being invoked.

See ITI TF-2: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations) for security considerations on FHIR based transactions.

General [Security and Privacy guidance](http://hl7.org/fhir/secpriv-module.html) is provided in the FHIR Specification.

### 1:52.5.1 Security Considerations for Actors

This profile strongly recommends all actors group with an ITI ATNA Secure Application or
Secure Node Actor using the Radiology Audit Trail Option.

The ATNA Profile requires actors to implement:
- [Record Audit Event](https://profiles.ihe.net/ITI/TF/Volume2/ITI-20.html) [ITI-20] transaction which would record when and where analysis results are distributed and displayed.
- [Authenticate Node](https://profiles.ihe.net/ITI/TF/Volume2/ITI-19.html) [ITI-19] transaction to further ensure the integrity of transactions via node authentication and communication encryption.

Furthermore, for the FHIR-based transactions, this profile strongly recommends the use of ITI [Internet User Authorization](https://profiles.ihe.net/ITI/TF/Volume1/ch-34.html) (IUA) Profile to ensure that communications are only allowed for authenticated and authorized users and/or systems.

### 1:52.5.2 Security Considerations for Multimedia Reports

Multimedia report instances as defined in this profile contain personal demographic information
and clinical information. It is appropriate for products implementing the Interactive Multimedia Report Profile to include appropriate PHI controls. Specifying such mechanisms and features is outside the scope of this profile.

The rendered report included in the `DiagnosticReport` resource may be referenced by a URL. The rendered report itself may also include hyperlinks for image references. It is recommended for any deployment to have network configurations that only allow trusted known clients (e.g., by IP address or subnet) to access the hyperlinks.

The Rendered Report Readers should verify if these URLs are legitimate and from a trusted source, minimizing the chance of phishing attack and executing malicious scripts embedded inside a report.

## 1:52.6 IMR Cross-Profile Considerations

Table 1:52.6-1 describes various actors in various other profiles that might be useful to group with
IMR Profile actors.

**Table 1:52.6-1: Interactive Multimedia Report - Optional Actor Groupings**

<table class="grid">
  <thead>
    <tr>
      <th>IMR Actor</th>
      <th>Might group with</th>
      <th>Potential Purpose</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="9">Report Creator</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf">RD Report Creator</a></td>
      <td>To send reports using HL7 ORU if the HL7 Text Report Option is supported</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Evidence Creator</a></td>
      <td>To re-measure the observations in the multimedia report and generate new report (addendum)</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_MRRT.pdf">MRRT Report Creator</a></td>
      <td>To use report templates to assist the radiologist in creating the diagnostic report, and capture the final report in the IMR multimedia report format</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf">AIR Evidence Creator</a></td>
      <td>To include AI results in the diagnostic reports</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/PIXm/index.html">PIXm Patient Identifier Cross-Reference Consumer</a></td>
      <td>To obtain the patient resource reference required in the diagnostic report</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/PDQm/index.html">PDQm Patient Demographics Consumer</a></td>
      <td>To obtain the patient resource reference that is the subject in the diagnostic report</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/MHD/index.html">MHD Document Source</a></td>
      <td>To store a report as a document using FHIR DocumentReference resource as an alternative method for different destinations or recipients.</td>
    </tr>    
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/mCSD/index.html">mCSD Care Services Selective Consumer</a></td>
      <td>To obtain the organization, facilities and practitioner resource references that are required for the diagnostic report</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor</td>
    </tr>
    <tr>
      <td rowspan="2">Report Repository</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf">RD Report Manager</a></td>
      <td>To manage both text reports and multimedia reports. May also support converting reports from one format to another</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Resource Server</a></td>
      <td>To enforce only authorized access to the resources stored in the repository</td>
    </tr>
    <tr>
      <td rowspan="6">Report Reader</td>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf">RD Report Consumer</a></td>
      <td>To be able to consume both text reports and multimedia reports.</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol1.pdf">SWF.b Image Display</a></td>
      <td>To support the display requirements for observation imaging context in the multimedia report</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_IID.pdf">IID Image Display Invoker</a></td>
      <td>To delegate the display requirements for observation imaging context to an external Image Display (See Note 1)</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_BIR.pdf">BIR Image Display</a></td>
      <td>To support the display requirements for observation imaging context in the multimedia report</td>
    </tr>
    <tr>
      <td><a href="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_AIR.pdf">AIR Image Display</a></td>
      <td>To show analysis results that are captured in AIR results format</td>
    </tr>
    <tr>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor</td>
    </tr>
    <tr>
      <td>Rendered Report Reader</td>
      <td><a href="https://profiles.ihe.net/ITI/IUA/index.html">IUA Authorization Client</a></td>
      <td>To provide authorization claims when invoking a request with another actor</td>
    </tr>
  </tbody>
</table>

> Note 1: The Retrieve Display of Series Images functionality and IHE-IMR viewer type are available in CP-RAD-474.
