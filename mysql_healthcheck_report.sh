# Read this link for full content: https://www.mysql.com/news-and-events/health-check/
# This is a file to generate mysql health check report. The following activities may be included

# Architecture: Review and recommend database architecture and design optimizations
# Configuration: Review MySQL configuration and suggest changes based on your specific application
# Performance: Monitor queries and recommend SQL code changes to improve performance
# Performance: Monitor memory usage (cache, hit ratios, etc.) and recommend changes
# Backup: Review backup configuration and recommend changes to improve backup/restore performance
# Security: Identify security vulnerabilities and recommend tighter security configurations
# Security: Demonstrate MySQL Enterprise Audit capabilities
# Authentication: Demonstrate MySQL user authentication against existing authentication model (PAM, LDAP, Active Directory)
# Roadmap: Discuss MySQL Roadmap


# Performance -> check memory and cpu usage 
./mysql_cpu_memory_usage.sh > /dev/null 2>&1 
# check process mysql 
./mysql_process_monitor.sh > /dev/null 2>&1 
# Backup
./mysql_backup.sh > /dev/null 2>&1 
./mysql_restore.sh > /dev/null 2>&1 
# download those action result as one pdf file with tabulate format 