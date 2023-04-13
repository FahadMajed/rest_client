# RestClient

RestClient is a lightweight Dart library for making HTTP requests to RESTful APIs. It provides a simple and intuitive interface for sending HTTP requests and handling responses.

## Features

- Supports GET, POST, PUT, PATCH, and DELETE HTTP methods
- Allows setting headers and query parameters for requests
- Supports both JSON and form data request bodies
- Handles response parsing and error handling automatically
- Provides easy-to-use response objects for accessing response data
- Can easily switch between Dio and http clients for sending requests

## Getting Started

To use RestClient in your Dart project, add the following dependency to your pubspec.yaml file:

```yaml
dependencies:
  rest_api:
    git:
      url: git://github.com/FahadMajed/rest_client.git
```


Then, import the RestClient library in your Dart code:

```dart
import 'package:rest_client/rest_client.dart';
```

## Usage

To send an HTTP request, create a new instance of the RestClient class and use the appropriate method (get, post, put, patch, or delete) to send the request. For example:

```dart
  final client =  HttpRESTClient(
      baseUrl: 'https://tasty.p.rapidapi.com/recipes',
      headers: {
        'X-RapidAPI-Key': '',
        'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
      },
    );
 
  final response = await client.call(
        RESTOption.get,
        path: '/list?from=$from&size=20',
        headers: client.headers,
      );
```


For more detailed usage examples, see the examples directory in this repository.

## Contributing

Contributions to this library are welcome! If you find any issues or have suggestions for improvements, feel free to open an issue or submit a pull request.

## License

RestClient is licensed under the MIT License. See the LICENSE file for more information.
