import functions_framework
import line_handler

@functions_framework.http
def ask_gpt(request):
    return line_handler.handle(request)
