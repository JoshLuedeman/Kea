-- create work table for types of work
CREATE TABLE work(
    id INT GENERATED ALWAYS AS IDENTITY,
    long_name VARCHAR(255) NOT NULL,
    short_name VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);
-- insert work types
INSERT INTO work(
    long_name, 
    short_name
    ) 
VALUES
    ('Scrape Webpage', 'scrape'),
    ('Download File', 'download'),
    ('Load File', 'load'),
    ('Process File', 'process');

-- create webpage table for pages to be scraped, timestamps for queue, start, and completion, and container who completed the work
CREATE TABLE webpage(
    id INT GENERATED ALWAYS AS IDENTITY,
    url VARCHAR(255) NOT NULL,
    work_id INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_work
        FOREIGN KEY(work_id)
        REFERENCES work(id)
);

-- create webpage_queue table for the queue of webpages to be scraped
CREATE TABLE webpage_queue(
    id INT GENERATED ALWAYS AS IDENTITY,
    webpage_id INT NOT NULL,
    date_queue TIMESTAMP NOT NULL,
    date_start TIMESTAMP,
    date_complete TIMESTAMP,
    completed_by VARCHAR(50),
    PRIMARY KEY(id),
    CONSTRAINT fk_webpage
        FOREIGN KEY(webpage_id)
        REFERENCES webpage(id)
);
-- create files table for file urls that were scraped from the webpages, timestamps for when it was scraped, when download was started, when download was completed
-- , where the file needs to be uploaded, when the upload started, when the upload completed, and container who completed the work
CREATE TABLE files_queue(
    id INT GENERATED ALWAYS AS IDENTITY,
    url VARCHAR(255) NOT NULL,
    date_scrape TIMESTAMP NOT NULL,
    date_download_start TIMESTAMP,
    date_download_complete TIMESTAMP,
    download_location VARCHAR(255),
    date_upload_start TIMESTAMP,
    date_upload_complete TIMESTAMP,
    upload_location VARCHAR(255),
    completed_by VARCHAR(50),
    webpage_id INT NOT NULL,
    work_id INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT fk_webpage
        FOREIGN KEY(webpage_id)
        REFERENCES webpage(id),
    CONSTRAINT fk_work
        FOREIGN KEY(work_id)
        REFERENCES work(id)
);

-- create work_log table for the logging of all work done by the application
CREATE TABLE work_log(
    id INT GENERATED ALWAYS AS IDENTITY,
    date TIMESTAMP NOT NULL,
    work_id INT NOT NULL,
    webpage_id INT,
    files_queue_id INT,
    completed_by VARCHAR(50) NOT NULL,
    detail VARCHAR(255),
    PRIMARY KEY(id),
    CONSTRAINT fk_work
        FOREIGN KEY(work_id)
        REFERENCES work(id),
    CONSTRAINT fk_webpage
        FOREIGN KEY(webpage_id)
        REFERENCES webpage(id),
    CONSTRAINT fk_files_queue
        FOREIGN KEY(files_queue_id)
        REFERENCES files_queue(id),
    CONSTRAINT fk_webpage_queue
        FOREIGN KEY(webpage_queue_id)
        REFERENCES webpage_queue(id)
);