#!/bin/sh

NODE_TLS_REJECT_UNAUTHORIZED=0 npx medusa user -e tt@gmail.com -p redhat || echo "Already Exist or Failed" 


NODE_TLS_REJECT_UNAUTHORIZED=0 npm run start

