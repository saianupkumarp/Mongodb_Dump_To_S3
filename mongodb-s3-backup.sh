# Author = Anup Kumar
# License = Apache-2.0
# Version = 1.0

MONGODUMP_PATH="/usr/bin/mongodump"
MONGO_HOST="localhost" #replace with your server ip
MONGO_PORT="27017"
MONGO_DATABASE="DatabaseName" #replace with your database name
 
TIMESTAMP=`date +%F-%H%M`
S3_BUCKET_NAME="databackup" #replace with your bucket name on Amazon S3
S3_BUCKET_PATH="mongodb-backups"
 
# Create backup
$MONGODUMP_PATH -d $MONGO_DATABASE --gzip --archive=archive.gz
 
# Add timestamp to backup
mv archive.gz mongodb-$TIMESTAMP.gz
 
# Upload to S3
s3cmd put mongodb-$TIMESTAMP.gz s3://$S3_BUCKET_NAME/$S3_BUCKET_PATH/mongodb-$TIMESTAMP.gz  #If you don't want to upload it to the s3 then please comment the below line

#Remvoe the file after uploading
rm mongodb-$TIMESTAMP.gz