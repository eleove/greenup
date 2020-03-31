Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

# Create and publish images of a script
Create an image and publish it to **Docker registry** so that your script can be executed by the Data Eng team.

## 1 - Goal of the folder
This folder's goal is to enable Payfiters (Ops and Data Analysts for instance) to run a job on a specific schedule. This job will not need to be run locally anymore, it will be run on the Data Engineering team's stack (**Airflow**).

For that, you'll need to test your code locally and then follow the instructions *(see: **2 - Instructions** for more details)*.

What will be done to achieve this?
- You'll create what we call an **image**, which contains: your code, the system dependencies and only the packages needed. Thus, if anyone takes this image and run it on a new and isolated environment (**container**), the code will execute the same way for everyone /  any lambdas, etc.
- When created, it will be published on Docker Registry, which contains many images. The creds to access Docker Registry are available in `docker_registry_creds`
- The Data Engineers will use this image to run your job on a container, using **Airflow** that schedules the other jobs - they will then be able to schedule the job, detect if it ever fails and if so, understand why.
- Some credentials like tokens or passwords mustn't be in the image because otherwise they would be published - so what to do? You'll use environment variables, which won't be in the image:
    - To test locally, you put them in the `.env` file that won't be included in the image *(see: **2 - Instructions** for more details)*
    - Airflow will know about these variables because we will write them in a file that only Airflow knows and that is protected from the outside.


## 2 - Instructions on how to build an image

0. Be sure your code is running on your laptop 

1. Clone the repository using SSH: `git@github.com:PayFit/datapps.git` *(you may need to add an SSH key, in this case follow these instructions: https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)*

2. Create your folder at the root.
Advice: if your code is in Python, copy-paste the folder `template-python` instead of creating yours from scratch. It enables to have a structure and only copy-paste your script inside a file.
Your folder is now alongside the Python template folder. It must be at the root of the folder.

These instructions are for those who copy-pasted the template folder. You can create your own folder, but the template enables to quickly create your image and publish it on the Docker Registry. You can take whatever you need from the template to achieve the same.

3. Insert your script
- Copy-paste your code into `app/main.py`, with a function that has a relevant name
- Write into `__name__ == __main__`, the name of the function you've just created
- Be sure that your packages are written at the top of the file to be imported

4. Use virtual environment and source the one already there.
Don't put any credential (password, token, username, etc.) inside your code as it may be seen and used by others
- Create a file `.env` in your folder and inside, write one after the other (one credential per line) your different credentials, ex: ZENDESK_TOKEN="K8Gh762iOL@K"
The env variables should be in capital letters.
- Inside the `main.py`, write `import os` (required to import environment variables)
- Within your main function, import your env variables doing: `my_credential = os.environ['MY_CREDENTIAL']`

5. Complete the `requirements.txt` file
- Write the packages you need inside the `requirements.txt` (specify the version using ==)
To know the latest version of a package, go to your search engine and type 'pypi [your_package_name]' (ex: 'pypi lxml'). Open the pypi.org URL and you'll see the latest release.
Remark: some packages do not have a latest release (ex: os, time)

6. Build your image and push it
- Be sure you have **Docker** installed (if you don't, follow these instructions: https://docs.docker.com/docker-for-mac/)
- Go to **1Password**, in the 'datapps' safe and download the file `docker_registry_creds`. Put in your your folder.
- Open a terminal and go inside your folder: `cd my_folder_script` (you won't be able to execute the following commands if you are not in it)
- Write in the console `source docker_registry_creds` so that the variables become known by your environment (required to publish your image)
- Choose a relevant name for the image that will be used by the Data Engineering team to run your script - ex: `write_spreadsheet_algolia`
- Write in the console `make push-image name_image="name_you_have_choosen"` (this step can take a few minutes)

Remark: If you have some errors, it may be because some system dependencies need to be installed: write them in the `sys_deps.txt` file

7. Test your image
- Execute in the console `make test-image name_image="name_you_have_choosen"`
- Check if your code has been executed

8. When this is the case, create a pull request on the folder specifying:
- the name of the image you've just created
- the schedule of the job
- if that task depends on another one (ingestion of a stream for example)
- if you have environment variables *(and if so, give their names so that the Data Eng team can check if they already have them on Airflow or if these env variables need to be added)*

You can ask the Data Engineering team some advice about your script / errors if you encounter some of course!

## 3 - Organization of the folder

Inside your folder / template folder:
- `app`: where you create your code, `init` is there to package your code, you'll have to insert your code in the `main.py`file
- `.dockerignore`: it's what will not be inserted within the image you build and publish, for instance, the environment variables because you don't want them to be published (since it's a hidden file, you'll need to use `ls -a` to see it)
- `Dockerfile`: all the instructions to build your image. The CMD enables to tell the image what to do when a container is running. In this case, the CMD command corresponds to your script that is executed when the container is running meaning when the job on Airflow is up.
- `.env`: the environement variables that you use to test locally your code (they won't be included in the image)
- `docker_registry_creds`: the creds required to connect to Docker registry and publish images (they won't be included in the image)
- `Makefile`: enables to execute commands more easily. `make ...` will execute several commands.
- `requirements.txt`: it contains all the packages you use in your code
- `sys_deps.txt`: dependencies required by the system and required for some packages

Inside the global folder:
- `.gitignore`: if you use GitHub to save your work, all files included in it will not be versioned
