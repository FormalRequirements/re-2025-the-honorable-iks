# Library management system

In today's digital era, libraries are evolving beyond their traditional role of book storage and lending. They are becoming dynamic information hubs that serve diverse user needs, ranging from borrowing physical or digital media to accessing research resources and participating in community events. However, many existing library management systems are either outdated or too rigid to support this evolution efficiently.

This project aims to explore and analyze the functional and non-functional requirements of a modern Library Management System (LMS). By applying the PEGS methodology, we intend to design a system that not only handles core library operations—such as catalog management, member services, borrowing and returning—but also supports flexibility, automation, and scalability.

## Requirements Documentation Strategy

For this project, we have chosen to use the AsciiDoc (adoc) template provided by requirements.university. This choice allows us to structure our documentation clearly, while adhering to PEGS methodology standards. The final version of the document will be rendered in PDF format, ensuring readability and portability for evaluation or further reuse. 

## CI/CD and Testing Approach

To support future integration in a CI/CD process, we plan to implement automated checks that validate the consistency and completeness of the requirements. In particular, we will write tests that ensure mandatory PEGS fields (such as project name, goal definitions, etc.) are never left empty.

Our initial tests will be simple scripts that parse the exported version of the requirement document and verify that key fields are filled in. This validation will be triggered automatically upon updates to the repository, allowing us to maintain a minimum quality standard and catch potential gaps early in the process.

