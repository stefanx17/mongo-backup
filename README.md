# Mongo backup guide

0. **Install docker on your local machinels:**
	
		sudo apt-get install docker
		sudo apt-get install docker.io

0. **Install mongo on your local machine:**
	
		sudo apt-get install mongodb-clients

0. **Right now the executables should be already in PATH in /usr/bin, if not**
**you should add the path to the binaries:**
	
		export PATH=$PATH:[mongodb installation dir]/bin
    
1. **Pull the mongo docker image mongo:latest by using the command:**
    
    	[sudo] docker pull mongo:latest

2. **Run the mongo container and expose the necessary ports with the following command:**

    	[sudo] docker run -p 27017-27019:27017-27019 --name your_mongo -d mongo:latest

3. **Populate the database with some data using the populate.js script and running it 
like this:**

    	mongo --eval "var database=YOUR_DATABASE, no_entries=NO_ENTRIES" populate.js

    	example:
   
    	mongo --eval "var database='test', no_entries=10000" populate.js


4. **Backup the databse by running the backup.sh script. You should run it like this:**

   		[sudo] ./backup.sh [DATABASE_NAME]

5. **You can restore the data to another database by running the restore.sh script.**
		
		[sudo] ./restore.sh [NEW_DATABASE_NAME] [PATH_TO_BACKUP_ARCHIVE]

    	exemple:
    
    	[sudo] ./restore.sh test_restored backups/test-backup.tar.gz

6. **Stop the mongo container with the following commands:**

    	[sudo] docker stop your_mongo
    
    	[sudo] docker rm your_mongo
    
**Note:**

You need to make sure that the mongo server is the same
version as the mongo client you use on your local machine
    
    
    1. Import the private key to your system
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4


    2. Add the official MongoDB repository to the system
    echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org.list

	3.  Install the mongo binaries
    sudo apt update
	sudo apt install -y mongodb-org
