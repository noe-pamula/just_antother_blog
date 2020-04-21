# Just Another Blog

This is a docker-compose file that able to create or restore a wordpress blog.

## Prerequisites 
- a computer or a server
- Docker
- make (optional)

## Quick Start
 ```sh
git clone https://github.com/noe-pamula/just_antother_blog.git
cd just_antother_blog
docker-compose up -d
```
and (
 ```sh
docker-compose up -d
```
or
 ```sh
make start
```
)

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
 
 or 
 
 make backup
 ```
 
It's create a backup in a repository named backups.
Each backups are timestamped with the date of the day: yyyymmdd

You can choose a name for you backup

 ```sh
 docker-compose exec backup backup the-name-of-backup
 
 or 
 
 make backup the-name-of-backup
 ```

 
## Restore your blog

To restore a version of your blog : 
 
 ```sh 
 docker-compose exec backup restore the-name-of-backup
 
 or 
 
 make restore the-name-of-backup
 ```
 Where the args 'the-name-of-backup' is the backup you wanna restore.
 