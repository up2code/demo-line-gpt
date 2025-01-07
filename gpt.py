from openai import OpenAI
import config

def ask(user_query):
    client = OpenAI(
        api_key=config.OPENAI_API_KEY,
    )

    completion = client.chat.completions.create(
        model="gpt-4o",
        store=True,
        messages=[
            {"role": "user", "content": user_query},
        ]
    )

    result = completion.choices[0].message.content.strip()
    return result