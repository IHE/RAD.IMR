### 2:4.Y5.1 Scope

This transaction is used to present the images referenced in a multimedia report to someone, such as a radiologist or a clinician, in such a way that permits the user to interact with the images.

This transaction is not a typical IHE transaction between two devices; the primary focus is on the required behavior of the display rather than messaging between two actors. This can be thought of as an “informational transaction” between a display device and a user.

The specification is about the baseline display behaviors required for image references included in multimedia reports. As with many IHE specifications, the display may have behaviors in addition to those required by this transaction.

### 2:4.Y5.2 Actors Roles

The roles in this transaction are defined in the following table and may be played by the actors shown here:

**Table: Actor Roles**

**Introduce Display role**

| Role      | Description                                   | Actor(s)          |
|-----------|-----------------------------------------------|-------------------|
| Display | Presents images to a user, such as a radiologist    | Report Reader <br> Image Display |
{: .grid}

Transaction text specifies behavior for each role. The behavior of specific actors may also be specified when it goes beyond that of the general role.

### 2:4.Y5.3 Referenced Standards

**DICOM PS3.3**: A. Composite Information Object Definitions

### 2:4.Y5.4 Messages

<div>
{%include RAD-Y5-seq.svg%}
</div>
<br clear="all">

**Figure 2:3.Y5.4-1: Interaction Diagram**

#### 2:4.Y5.4.1 Display Images Message
The Display presents the images referenced in a report to the user.

##### 2:4.Y5.4.1.1 Trigger Events

A user or an automated function determines that one or more images should be presented.

##### 2:4.Y5.4.1.2 Message Semantics

The images are encoded as DICOM SOP instances.

Display of images does not depend on how the images were obtained by the Display.

#### 2:4.Y5.4.1.3 Expected Actions (i.e. Display Requirements)

The behaviors in this section are specified as baseline capabilities. Displays may have additional or alternative capabilities that may be invoked or configured.

This transaction does not specify particular SOP classes that must be displayed.

Displays shall be able to display images from SOP classes with the following characteristics:
- Pixel Data (7FE0,0010) data element present
- Bits Allocated (0028,0100) of 8 or 16
- Bits Stored (0028,0101) values of 1 or 8 for Bits Allocated (0028,0100) of 8
- Bits Stored (0028,0101) values of 9 to 16 inclusive, for Bits Allocated (0028,0100) of
16
- High Bit (0028,0102) of one less than Bits Stored (0028,0101) (i.e., in the low bits of
600 the word, without packing)
- Samples Per Pixel (0028,0002) of 1 or 3
- Photometric Interpretation (0028,0004) of MONOCHROME1, MONOCHROME2, RGB, PALETTE COLOR, and any appropriate value for any multi-component compressed transfer syntaxes that are supported (e.g., YBR_FULL_422 for JPEG)
- Planar Configuration (0028,0006) of 0 or 1 for RGB Photometric Interpretation (0028,0004) (i.e. color-by-pixel or  color-by-plane)
- Pixel Representation (0028,0103) of 0 or 1 for MONOCHROME1 and MONOCHROME2 Photometric Interpretation (0028,0004) (i.e. signed or unsigned)
- Number of Frames (0028,0008) absent or with any value (i.e., single or multi-frame images)

The Display shall support the following subset of image viewing capabilities as defined in [Basic Image Review (BIR)](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_BIR.pdf) Profile, Section 4.16.4.2.2.5 when showing the images:
- Windowing and Rendering (Section 4.16.4.2.2.5.4)
- Zooming and Panning (Section 4.16.4.2.2.5.6)
- Annotation (Section 4.16.4.2.2.5.8)
- Measurements (Section 4.16.4.2.2.5.10)

The Display may provide basic viewing tools for the user to interactive with the images.

If the Display supports the Series/Study Navigation Option, the Display shall support the following additional interactive behavior:
- Scrolling (Section 4.16.4.2.2.5.5)

> Note that the Display is only required to display objects specifically referenced in the DiagnosticReport resource. If display of images from a plane (e.g. coronal or sagittal) other than the plane used during acquisition (e.g. axial) is necessary, then images on these other planes should be reconstructed (e.g. using multiplanar reconstruction), created as separate set of images and referenced in the DiagnosticReport resource. The Display is not required to support reconstruction.

### 2:4.Y5.5 Security Considerations

This transaction involves presenting DICOM objects that typically constitute personal health
information (PHI) to human observers who are typically clinicians. Typical access controls and
audit trails in accordance with local policies would be appropriate.

#### 2:4.Y5.5.1 Security Audit Considerations

The Radiology Audit Trail Option in the ITI Audit Trail and Node Authentication Profile (ITI TF-1:9) defines audit requirements for IHE Radiology transactions. See RAD TF-3: 5.1.

#### 2:4.Y5.5.2 Display Specific Security Considerations

Since this transaction involves the display of PHI, it may be reasonable for the Displays to implement typical access controls for patient records, such as logins for users and role-based access policies. Since this transaction involves parsing datasets generated by other systems, it may be reasonable for the Displays to implement basic digital hygiene, such as sanitizing datasets to avoid malicious executable scripts that might be executed by a browser-based viewer.
