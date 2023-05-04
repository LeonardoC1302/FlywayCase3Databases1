## What is this repository?
It contains the flyway migrations files and documentation implemented to maintain a SQL Server database. These files are used to keep a track of the versions of the database and the changes made to it. Please take into considerations the following requierments:
- Install Flyway for CMD from the oficial website.
- All the files named as V#__{name}.sql need to be saved on the sql folder on your flyway(version) folder.
- The flyway commands need to be executed from the downloaded flyway folder.
- If you have any problems with flyway, make sure to use the configuration file on the extraDocuments folder on this repository.
- On the documentations, you can find other important information about the database and the requierements of the homework.
- Before making any migrations, make sure your flyway is working by running 'flyway -v'