## 42 minitalk

This 42 project implements signal management.  
The makefile generates 2 programs: a client and a server.

When you run `./server`, the PID of the program will be printed.  
To launch `./client`, 2 arguments are needed: the PID and a string.  
Using Unix signals, the client will send the string to the server, which will then print it.

## makefile
- **`make`**: Compiles the project.
- **`make clean`**: Removes the `objet` folder.
- **`make fclean`**: Runs `make clean` and removes the executable and the `libft` library.
- **`make re`**: Runs `make fclean` and then `make`.
- **`make clt`**: Compiles the client.
- **`make srv`**: Compiles the server.
- **`make header`**: Prints a decorative header.
- **`make init`**: Init submodules
