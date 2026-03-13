#!/bin/bash

# Create gcloud config directory if it does not exist
mkdir -p ~/.config/gcloud

# Login for Application Default Credentials
gcloud auth application-default login