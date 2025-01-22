# Building a Counter App with Flutter Bloc

A new Flutter project.

## Getting Started

This project is a counter project using BlocBuilder & BlocListener & BlocConsumer

In "bloc_builder_listener_view" file, I used BlocBuilder & BlocListener

## Widgets Used:
  - Scaffold
      - AppBar to show the title of the page
      -  body
          - Column to put widgets vertically
              - Row to put widgets horizontally
                  - GlobalButton to add " + " and " - " buttons
                  - BlocListener to view a message in a dialog when counter value reaches -1 (negative value)
                      - BlocBuilder to view the new counter value if it changes
                          - Text to view the counter value
              - GlobalButton to go to the next page and connect it with "CounterCubit" using BlocProvider

The second page which exists in "bloc_consumer_view" file uses BlocConsumer

## Widgets Used:
  - Scaffold
      - AppBar to show the title of the page
      -  body
          - Center to centeralize widgets
              - Row to put widgets horizontally
                  - GlobalButton to add " + " and " - " buttons
                  - BlocConsumer to view a message in a dialog when counter value reaches 10 or -10 and view the new counter value if it changes
                      - Text to view the counter value
                        
## Note that
- In "counter_cubit" file, the logic of increment and decrement exists
- In "counter_state" file, all the states needed exist
- In "main" file, I used BlocProvider to connect the counter page with "CounterCubit"
