# Shell for Metrics Monitoring and Alerting #

The files are written in shell script used to mertics montioring and alerting of postfix, mysql and NGINX etc. in osx operating system.

### Metrics
-   Porcess count
-   CPU usage
-   Memory usage
-   Backup and restore

### Alerting
Metrics based condition or threshold. If the value falled out of certain range or limit, this will trigger an alerting component to perform actions such as send out an email to notify the administrator. 

### Improvements
- Cronjob setup through a control panel running seperated inside cron.hourly, cron.daily, cron.weekly folders 
- Security monitoring

### Others
Some ideas are come from the book "High Performance MySQL"



