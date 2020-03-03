import logging

import azure.functions as func
import numpy


def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    return func.HttpResponse(f"{numpy.__file__}")
