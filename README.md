# Nginx-Log-Analyser

# How it Works
  IP addresses:
  awk '{print $1}' extracts the first field (IP), then we count and sort.
  Requested paths:
  awk -F\" '{print $2}' gets the request line (GET /path HTTP/1.1), then awk '{print $2}' extracts the path.
  Status codes:
  awk '{print $9}' gets the status code (9th field in standard Nginx log format).
  User agents:
  awk -F\" '{print $6}' extracts the user agent string (6th quoted field).
  
# How to Use
  Save the script as analyze_nginx_log.sh.
  Make it executable:
  chmod +x analyze_nginx_log.sh
  Run it with your log file:
  ./analyze_nginx_log.sh access.log

# Solution for: https://roadmap.sh/projects/nginx-log-analyser
