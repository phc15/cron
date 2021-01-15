# Link for full content: https://www.mysql.com/news-and-events/health-check/
# MySQL health check overview.

# Performance -> check memory and cpu usage 
./mysql_cpu_memory_usage.sh > /dev/null 2>&1 
# check process mysql 
./mysql_process_monitor.sh > /dev/null 2>&1 
# Backup
./mysql_backup.sh > /dev/null 2>&1 
./mysql_restore.sh > /dev/null 2>&1 
# download those action result as one pdf file with tabulate format 
