
-- Day 1: Basic SELECT and WHERE filters
SELECT * FROM logins WHERE status = 'failed';
SELECT * FROM logins WHERE ip_address = '10.0.0.3';
SELECT * FROM logins WHERE path = '/admin';
SELECT * FROM logins WHERE path IS NULL;
SELECT * FROM logins WHERE status = 'failed' AND ip_address = '10.0.0.3';

-- Day 2: CASE, ORDER BY, LIMIT
SELECT username, ip_address, status,
  CASE
    WHEN status = 'failed' AND path = '/admin' THEN 'HIGH'
    WHEN status = 'failed' THEN 'MEDIUM'
    WHEN status = 'success' THEN 'LOW'
    ELSE 'UNKNOWN'
  END AS alert_level
FROM logins;

SELECT * FROM logins ORDER BY timestamp DESC;
SELECT * FROM logins ORDER BY timestamp DESC LIMIT 3;

-- Risk Tag CASE
SELECT username, ip_address, status,
  CASE
    WHEN status = 'failed' AND ip_address LIKE '192.168.%' THEN 'critical'
    WHEN status = 'failed' AND ip_address LIKE '10.%' THEN 'watchlist'
    ELSE 'normal'
  END AS risk_tag
FROM logins;

-- Day 3: IN, BETWEEN, IS NULL
SELECT * FROM logins WHERE username IN ('admin', 'guest');
SELECT * FROM logins WHERE timestamp BETWEEN '2025-06-17 10:00:00' AND '2025-06-17 10:03:00';
SELECT * FROM logins WHERE path IS NULL;
SELECT * FROM logins WHERE username = 'guest' AND path IS NULL AND timestamp > '2025-06-17 10:03:00';
SELECT * FROM logins
WHERE ip_address IN ('192.168.1.101', '10.0.0.3')
  AND status = 'failed'
  AND path IS NOT NULL
  AND timestamp < '2025-06-17 10:03:00';

-- Day 4: INSERT, UPDATE, DELETE
INSERT INTO logins (username, ip_address, status, path, timestamp)
VALUES ('malware.bot', '8.8.8.8', 'failed', '/admin', '2025-06-17 11:00:00');

INSERT INTO logins (username, ip_address, status, path, timestamp)
VALUES ('analyst1', '172.20.1.50', 'success', '/dashboard', '2025-06-17 11:15:00');

UPDATE logins
SET status = 'under_review'
WHERE username = 'guest' AND status = 'failed' AND timestamp > '2025-06-17 10:03:00';

UPDATE logins
SET path = '/api/internal'
WHERE ip_address = '10.0.0.3';

DELETE FROM logins
WHERE username = 'bot_user' AND path IS NULL AND status = 'success';

-- Day 5: Scenario Queries
SELECT * FROM logins WHERE (path = '/admin' OR path = '/api/internal') AND status = 'failed';

SELECT * FROM logins
WHERE status = 'success' AND path = '/dashboard' AND ip_address LIKE '172.20.%' AND timestamp > '2025-06-17 10:00:00';

SELECT username, ip_address, status, path, timestamp,
  CASE
    WHEN ip_address = '192.168.1.101' AND path = '/admin' THEN 'CRITICAL'
    WHEN status = 'failed' AND path IS NOT NULL THEN 'HIGH'
    ELSE 'LOW'
  END AS alert_level
FROM logins;

SELECT username, ip_address, timestamp,
  CASE
    WHEN ip_address = '192.168.1.101' AND path = '/admin' THEN 'CRITICAL'
    WHEN status = 'failed' AND path IS NOT NULL THEN 'HIGH'
    ELSE 'LOW'
  END AS alert_level
FROM logins
ORDER BY timestamp DESC
LIMIT 3;

SELECT DISTINCT ip_address
FROM logins
WHERE status = 'failed'
  AND timestamp < '2025-06-17 10:03:00'
  AND (ip_address LIKE '10.%' OR ip_address LIKE '192.168.%');

-- Day 6: Mini Challenge
SELECT * FROM logins
WHERE status = 'failed' AND ip_address = '10.0.0.3'
ORDER BY timestamp;

SELECT username, ip_address, status, path, timestamp,
  CASE
    WHEN path = '/admin' AND status = 'failed' THEN 'CRITICAL'
    ELSE 'LOW'
  END AS alert_level
FROM logins
WHERE username = 'admin';

SELECT * FROM logins
WHERE path IS NULL AND status = 'failed';

SELECT * FROM logins
WHERE status = 'success' AND ip_address LIKE '172.20%'
ORDER BY timestamp DESC
LIMIT 1;

SELECT username, ip_address, timestamp,
  CASE
    WHEN ip_address = '192.168.1.101' AND path = '/admin' THEN 'CRITICAL'
    WHEN status = 'failed' AND path IS NOT NULL THEN 'HIGH'
    ELSE 'LOW'
  END AS alert_level
FROM logins
ORDER BY timestamp DESC
LIMIT 5;
