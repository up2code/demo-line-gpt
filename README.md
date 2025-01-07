# Demo LINE OA GPT

Demonstrate how to integrate LINE OA with OpenAI

## Prerequisite

- [Python](https://www.python.org/)
- [LINE Official Account](https://manager.line.biz/)
- [LINE Developer](https://developers.line.biz/)
- [GCP Account](https://console.cloud.google.com/) (Enable Cloud Functions API)
- [gcloud CLI](https://cloud.google.com/sdk/docs/install)
- [OpenAPI Account](https://platform.openai.com/) for get OpenAPI API Key

## Environment Variables

Create file `.env` look like this and replace `YOUR_VALUE` to your own data.

```sh
OPENAI_API_KEY=YOUR_VALUE
LINE_CHANNEL_ACCESS_TOKEN=YOUR_VALUE
LINE_CHANNEL_SECRET=YOUR_VALUE
```

- `OPENAI_API_KEY`: OpenAI API Key. Required from https://platform.openai.com/
- `LINE_CHANNEL_ACCESS_TOKEN`: Channel access token. Accquired from (LINE Developers console)[https://developers.line.biz/console/] under your OA Channel.
- `LINE_CHANNEL_SECRET`: Channel secret. Accquired from LINE OA Settings > Messaging API

## Deploy into GCP via gcloud CLI

Run `deploy-gcp.sh`

```sh
sh deploy-gcp.sh
```

Or run it manually

```sh
gcloud functions deploy demo-line-gpt \
  --runtime python311 \
  --trigger-http \
  --region asia-southeast1 \
  --source . \
  --entry-point ask_gpt \
  --set-env-vars OPENAI_API_KEY=$OPENAI_API_KEY,LINE_CHANNEL_ACCESS_TOKEN=$LINE_CHANNEL_ACCESS_TOKEN,LINE_CHANNEL_SECRET=$LINE_CHANNEL_SECRET \
  --allow-unauthenticated
```

- You can change `demo-line-gpt` to your own cloud function name.
- Change `asia-southeast1` to your closest region

After deploy successfully. Copy result URL and set it into Webhook of your LINE OA. (This task do only once when deploy first time)
