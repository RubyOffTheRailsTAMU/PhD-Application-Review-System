# PhD-Application-Review-System

Organization:	Department of Computer Science and Engineering
Contact name:	Prof. Khanh Nguyen
Contact email:	khanhtn@tamu.edu

**Client's description of the project**
The PhD Admission process currently solicits reviews from committee members and faculties using a Google Sheet. PARC would like to have a system built that can help with the admission process.

1. it should help faculties easily filter applications of interest.
2. it should make the reviews input easy for faculties.
3. it should help support staff keep track of status of each application.

   
**Additional information provided by the client**
Green-light from the department head might be required before the work can start.

Ideally we would want to use TAMU credentials (one less account for faculties and staff to create) for users. Can it interact with webadmit API Links to an external site.? 

Note from Prof. Ritchey: consider it green-lighted, but see my advice below.

**Advice from Prof. Ritchey**
1. Use Ruby on Rails.
2. Focus on Functionality.
  a. Data security is critical due to FERPA.
    i. Keep all PII encrypted at rest, or don't store it at all if you don't need it.
    ii. Default = deny access.  Use whitelists to allow users access.
  b. Talk to several different faculty members about their experiences with the existing PhD application review system.
  c. Use OAuth2.0 to provide "Login with Google"
    i. use whitelisting to limit user access, e.g. must be a CSE faculty member to review PhD applications
  d. Make integration with WebAdMIT API a priority.
3. Adhere to BDD and TDD.
