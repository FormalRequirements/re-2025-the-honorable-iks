# Library management system

In today's digital era, libraries are evolving beyond their traditional role of book storage and lending. They are becoming dynamic information hubs that serve diverse user needs, ranging from borrowing physical or digital media to accessing research resources and participating in community events. However, many existing library management systems are either outdated or too rigid to support this evolution efficiently.

This project aims to explore and analyze the functional and non-functional requirements of a modern Library Management System (LMS). By applying the PEGS methodology, we intend to design a system that not only handles core library operations—such as catalog management, member services, borrowing and returning—but also supports flexibility, automation, and scalability.

## Development Workflow

We tried to structure our development approach so that each chapter of the requirements document corresponds to a GitHub issue and is implemented in a dedicated feature branch before being merged to main.

### Branching Strategy

- `main` - default branch.
- `requirements-chapter` - Branches for each requirement chapter.
-`feature/name` - Other features needed for the project.
- `gh-pages` - This branch is used to deploy HTML generated requirements on Github pages. 
 
## Requirements Documentation Strategy

We have chosen to use the [AsciiDoc (adoc) template](https://tinyurl.com/xdnykuna) provided by  [requirements.university](https://requirements.university/). The file which contains LMS requirements is [Requirements.adoc](https://tinyurl.com/3bz7uhuv). This choice allows us to structure our documentation clearly, while adhering to PEGS methodology standards. The final version of the document will be rendered in HTML format, ensuring readability and accessibility for evaluation or further reuse. Follow this [link](https://formalrequirements.github.io/re-2025-the-honorable-iks/) to see the generated output.

## CI/CD and Testing Approach

To support future integration in a CI/CD process, we implemented automated checks that validate the consistency and completeness of the requirements. In particular, we will wrote tests that ensure mandatory chapters are never left empty. For further information check the Github workflow [pipeline](.github/workflows/ci-cd.yml).
