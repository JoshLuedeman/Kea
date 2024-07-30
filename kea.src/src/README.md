# SOURCE files

The main _src_ folder has the main DOCKERFILE for each application to be developed from. Within each applications folder is an _app_ folder with the actual application in it, the DOCKERFILE for it's image, and the _requirements.txt_ file for that specific application.

# Table of Contents

| Application | Description                                                                                                                                                                                                                                 | Link                    |
| ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------------- |
| loader      | This container is used to download files and load them to the proper folder in the Data Lake.                                                                                                                                               | [Loader App](./loader/) |
| queue       | This application manages the work queue and launches other containers to do work as needed.                                                                                                                                                 | [Queue App](./queue/)   |
| worker      | This application is the worker. This application is simple enough at this point that it is simple enough for a simple worker app. The app will take a queue entry guid as a parameter. The queue entry will tell the app what action to do. | [Worker App](./worker/) |
