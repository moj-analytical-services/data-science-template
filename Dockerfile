FROM ghcr.io/ministryofjustice/analytical-platform-airflow-python-base:1.20.0@sha256:6cfccc9aca038a56a0400a8b382f989ed7ba6868f35e0d94fe564cee3f2e6cd5

ARG MOJAP_IMAGE_VERSION="default"
ENV MOJAP_IMAGE_VERSION=${MOJAP_IMAGE_VERSION}

# Below is an example of how to use the base image

# Switch to root user to install packages
# USER root

# Copy requirements.txt
# COPY requirements.txt requirements.txt

# Copy application code
# COPY src/ .

# Install requirements
# RUN <<EOF
# pip install --no-cache-dir --requirement requirements.txt
# EOF

# Switch back to non-root user (analyticalplatform)
# USER ${CONTAINER_UID}

# Execute main.py script
# ENTRYPOINT ["python3", "main.py"]
