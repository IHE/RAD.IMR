

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
      <td>Display Images [RAD-145]</td>
      <td>N/A (Note 2)</td>
      <td>R (Note 3)</td>
      <td><a href="RAD-145.html">RAD TF-2: 4.145</a></td>
    </tr>
    <tr>
      <td>WADO-RS Retrieve [RAD-107]</td>
      <td>Initiator</td>
      <td>O</td>
      <td>RAD TF-2: 4.107</td>
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

> Note 3: A Report Reader is required to support the Display Images [RAD-145] transaction which defines the display behavior of images. This requirement can be satisfied by either implementing the required behaviors, or grouping with another actor (e.g. Image Display Invoker in IID) that provides the required behaviors.

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

When users click on the hyperlinks, the Report Reader presents the referenced images to the user in a way that the user can interact with the images (e.g., windowing, zooming, panning, toggle annotations, etc.).

A Report Reader shall provide [Level 2 Interactivity](#152416-level-of-interactivity), i.e., intermediate image viewing capabilities, as discussed in Section 1:52.4.1.6. A Report Reader may support additional advanced behavior. 

> Note: The Report Reader may satisfy the baseline image viewing capabilities by retrieving DICOM objects and rendered by itself, or retrieve rendering of DICOM objects using WADO-RS Retrieve [RAD-107], or a combination of both.

> Note: The retrieve rendered images functionality of WADO-RS Retrieve [RAD-107] is available in CP-RAD-475.

A Report Reader shall use the information in DiagnosticReport.result.derivedFrom.endpoint.address and DiagnosticReport.result.component.valueString to construct valid WADO-RS URLs that conform to the semantics as RetrieveInstance or RetrieveFrames as defined in WADO-RS Retrieve [RAD-107] to retrieve the corresponding original DICOM objects or rendered images.

A Report Reader that supports the Series/Study Navigation Option shall be able to construct WADO-RS URLs that confirm to the RetrieveSeries and RetrieveStudy semantics.

#### 1:52.1.1.4 Rendered Report Reader

A Rendered Report Reader presents to the user the rendered report that is embedded in the DiagnosticReport resource, including the multimedia content embedded in the report as well as all hyperlinks. When the user clicks on the hyperlinks, the Rendered Report Reader retrieves the referenced images and display them to the user.

A Rendered Report Reader shall provide [Level 1 Interactivity](#152416-level-of-interactivity) as discussed in Section 1:52.4.1.6.

> Note: There are no additional image viewing capabilities required for Rendered Report Readers. In other words, the image viewing capabilities presented by the Rendered Report Readers is limited by how the Report Creator created the rendered report. For example, for image references, one Report Creator may render them using WADO-RS links which will show a static rendered image, while another Report Creator may render them using IID Invoke Image Display links which will launch a viewer to show the referenced image with additional interactivity such as scrolling, zooming, etc.

#### 1.52.1.1.5 Image Manager / Image Archive

An Image Manager / Image Archive provides the images and related objects to the Report Readers or Image Displays.

An Image Manager / Image Archive is able to support both DICOMweb and DIMSE clients.

An Image Manager / Image Archive shall support returning images in the requested rendered media type as defined in DICOM [PS3.18 Section 9.5](https://dicom.nema.org/medical/dicom/current/output/html/part18.html#sect_9.5) "Retrieve Rendered Instance Transaction".

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
      <td>Report Reader</td>
      <td>Series/Study Navigation</td>
      <td><a href="#15223-seriesstudy-navigation-option">Section 1:52.2.6</a></td>
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

The PDF Report Option enables actors to handle rendered reports with multimedia contents in the PDF format.

A Report Creator that supports this option shall generate a rendered multimedia report, preserving the image references as either hyperlinks or embedded static images in the rendered PDF file, and embed the rendered report in DiagnosticReport.presentedForm. The Report Creator shall preserve the readability of the report in the PDF format.

A Report Creator that supports this option shall generate a rendered multimedia report, preserving the image references as either hyperlinks or embedded static images in the rendered PDF file, and embed the rendered report in DiagnosticReport.presentedForm in the Store Multimedia Reports [RAD-141] transaction. See [Rendered Report In PDF](RAD-141.html#24141412222-rendered-report-in-pdf-format) for details.

> Note: How the Report Creator lays out the report into PDF is out of scope of IMR, provided that the rendered report preserves the readability of the report. For example, if there are multiple measurements in the same paragraph, each has its separate image reference(s), then if the image references are rendered as inline static images, the resulting paragraph may be broken up and become hard to read.

A Rendered Report Reader that supports this option shall support retrieving and displaying the rendered report in PDF format.

### 1:52.2.2 HL7 Text Report Option

The HL7 Text Report Option produces a text-only version of the report for consumption by non-IMR actors.

A Report Creator that supports this option shall create a text-only rendition of the report, including the textual representation of all measurements, and may include textual representation of image references. A Report Creator shall preserve the readability of the report in the text-only format.

> For example, a textual representation of image references may look like (2,16) which means series 2 instance 16. The specific textual representation of image references is out of scope of IMR.

A Report Creator shall be able to use this text-only report to communicate the report with existing non-IMR Report Readers, for example, using HL7 v2 ORU messages, or Send Imaging Result [RAD-128] in the IHE [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile as a Report Creator.

### 1:52.2.3 Series/Study Navigation Option

The Series/Study Navigation Option involves the user being able to navigate through images in the same series or study as the image initially displayed.

A Report Reader that supports this option shall initially display the referenced image, and shall enable the user to scroll through the other images in the same series (and, optionally, in the same study) as the referenced image.

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

In a radiology report, although there are many variations of what information a report should contain depending on the procedure and specialty, there are general common sections in a report such as Indication, Methods, Findings, Impressions, etc.

The [Results Distribution](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_RD.pdf) Profile specifies using multiple OBX segments for different sections while this Interactive Multimedia Report Profile specifies using multiple FHIR DiagnosticReport.result elements which are references to Observation resources for different sections.

##### Report Content Encoding

Also known as 'structured reporting' or 'synoptic reporting', encoding structure refers to the use of fully coded values in pre-coordinated form or post-coordinated form, in which the values are drawn from some value sets or standardized nomenclature / coded values such as LOINC or SNOMED-CT, in order to represent the full concept.

This has been successfully used in certain disciplines such as cancer screening, but it is less common in general radiology reporting practice.

##### Report Presentation

This aspect of structure involves guiding how the report content is presented to readers.

While Report Content Structure and Report Content Encoding Structure focus on imposing structure to data elements, they do not impose any requirements on how these data elements will be presented to the user. The FHIR Composition resource is designed for presentation structure using elements like *section*.

> In FHIR R4, FHIR DiagnosticReport and Composition are two independent resources with no explicit relationship. HL7 is working on integrating FHIR DiagnosticReport and Composition to enable better presentation structure.

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

Note that this real time communication is currently out of scope of IMR.

#### 1:52.4.1.4 Placement of Multimedia Content

A rudimentary approach is to place all references/multimedia content at the bottom of the report.

Although this can be useful, a more sophisticated placement of multimedia contents is the ability to insert them in context of the findings and impressions. Consider this sample finding statement

```
Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station
```

References to measurements and/or images can be added as hyperlinks in context as follow:

```
<a data-imr-series="1.2.3" data-imr-object="1.2.3.1">Prominent or mildly enlarged mediastinal and bilateral hilar lymph nodes measure up to 1.2 x 0.8 cm in the right paratracheal station</a>
```

As a result, a user can access the matching multimedia content in context while reading the report.

This sophisticated placement of multimedia contents requires a more complex interaction between the PACS and the Reporting System because both systems need to know the current context and be able to mark their respective data accordingly. This also requires a low latency communication because any pause required by the radiologist to synchronize the two systems during a reporting session will cause significant distraction to the radiologist.

Report Creators in IMR are required to support placing image references in context of the findings and impressions.

#### 1:52.4.1.5 Image Context in Report 

Each image reference in a report may point to:
- a single image (e.g., Frame 10)
- a range of images across multiple single-frame objects (e.g., Object 3-5) or within a multi-frame object (e.g., Frame 10-12)
- a discrete list of images (e.g., Frame 10,14,17)
- a combination of the above (e.g., Frame 10-12,14,17-20)

In most cases, the image references refer to the same study context as the study being reported on. Occasionally, the image references may refer to a comparison study that is used during reporting.

In addition to referencing a frame as a whole, sometimes the reference is specific to a region of interest in the frame. The region of interest (ROI) can be one or more points, a line or a segmented line (e.g., polyline), a geometric shape (e.g., ellipse, polygon), or a volume (e.g., ellipsoid).

#### 1:52.4.1.6 Level of Interactivity

When interacting with multimedia reports, there are different levels of sophistication. This profile introduces the following levels of interactivity:

##### Level 0: No interactivity

The Report Reader can display the static content (text and may include static images) in the report, but provides no interactivity with the content for the user.

##### Level 1: Basic interactivity

The Report Reader can display that static content (text and may include static images) in the report, including hyperlinks to different multimedia contents in the report (e.g., measurements). The user can click on these links to access a basic view of the source image(s) from which the findings are derived.

##### Level 2: Intermediate interactivity

The Report Reader can provide not only a basic view of the source image(s), but also provide other essential features such as zoom, pan, window levelling, etc. If annotations (markup, ROI, etc.) are available, the Report Reader displays them as well and can be toggled.

##### Level 3: Advanced interactivity

The Report Reader can display not only the image referenced directly, but also the full series to which the image belongs. The Report Reader may provide other tools (e.g., measurements, more advanced image visualization, etc.) as well as support other advanced DICOM objects such as segmentation objects or parametric map objects.

#### 1:52.4.1.7 Referenced FHIR Resource vs Contained FHIR Resource

A DiagnosticReport resource incorporates other resources. According to FHIR, those other resources can be incorporated as either referenced FHIR resources or contained FHIR resources. In IMR, when storing a DiagnosticReport resource, all incorporated resources are included as referenced. Contained resources are not permitted in IMR because they cannot be retrieved as independent resources. 

Contained resources are not preferred when resources have independent identity from the containing resource. This is because contained resources cannot be reused across multiple resources. If the same content is included multiple times, such duplication can lead to possible integrity problems.

A FHIR server that provides the FHIR [Search](http://hl7.org/fhir/search.html) capability returns query responses with references to other resources, such as Patient, IMR Observation, IMR ImagingStudy, etc. To access the content of referenced resources, the requester will have to retrieve them separately.

Optionally, a FHIR server may support the [_include](http://hl7.org/fhir/search.html#include) search result parameter. If the requester specifies this parameter in the search request, then the FHIR Server will include the specified referenced resources in the same response. The advantage is that the requester only needs to issue a single query request and the result will contain all the necessary data. The disadvantages are (1) the payload size may increase significantly, (2) the server will need to perform more work and may return the response slower, (3) it is an optional capability of the server so the requester cannot depend on it being available.

#### 1:52.4.1.8 Deployment Considerations of IMR

IMR uses FHIR for defining the format of the diagnostic report as well as the protocol to communicate the report with other systems. Since FHIR is an emerging technology in many existing deployments, several considerations should be taken when deploying IMR in an existing environment:

##### Deploying IMR in environment with existing FHIR infrastructure

IMR can be deployed in an existing FHIR infrastructure. The existing FHIR Server can act as the Report Repository with some additional IMR specific support (e.g., handling of the DiagnosticReport.presentedForm). New Report Creator, Report Reader and Rendered Report Reader are introduced and they interact with the Report Repository.

In this case, many of the *organizational* level resources such as `Patient`, `Organization`, `Practitioner` and `PractitionerRole` may already exist in the Report Repository. Therefore the Report Creator may search for these existing resources prior to creating the report. When the Report Creator eventually stores the multimedia report to the Report Repository, the FHIR bundle request would reference these existing organizational resources in the new IMR DiagnosticReport resource.

##### Deploying IMR in environment without existing FHIR infrastructure

IMR can be deployed in an environment without an existing FHIR infrastructure, or in an environment in which the existing FHIR infrastructure cannot be used. In this case, a new FHIR infrastructure is required.

In this situation, although the *organizational* level resources such as `Patient`, `Organization`, `Practitioner` and `PractitionerRole` may already exist somewhere (e.g., in EMR), they may not exist in the new FHIR infrastructure used for IMR. There are two general approaches to address this situation:

- Backfill the new FHIR infrastructure with these existing *organizational* level resources, and introduce a new method for ongoing synchronization. This is out of scope of IMR.
- When the Report Creator stores the multimedia report to the Report Repository, it would use the `ifNoneExist` attribute in [Bundle.request](https://www.hl7.org/fhir/bundle.html) to specify conditional create. A separate method is still required for ongoing synchronization.

### 1:52.4.2 Use Cases

The IMR Profile is focused on encoding multimedia content in diagnostic reports such that later the user can interact with the embedded multimedia content in the reports.

Note that the IMR Profile is currently focused on intra-enterprise use cases. Other inter-enterprise use cases may be supported in future updates. The design of the current IMR should not prohibit addressing inter-enterprise use cases in the future.

#### 1:52.4.2.1 Use Case 1: Encode and Transmit Multimedia Report

##### 1:52.4.2.1.1 Encode and Transmit Multimedia Report Use Case Description

During a report dictation session, the Evidence Creator (not part of IMR) conveys multimedia contents to the Report Creator on demand as instructed by the user. (Note that the interaction between the Evidence Creator and Report Creator is out of scope for IMR.) When a dictation session ends, the Report Creator encodes the diagnostic report along with the collected multimedia content. Once completed, the Report Creator stores the multimedia report to the Report Repository, Report Reader and/or Rendered Report Reader.

##### 1:52.4.2.1.2 Encode and Transmit Multimedia Report Process Flow

Figure 1:52.4.2.1.2-1 shows the dictation session as background context, and the eventual encoding and transmission of the multimedia report by the Report Creator to the Report Repository.

<div>
{%include uc1-authoring-report.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.1.2-1: Encode and Transmit Process Flow in IMR Profile**

#### 1:52.4.2.2 Use Case 2: Consume and Interact with Multimedia Report by Advanced Consumers

##### 1:52.4.2.2.1 Consume and Interact with Multimedia Report by Advanced Consumers Use Case Description

A Clinician wants to review studies and associated diagnostic reports for a patient. She searches the EMR for the patient. As a result, the EMR returns a list of studies and associated diagnostic reports for the patient.

The Clinician selects a multimedia report and the EMR, as a Report Reader, processes the report content according to its rendering configuration and displays the reports with interactive links. The Clinician clicks on the interactive links. The EMR / Report Reader retrieves the rendered images from the Image Manager / Image Archive and displays the images with interactive tools. The Clinicians can navigate the series and see the measurements with annotations as described in the report.

##### 1:52.4.2.2.2 Consume and Interact with Multimedia Report by Advanced Consumers Process Flow

Figure 1:52.4.2.2.2-1 shows how the Clinician can use the EMR with native IMR Report Reader support to interact with the multimedia content available in the report.

<div>
{%include uc2-presenting-interactive-report-standalone.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.2.2-1: Consume and Interact with Multimedia Report by Advanced Consumers Process Flow in IMR Profile**

#### 1:52.4.2.3 Use Case 3: Consume and Interact with Multimedia Report by Basic Consumers

##### 1:52.4.2.3.1 Consume and Interact with Multimedia Report by Basic Consumers Use Case Description

This use case is similar to Use Case #2, but instead of processing the report content according to its own rendering configuration, the EMR supports the IMR Rendered Report Reader. In this case, the EMR presents a pre-rendered copy of the report that has been included in the multimedia report object.

##### 1:52.4.2.3.2 Consume and Interact with Multimedia Report by Basic Consumers Process Flow

Figure 1:52.4.2.3.2-1 shows how the Clinician can use the EMR with a native IMR Rendered Report Reader support to interact with the multimedia content available in the report.

<div>
{%include uc3-presenting-interactive-report-presentedform.svg%}
</div>
<br clear="all">

**Figure 1:52.4.2.3.2-1: Consume and Interact with Multimedia Report by Basic Consumers Process Flow in IMR Profile**

#### 1:52.4.2.4 Use Case 4: Consume and Interact with Multimedia Report by Advanced Consumers with Integrated Image Display Invoker

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

The rendered report included in the DiagnosticReport resource may be referenced by a URL. The rendered report itself may also include hyperlinks for image references. It is recommended for any deployment to have network configurations that only allow trusted known clients (e.g., by IP address or subnet) to access, and block unknown clients. In addition, the requests to these hyperlinks should be authorized. Unauthorized access should be rejected.

The Rendered Report Readers should verify if these URLs are legitimate and from a trusted source, minimizing the chance of phishing attack and executing malicious script embedded inside a report.

## 1:52.6 IMR Cross-Profile Considerations

**Scheduled Workflow (SWF.b)**: A Report Reader may be grouped with an Image Display in SWF.b to satisfy the image viewing capabilities requirements by retrieving DICOM objects via DIMSE services. The Image Display may provide additional image viewing capabilities. The grouped Image Display may be used to view prior studies as well.

**Invoke Image Display (IID)**: A Report Reader may be grouped with an Image Display Invoker in IID to satisfy the image viewing capabilities requirements. The invoked Image Display may provide additional image viewing capabilities.

> Note: The Retrieve Display of Series Images functionality and IHE-IMR viewer type are available in CP-RAD-474.

**Results Distribution (RD)**: A Report Creator that supports the HL7 Text Report Option can use Result Distribution to send the text report to other consumers.

**Basic Image Review (BIR)**: A Report Reader may be grouped with an Image Display in BIR to provide the required image display functionality.

**Management of Radiology Report Templates (MRRT)**: A Report Creator in MRRT may be grouped with a Report Creator in IMR. As a result, the grouped Report Creator can use the report templates to assist the radiologist in creating the diagnostic report, and capture the final report in the IMR DiagnosticReport format.

**AI Result (AIR)**: An Evidence Creator may be grouped with an IMR Report Creator to include AI results in the diagnostic report. An Image Display in AIR may be grouped with an IMR Image Display or Report Reader to show the interactive AI results.

**Internet User Authorization (IUA)**: TODO