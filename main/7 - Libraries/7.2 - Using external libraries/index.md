# 7.2 - Using external libraries

Using external libraries is a common practice that enhances functionality by leveraging pre-written code for specific tasks, avoiding the need to "reinvent the wheel."

External libraries, such as mathematical libraries, networking libraries, or multimedia handling libraries, can significantly reduce development time and provide well-tested and optimized code. Below is a detailed explanation of how to use external libraries in C, particularly focusing on the C17 standard.

## What Are External Libraries?
External libraries are collections of functions, macros, constants, and other programming tools that you can link to your C program. Libraries are usually distributed as:
- **Static Libraries (`.a` on Linux, `.lib` on Windows)**: Linked at compile-time, bundled into the final executable.
- **Dynamic Libraries (`.so` on Linux, `.dll` on Windows)**: Linked at run-time, shared between multiple executables.

## Steps to Use External Libraries in C17

### 1. **Installing the Library**
Before using any external library, it must be installed on your system. The method to install libraries depends on the system you're using:
- **Linux**: Libraries can be installed via package managers like `apt` (Debian/Ubuntu), `pacman` (Arch Linux) or `dnf` (Fedora, Rocky Linux)
  ```bash
  sudo apt-get install libname-dev  # Install development version of the library on apt
  ```
> [!NOTE]
> Some Linux distributions include development files within the normal package, while others separate the development files; Please read your system documentation for detailed information.

- **Windows**: Libraries can be manually downloaded and installed, or you can use package managers like vcpkg or MSYS2.
- **MacOS**: Use Homebrew to install libraries:
  ```bash
  brew install libname
  ```

### 2. **Including the Library in Your Code**
Once the library is installed, you'll need to include its header files in your C program. Header files contain function prototypes and declarations that tell your program how to use the library. 

For example, to use the **math library** (`libm`), you would include the `math.h` header:
```c
#include <math.h>
```

For other external libraries, you might have to include specific headers provided by the library:
```c
#include <libname.h>
```

### 3. **Compiling with the Library**
To compile a program that uses an external library, you need to tell the compiler where the library is located and link the library files.

#### Static Linking
For static libraries, the library becomes part of your executable, so you don’t need the library to be installed on the system where the executable is running.

Example of statically linking the **math library** (`libm`):
```bash
gcc -o myprogram myprogram.c -lm  # -lm links the math library (libm)
```

To statically link other libraries:
```bash
gcc -o myprogram myprogram.c -L/path/to/lib -lname  # -lname links 'libname.a'
```

- `-L/path/to/lib`: Specifies the directory where the library is located.
- `-lname`: Tells the compiler to link `libname.a` (the static library).
- `-I/path/to/include`: If the header files are not in standard directories, use this to include them.

#### Dynamic Linking
With dynamic linking, the library is not included in the final executable; instead, it is loaded at run-time. This makes the executable smaller, but the library must be available on the system when the program runs.

Example of dynamic linking:
```bash
gcc -o myprogram myprogram.c -L/path/to/lib -lname  # Links with dynamic libname.so
```
Here, `-lname` refers to the dynamic library (`libname.so` in Linux or `libname.dll` on Windows).

When using dynamic libraries, ensure that the library path is set in the system:
- **Linux**: Add the path to `/etc/ld.so.conf` or use `LD_LIBRARY_PATH`.
- **Windows**: Add the path to the `PATH` environment variable.

### 4. **Using Library Functions in Your Program**
After including the library and linking it, you can now use the functions and data types defined in the library. For example, using the **math library**:
```c
#include <stdio.h>
#include <math.h>

int main() {
    double result = sqrt(16.0);  // Use sqrt function from math.h
    printf("The square root of 16 is %.2f\n", result);
    return 0;
}
```

### 5. **Handling Errors**
It is essential to handle errors that might occur when linking libraries, loading shared libraries, or using library functions:
- **Linker errors**: These occur when the library is not correctly linked. Typical errors include "undefined reference" to a function. Double-check the `-L` and `-l` options.
- **Runtime errors**: When using dynamic libraries, ensure the library is available at runtime. Missing shared libraries (`.so` or `.dll`) will cause your program to fail with errors like "library not found."

## Example: Using an External Library (e.g., `libcurl`)
Let’s say you want to use `libcurl` to perform HTTP requests in C. Here's how you would set it up:

1. **Install libcurl**:
   - On Linux (Debian-based): `sudo apt install libcurl4-openssl-dev`
   - On macOS: `brew install curl`
   - On Windows, download the library or use a package manager like `vcpkg`.

2. **Include the `curl/curl.h` header**:
   ```c
   #include <stdio.h>
   #include <curl/curl.h>

   int main() {
       CURL *curl;
       CURLcode res;

       curl = curl_easy_init();
       if (curl) {
           curl_easy_setopt(curl, CURLOPT_URL, "http://example.com");
           res = curl_easy_perform(curl);

           if (res != CURLE_OK)
               fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));

           curl_easy_cleanup(curl);
       }
       return 0;
   }
   ```

3. **Compile the program**:
   ```bash
   gcc -o curl_program curl_program.c -lcurl  # Links with libcurl
   ```

## Important Considerations
- **Namespace Control**: Be mindful of potential namespace collisions. External libraries may introduce symbols (functions, variables) that clash with your own. C has no native module system like some modern languages, so be cautious with naming.
  
- **Standard Compliance**: When using libraries, ensure they comply with the C17 standard or are compatible with it. Some older libraries may be written for previous C standards (like C99 or C11), so review the documentation.

- **Thread Safety**: In multithreaded applications, be sure to check whether the library is thread-safe. Some libraries offer special initialization or usage modes to enable thread safety.

- **Memory Management**: External libraries may dynamically allocate memory internally. It's crucial to check if the library provides functions to free memory or otherwise manage resources. Failing to do so may result in memory leaks.

### Summary
Using external libraries in C is a powerful way to extend your program's capabilities. By linking with libraries—either statically or dynamically—you can reuse code for networking, cryptography, mathematics, or other complex tasks. Proper linking and compilation, handling library errors, and maintaining namespace safety are essential steps in using external libraries effectively.