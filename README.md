# ccdi-devops
DevOps repo for CCDI

## Repository Structure

root
|-- terraform
|-- |-- constructs
|-- |-- modules
|-- |-- |-- aws
|-- |-- |-- newrelic

## Module Structure

### Resource Composition
Modules are meant to be small and manageable. Each module should contain the least amount of unique resources as possible. Services like Simple Storage Service (S3) may contain multiple 

### Folder Structure


## Naming Conventions
Naming conventions increase portfolio standardization, keep repositories organized, ensure resource interoperability, simplify component inventory management, and enhance observability capabilities. 

### Module Naming Conventions
Modules are named with the standard resource class, except the name of the cloud provider will be dropped (use "iam_role" instead of "aws_iam_role"). Add a suffix for opinionated configurations that describes the intended use (such as iam_role_ecs_task_execution).


### Resource Naming Conventions
 Resource naming conventions are enforced through the structure of modules. All resources that have a name attribute shall be described by the stack that the resource belongs do, as well as the description of the resource that portrays the resource's type, class, or purpose. The stack is defined by the program and project the system belongs to, as well as the tier or environment. 

{ program } - { environment } - { project } - { resource_description }

The only allowable deviation is observed for AWS Identity and Access Management (IAM) resources, which require a prefix to conform to NCI CloudOne governance policy.

{ iam_prefix } - { program } - { environment } - { project } - { resource_description }


## Resource Tagging
We leverage the features that Terraform offers for tagging resources through provider configuration. The AWS Terraform Provider offers a block for default arguments. When initializing new projects, please use the following default tag configuration:

<pre><code>placeholder</code></pre>

All tags should be provided with lower case alphanumeric characters. 

## Stack/State Logical Separations