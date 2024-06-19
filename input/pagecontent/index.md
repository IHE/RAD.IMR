The Interactive Multimedia Report (IMR) Profile specifies how a diagnostic report with interactive multimedia content can be reliably encoded, communicated and presented.

<div markdown="1" class="stu-note">
**IMPORTANT**: IMR is NOT yet recommended for production use.

Profiles released for Trial Implementation by IHE Radiology typically ARE expected to be stable enough for production use; however, this release of IMR is intended for experimental implementation and feedback.  

IMR uses the FHIR ImagingSelection resource which is at [maturity level 1](https://www.hl7.org/fhir/versions.html). Maturity 1 resources are likely to be updated in the future with backward incompatible changes.
 
IMR uses the FHIR DiagnosticReport resource to model specialty agnostic imaging reports with interactive multimedia content. Further modeling may expose issues which also result in backward incompatible changes.
 
Experimental implementation feedback may also result in other backward incompatible changes to the profile.

| [Significant Changes; Open and Closed Issues](issues.html) |
{: .grid}

</div>


### Organization of This Guide
This guide is organized into following sections:

1. Volume 1: Integration Profile 
   1. [Introduction](volume-1.html)
   1. [Actors and Transactions](volume-1.html#1521-imr-actors-transactions-and-content-modules)
   1. [Actor Options](volume-1.html#1522-imr-actor-options)
   1. [Actor Required Groupings](volume-1.html#1523-imr-required-actor-groupings)
   1. [Overview](volume-1.html#1524-interactive-multimedia-report-overview)
   1. [Security Considerations](volume-1.html#1525-imr-security-considerations)
   1. [Cross Profile Considerations](volume-1.html#1526-imr-cross-profile-considerations)

2. Volume 2: Transaction Detail
   1. [Store Multimedia Report [RAD-141]](RAD-141.html)
   1. [Display Multimedia Report [RAD-142]](RAD-142.html)
   1. [Find Multimedia Report [RAD-143]](RAD-143.html)
   1. [Retrieve Rendered Multimedia Report [RAD-144]](RAD-144.html)

3. Other
   1. [Changes to Other IHE Specifications](other.html)
   2. [Download and Analysis](download.html)
   3. [Test Plan](testplan.html)


Click on any of the links above, navigate the contents using the [Table of Contents](toc.html), or
if you are looking for a specific artifact, check out the [Artifacts Summary](artifacts.html).