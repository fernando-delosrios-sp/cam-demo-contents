# cam-demo-contents
This is a simple Terraform project that populates AWS and Azure accounts with dummy objects from the free tier of services for demo purposes. You can expect contents like these:
<img width="1745" alt="image" src="https://user-images.githubusercontent.com/64795004/187415203-ad851591-072a-4b3f-be14-7f2b40f313aa.png">
The content is mainly generated from a list of cities, departments and job titles. You can extend the provided list with your own or add your own objects, up to you.

##Installation
- You must download Terraform to run the project first.
- You should add your service provider details to the project. You can use provider.xxx.auto.tfvars files for that like the one below:
<img width="528" alt="image" src="https://user-images.githubusercontent.com/64795004/187416984-0cff599e-43cb-4b1c-a122-aaf9d55d9113.png">
Follow Terraform excellent documentation to learn how to do it.

##Running the project
- From the root folder, run "terraform init". This will initialise the project.
- Next, run "terraform apply" and type "yes" to create the contents.
- If you want to remove all previous contents, just run "terraform destroy".
