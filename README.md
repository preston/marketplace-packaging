# Marketplace Metadata & Packaging

This repository contains the JSON schema definitions (and corresponding examples) for the Logica/HL7 Marketplace Product Packaging & Metadata specification. Publication of any health IT software product compliant with the Marketplace API _must_ be packaged accordingly and include a corresponding `build.json` file unique to each build intended for publication, such that the product can be distributed to any number of runtime environments for automated deployment at scale.

Product "packaging" boils down to the process of building applications in a more conventionalized manner than OCI-compliant images (e.g. those already) alone can produce, since:

* Usage metering is required via a set of predefined configurations injected at product runtime, even for content-only assets.
* Dependency versioning issues must be resolvable both at the time a product is published and deployed. 
* Certain types of software, such as SMART-on-FHIR applications, require certain configuration parameters specific to the target environment.
* The Marketplace API is agnostic to orchestrators, and does not want developes presuming specific features of Kubernetes, Swarm, OpenShift etc will be available.
* Every software (or content) product MUST be deployable automatically without manual tweaking. The simpler the better.
* Marketplaces can only generate stack configurations, e.g. via docker-compose.yml, kompose and other orchestration files, if the required configuration parameters can be resolved in advance against capabilities of the runtime environment. 


# Examples

## Static Content Products
The simplest type of product is one or more static assets that are sold and licensed in a "utility" model. That is, each access is securely authorized and logged against a "meter" used for analytics and billing. In this context, the "product" is simply a set of static files wrapped in a runtime authorization and metering wrapper against Marketplace-compatible APIs. Those capabilities provided the basis for sophisticated sales and licensing model.

## SMART-on-FHIR Software Products

SoF (SMART-on-FHIR) applications and user interfaces (UI) backed by a FHIR API and the authentication and authorization flow of OpenID Connect. are not always 


# Deploying

The files in this project are distributed in pre-built containers. To build your own:
    docker build -t p3000/marketplace-packaging:latest .

To run your own at http://localhost:8080
    docker run -it --rm -p 8080:80 p3000/marketplace-packaging:latest

# Attribution
Preston Lee (GitHub: @preston)
