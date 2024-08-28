#!/bin/bash

# Define the prefix for the secrets
PREFIX="ENV_VAR_"

# Create or overwrite the .env file
> .env

# Loop over all environment variables
for SECRET_NAME in $(cat .env.example | cut -d= -f1); do
    SECRET_VALUE="${!SECRET_NAME}"
    echo "${SECRET_NAME#${PREFIX}}=${SECRET_VALUE}" >> .env
done
