# Repository to help setting up and running WPS on Graviton3 EC2 instances
Step 1: Clone this github repository to /home/ubuntu
```
cd ~
git clone https://github.com/PSEHE/WPSonC7g.git
```
Note: more information on github for AWS at the bottom

Step 2: Set up the instance for the first time
Run the setup_instance.sh script

Step 3: Create and run the case
Run the create_case.sh script

Step 4: Copy output to S3 bucket

# Note on Github with AWS EC2 instances:

[Git on AWS](https://www.youtube.com/watch?v=RGOj5yH7evk)

[Git for beginners](https://www.youtube.com/watch?v=J_yt1IzXPes)


You may also need to update the origin for your repository if it is set to HTTPS. Do this to switch to SSH:

```
git remote -v
git remote set-url origin git@github.com:USERNAME/REPONAME.git
```
