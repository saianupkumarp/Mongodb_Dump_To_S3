# Mongo Dump to S3 and Disk
Mongodb Dumps Backup on S3 without any locks

## Getting Started

These instructions will get you a copy of the project up and running on your production/development/testing environments.

### Prerequisites

s3cmd

### Install and Configure S3CMD 

Please use the below commands to install and configure:

```
sudo su
sudo yum --enablerepo epel install s3cmd
s3cmd --configure
```

## Test the S3CMD

```
s3cmd ls
```

## Run the script

To run the script use the below command

```
bash mongodb-s3-backup.sh
```

## Scheduling the script on Linux

To Schedule the script use the cron scheduler

```
sudo su
crontab -e
```
And add the below lines at the end

```
#to run every day at 03h 00m (in 24 hrs format)
00 01 * * * /bin/bash /home/ec2-user/mongodb-s3-backup.sh
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE.md](LICENSE.md) file for details

