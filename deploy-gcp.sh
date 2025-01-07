
#!/bin/sh
export $(grep -v '^#' .env | xargs)

gcloud functions deploy demo-line-gpt \
  --runtime python311 \
  --trigger-http \
  --region asia-southeast1 \
  --source . \
  --entry-point ask_gpt \
  --set-env-vars OPENAI_API_KEY=$OPENAI_API_KEY,LINE_CHANNEL_ACCESS_TOKEN=$LINE_CHANNEL_ACCESS_TOKEN,LINE_CHANNEL_SECRET=$LINE_CHANNEL_SECRET \
  --allow-unauthenticated
