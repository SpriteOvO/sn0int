DROP TABLE activity;

PRAGMA foreign_keys=off;

-- ports
CREATE TABLE _ports_new (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    ip_addr_id INTEGER NOT NULL,
    value VARCHAR NOT NULL,
    ip_addr VARCHAR NOT NULL,
    port INTEGER NOT NULL,
    protocol VARCHAR NOT NULL,
    status VARCHAR NOT NULL,
    unscoped BOOLEAN DEFAULT 0 NOT NULL,

    banner VARCHAR,
    service VARCHAR,
    version VARCHAR,

    FOREIGN KEY(ip_addr_id) REFERENCES ipaddrs(id) ON DELETE CASCADE,
    CONSTRAINT port_unique UNIQUE (value)
);

INSERT INTO _ports_new (id, ip_addr_id, value, ip_addr, port, protocol, status, unscoped, banner, service, version)
    SELECT id, ip_addr_id, value, ip_addr, port, protocol, status, unscoped, banner, service, version
    FROM ports;

DROP TABLE ports;
ALTER TABLE _ports_new RENAME TO ports;

PRAGMA foreign_keys=on;
