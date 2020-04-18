# Just Another Blog

This is a docker-compose file that able to create or restore a wordpress blog.

## Quick Start

 ```sh
git clone https://github.com/noe-pamula/just_antother_blog.git
cd just_antother_blog
docker-compose up -d
```
And now go on you favorite browser:
 ```sh
 http://localhost:8000
 ```
 
### It is the first time

If it the first time you launch your blog, you should make the wordpress 5 min installation and start to customise your blog.

### It is not the first time.

You can restore your web site.

## Backup your blog

To backup your blog : 

 ```sh
 docker-compose exec backup backup 
 ```
 
It's create a backup in a repository named backups.
Each backups are timestamped with the date of the day: yyyymmdd
 
## Restore your blog

To restore a version of your blog : 
 
 ```sh 
 docker-compose exec backup restore 20200415 
 ```
 Where the args '20200415' is the backup you wanna restore.
 
 ### RAF
 1. Externalise secret in a .env file
 2. Possibility to choose backup name
 