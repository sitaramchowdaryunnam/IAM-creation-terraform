# Creating some IAM users  as per requirement.

If you login with your email id and password then it is your root account. And it is not recommended to use root account for performing daily tasks. 
There are your team members who are going to work on AWS along with you. 
And they need access to particular services on AWS platform.

Users who are going to work on project are like below

No	Name	    Role	       Authorities	  Emergency Contact no
001	Raman	    ProjectAdmin  Full Admin Access	1234567890
002	Natasha     DB admin	  RDS full access	1234567890
003	Navin	    StorageAdmin  S3 bucket full access	1234567890

through terraform  had deplyed the above requirement.