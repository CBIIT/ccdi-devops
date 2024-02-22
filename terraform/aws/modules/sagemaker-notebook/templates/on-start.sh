#!/bin/bash

sudo -u ec2-user -i <<'EOF'

echo "export GRAPH_NOTEBOOK_AUTH_MODE=${graph_notebook_auth_mode}" >> ~/.bashrc
echo "export GRAPH_NOTEBOOK_HOST=${graph_notebook_host}" >> ~/.bashrc
echo "export GRAPH_NOTEBOOK_PORT=${graph_notebook_port}" >> ~/.bashrc
echo "export NEPTUNE_LOAD_FROM_S3_ROLE_ARN=${neptune_load_from_s3_role_arn}" >> ~/.bashrc
echo "export AWS_REGION=${aws_region}" >> ~/.bashrc

aws s3 cp --region ${aws_region} s3://aws-neptune-notebook/graph_notebook.tar.gz /tmp/graph_notebook.tar.gz
rm -rf /tmp/graph_notebook
tar -zxvf /tmp/graph_notebook.tar.gz -C /tmp
/tmp/graph_notebook/install.sh

EOF
