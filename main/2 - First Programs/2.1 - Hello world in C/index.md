# 1.1 - Hello world in C

In programming, "Hello, World!" is a classic introductory program used to demonstrate basic syntax. Let's break down the code for the `Hello, World!` program using the C17 standard in detail.

## Program Code: Hello World

Here is the code for the "Hello, World!" program in C:

```c
#include <stdio.h>

int main(void) {
    printf("Hello, World!\n");
    return 0;
}
```

Now, let's break this code down step by step.

---

### 1. **`#include <stdio.h>`**
   This line is called a **preprocessor directive**. In C, preprocessor directives are lines that begin with a `#` symbol and are processed before the actual compilation of the code begins. The directive `#include <stdio.h>` tells the compiler to include the contents of the standard input-output header file **`stdio.h`** (Standard Input Output Header).

### Why `stdio.h`?
- `stdio.h` provides the function **`printf`**, which is used to print output to the standard output (usually the console or terminal). 
- This header file contains declarations of functions related to input and output operations like `printf()`, `scanf()`, and others.

Without it, the compiler would not recognize the `printf()` function.

> [!NOTE]
> `stdio.h` is provided by operating system and the implementation may vary depending on the OS

---

## 2. **`int main(void)`**
   The **`main()`** function is the entry point of every C program. When a C program is executed, the system automatically calls the `main()` function to begin the program's execution.

### Breakdown of the `main()` function:

- **`int`**: This indicates that the return type of the `main` function is an integer (`int`). When the program ends, it returns an integer value to the operating system (typically `0` for success or non-zero for failure). This is the standard form since C89.

- **`main`**: The name of the function. Every C program must have one `main()` function.

- **`void`**: The parentheses after `main` contain the function parameters. `void` means that `main()` does not take any parameters in this version. In modern C (C89 onwards, including C17), it's valid to use `void` to explicitly specify that `main` takes no arguments.

---

## 3. **`printf("Hello, World!\n");`**
   This line is responsible for printing the message "Hello, World!" to the screen.

### Breakdown of `printf()`:

- **`printf`**: A standard library function declared in `stdio.h`. It is used to print formatted output to the console.

- **`"Hello, World!\n"`**: This is a string literal. A string literal in C is enclosed in double quotes (`""`). The contents of the string are printed exactly as they appear.

- **`\n`**: This is an escape sequence. It represents a newline character, meaning the cursor will move to the next line after printing the string. Without the `\n`, the cursor would remain on the same line after printing.

   **Escape sequences** are used to represent special characters that cannot be typed directly. Some other common escape sequences include:
   - `\t`: Tab character.
   - `\\`: Backslash.
   - `\"`: Double quote.


---

## 4. **`return 0;`**
   The `return` statement in the `main` function is used to return an integer value to the operating system. The value `0` typically indicates that the program has executed successfully.

- **`0`**: Conventionally, a return value of `0` signals successful completion, while a non-zero return value (like `1`, `-1`, etc.) indicates some kind of error.

  the `return 0;` statement is optional inside the `main()` function. If omitted, the compiler assumes an implicit `return 0;` at the end of the `main()` function. This is a feature carried over from C99, where it became permissible to omit this line.

---

## Compilation and Execution (C17 Context)

To compile and run this program, follow these steps:

1. **Save the program** in a file with a `.c` extension, for example, `hello_world.c`.

2. **Compile the program** using a C compiler that supports the C17 standard, such as GCC (GNU Compiler Collection):

   ```bash
   gcc -std=c17 hello_world.c -o hello_world
   ```

   - `-std=c17`: This flag tells the compiler to use the C17 standard.
   - `hello_world.c`: The source file to be compiled.
   - `-o hello_world`: This specifies the output filename as `hello_world`. If omitted, the default name for the executable is `a.out` on Unix-like systems or `a.exe` on Windows.

3. **Run the program** by executing the compiled output:

   ```bash
   ./hello_world
   ```

   This command will produce the output:

   ```
   Hello, World!
   ```

---

## Summary

The "Hello, World!" program in C17 remains the canonical starting point for learning C programming. In this version:
- The **basic structure of C** remains the same, consisting of header files, the `main()` function, and a `printf()` statement to print output.
- The **return 0** statement in `main()` is optional in C17 but is included for clarity.
- The **C17 standard** primarily focuses on fixing issues from C11 and does not change fundamental aspects of the language that apply to this basic program.

Understanding the "Hello, World!" program provides insight into how C programs are structured and how the C language has remained consistent across different standards, including C17.
