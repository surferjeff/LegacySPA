#/bin/bash
# Usage:
#  ./deploy.sh v3
gcloud run deploy legacy-spa-finish --max-instances=1 --min-instances=0 \
    --concurrency=1000  --cpu=1 --region=us-central1 --allow-unauthenticated \
    --image=us-central1-docker.pkg.dev/surferjeff-demos/docker-repo/legacy-spa-finish:$1