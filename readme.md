# S3gyazo -- a gyazo server with s3 and docker


## Installation

Create a s3 bucket for this system and ...

    sudo docker build -t s3gyazo .
    cp env.sample env
    vi env # set your s3 access key
    sudo ./start_docker.sh


## Thanks to

* https://github.com/gyazo/Gyazo
* https://github.com/udzura/upload.cgi

