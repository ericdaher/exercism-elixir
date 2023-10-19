# exercism-elixir

Exercises from the Elixir track in Exercism.
All folders have:

- a README file, with the proposed exercise
- a lib/ folder, with the implementation
- a test/ folder, with test validating the solution
- a `mix.exs` file, used for running the tests.

An exercise can be validated by running `mix test`.
All exercises are made using the Elixir Docker image using the following command:
```
docker run -it -v "$PWD":/usr/src/app elixir bash
```
and navigating to the corresponding folder inside the container.
