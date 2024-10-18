# 5.1 Retrieve user input

In C, to **retrieve and handle user input** the most fundamental way to do this in C is by using **standard input/output functions** from the standard C library, such as `scanf()`, `fgets()`, and `getchar()`. Let's break this process down with detailed explanations of different techniques.

## **Basic Input: Using `scanf()`**
`scanf()` is a powerful yet simple function for retrieving formatted input from the user. It reads data from the standard input (`stdin`), parses it, and stores it in variables passed by reference.

### Syntax:
```c
int scanf(const char *format, ...);
```
Here, `format` is a format string that specifies the type of input you're expecting, such as `%d` for integers, `%f` for floating-point numbers, and `%s` for strings. The `...` represents the additional arguments, which are pointers to variables where the input will be stored.

### Example: Reading an Integer and a Floating-Point Number
```c
#include <stdio.h>

int main() {
    int num;
    float decimal;

    printf("Enter an integer: ");
    scanf("%d", &num);  // Reads and stores an integer value

    printf("Enter a float: ");
    scanf("%f", &decimal);  // Reads and stores a floating-point value

    printf("You entered: %d and %f\n", num, decimal);
    return 0;
}
```

### Key Points about `scanf()`:
- **Data type matching:** The format specifier must match the variable type, or undefined behavior may occur. For instance, using `%d` for a `float` would cause problems.
- **Memory address:** The variables passed to `scanf()` must be pointers (i.e., their memory addresses, such as `&num`), because `scanf()` needs to modify the actual variable.
- **Whitespace handling:** `scanf()` skips whitespace characters automatically when reading numbers but not strings, which is important when taking multiple inputs.

## **Reading Strings with `scanf()`**
Strings in C are represented as arrays of characters. `scanf()` can be used to read strings using the `%s` format specifier, but there are important caveats.

### Example: Reading a String
```c
#include <stdio.h>

int main() {
    char name[20];

    printf("Enter your name: ");
    scanf("%s", name);  // Reads a string, note that `&name` is not required

    printf("Hello, %s!\n", name);
    return 0;
}
```

### Important Notes:
- **Limited input:** By default, `scanf("%s", name)` stops reading at the first whitespace (space, tab, or newline), which makes it inadequate for reading strings with spaces.
- **No buffer overflow protection:** The function does not check if the input fits into the buffer. If the user inputs more characters than the array can hold, it can lead to buffer overflow. To prevent this, you should specify a maximum width in the format specifier like `%19s` for a buffer of size 20 (leaving space for the null terminator).

## **Safely Reading Strings with `fgets()`**
For reading strings with spaces or controlling the size of input to avoid overflow, `fgets()` is preferred over `scanf()`.

### Syntax:
```c
char *fgets(char *str, int n, FILE *stream);
```
- `str`: The pointer to the buffer where the input will be stored.
- `n`: The maximum number of characters to read (including the null terminator).
- `stream`: The input stream, typically `stdin` for user input.

### Example: Reading a Full Line
```c
#include <stdio.h>

int main() {
    char input[100];

    printf("Enter a sentence: ");
    fgets(input, sizeof(input), stdin);  // Reads a line of input

    printf("You entered: %s", input);
    return 0;
}
```

### Key Points:
- **Newline characters:** `fgets()` stores the newline character (`\n`) in the buffer if the user presses Enter. If you need to remove it, you can manually replace it with a null terminator (`'\0'`).
- **Safer for larger inputs:** It ensures that input doesn't overflow the buffer by only reading up to `n-1` characters.

## 4. **Reading a Single Character with `getchar()`**
If you want to read individual characters, `getchar()` is a convenient function. It reads a single character from the input buffer.

### Syntax:
```c
int getchar(void);
```

### Example: Reading a Character
```c
#include <stdio.h>

int main() {
    char ch;

    printf("Enter a character: ");
    ch = getchar();  // Reads a single character

    printf("You entered: %c\n", ch);
    return 0;
}
```

### Key Points:
- **Character storage:** The return value of `getchar()` is an integer, but it can be cast to a `char` for easier use.
- **Newline handling:** Like `scanf()`, `getchar()` will read the newline character after pressing Enter, so you may need to account for it.

### **Handling Input Errors**
Handling errors during input is crucial, especially for more complex programs. For example, `scanf()` returns the number of successfully read items, which can be checked to detect input errors.

### Example: Error Handling with `scanf()`
```c
#include <stdio.h>

int main() {
    int num;
    printf("Enter a number: ");

    if (scanf("%d", &num) != 1) {  // Check if input is a valid integer
        printf("Invalid input!\n");
        return 1;  // Exit the program with an error code
    }

    printf("You entered: %d\n", num);
    return 0;
}
```

### Key Points:
- **Return value of `scanf()`:** It returns the number of successfully matched and assigned input items. If the input doesn't match the format specifier (e.g., entering a string instead of an integer), `scanf()` returns a value less than expected.
- **Preventing infinite loops:** When `scanf()` fails, it leaves invalid input in the buffer, which can cause an infinite loop if not handled properly. In such cases, it’s advisable to clear the input buffer manually.

## **Clearing the Input Buffer**
When reading multiple types of inputs or switching between `scanf()`, `getchar()`, and `fgets()`, leftover newline characters in the input buffer can cause unexpected behavior. You can clear the buffer using `getchar()` in a loop.

### Example: Clearing the Buffer
```c
void clearInputBuffer() {
    int ch;
    while ((ch = getchar()) != '\n' && ch != EOF);  // Discards leftover characters
}
```

You can call this function after using `scanf()` or `getchar()` to ensure no leftover characters interfere with subsequent input operations.

## **Handling Complex Inputs: Combining Techniques**
When dealing with more complex inputs, such as reading a mix of integers, characters, and strings, it’s common to combine these techniques. For example, you can use `scanf()` to read numbers and `fgets()` to read full lines of text.

### Example: Reading Multiple Types of Input
```c
#include <stdio.h>

int main() {
    int age;
    char name[50];

    printf("Enter your age: ");
    scanf("%d", &age);  // Read integer

    // Clear the newline left by scanf
    getchar();

    printf("Enter your full name: ");
    fgets(name, sizeof(name), stdin);  // Read full name

    printf("Your age is %d and your name is %s", age, name);
    return 0;
}
```

In this example, `getchar()` is used to consume the newline character left by `scanf()` before calling `fgets()`.

---

## Summary
Retrieving user input in C involves a range of techniques, from the basic `scanf()` for formatted input to safer alternatives like `fgets()` for strings and `getchar()` for single characters. Error handling and buffer management are crucial to ensuring robust input retrieval in real-world applications. Understanding these techniques will help you build interactive programs that can handle user input effectively while avoiding common pitfalls like buffer overflows or input mismatches.