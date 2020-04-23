help: info

build:
	docker-compose down
	docker-compose build --no-cache backup
	docker-compose up -d

start:
	@docker-compose up -d

stop:
	@docker-compose down

status:
	@docker-compose ps

restart:
	@docker-compose restart

clean:
	@docker-compose down -v

restore:
	@docker-compose exec backup restore $(filter-out $@,$(MAKECMDGOALS))
	@docker-compose restart

auto-backup:
	@docker-compose exec backup backup
	@docker-compose exec backup backup latest

auto-restore:
	@docker-compose exec backup restore latest

backup:
	@docker-compose exec backup backup $(filter-out $@,$(MAKECMDGOALS))

info: title
	@echo .
	@echo Usage:  make COMMAND [ARGUMENTS]
	@echo .
	@echo The list of commands you can performe with this awesome makefile
	@echo         info : Show informations about command you can do with this makefile.
	@echo         help : Show informations about command you can do with this makefile.
	@echo        start : Start containers with database, WordPress and MySql Database.
	@echo                This command should be used to start your wordpress stack.
	@echo                It's juste make a docker-compose up in detach mode.
	@echo         stop : Stop all containers and shut your WordPress Down.
	@echo                It's juste make a docker-compose down.
	@echo      restart : Restart all containers, your wordpress will still up after this command.
	@echo                It's juste make a docker-compose restart.
	@echo       status : Will show the state and the port linking of all your containers
	@echo                It's juste make a docker-compose ps .
	@echo        clean : This command will stop all your containers and remove the attached volume
	@echo                Becarreful, if you don't make a backup before, all your changes will be lost.
	@echo                It's juste make a docker-compose down -v .
	@echo       backup : This command create a backup of your wordpress named with the date of the day.
	@echo	             But you can put a argument to this command to name your backup.
	@echo	             You can find your backup in a backups folder.
	@echo      restore : This command will make a restore of you WordPress.
	@echo                Becarrefull, this command need a argument. You should put the name of the backup
	@echo                The backup name is the backup date in the format yyyymmdd (example 20200420)
	@echo                Or the name you set with the argument of the backup command.
	@echo  auto-backup : This command create a backup of your wordpress named with the date of the day.
	@echo	             And a backup named latest.
	@echo auto-restore : This command will make a restore with the backup named latest.
	@echo         build: This command will build again the dockerfile without using cache.
	@echo                Use for develop or contribute.

title :
	@echo         __           __     __                 __  __                 ____  __
	@echo        / __  __ ____/ /_   /  \   ____  ____  / /_/ /_  ___  _____   / __ )/ ____  ____
	@echo   __  / / / / / ___/ __/  / /\ \ / __ \/ __ \/ __/ __ \/ _ \/ ___/  / __  / / __ \/ __ `/
	@echo  / /_/ / /_/ (__  / /_   / ___  / / / / /_/ / /_/ / / /  __/ /     / /_/ / / /_/ / /_/ /
	@echo  \____/\__,_/____/\__/  /_/   \/_/ /_/\____/\__/_/ /_/\___/_/     /_____/_/\____/\__, /
	@echo                                                                                 /____/

%:
	@:


