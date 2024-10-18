# 7.3 - How to properly understand the documentation

Understanding documentation requires a methodical approach. The C standard is highly technical, designed to provide a rigorous definition of the language for compiler developers and advanced programmers. However, with the right approach, even intermediate programmers can gain a solid understanding of the documentation.

Here’s a structured guide to help you navigate and interpret C documentation effectively.


## **Understand the Purpose and Scope of the Standard**
   
The C17 standard builds on previous versions of the C language (C11, C99, etc.) and mostly focuses on bug fixes and clarifications. It doesn't introduce new features, but understanding the standard's purpose helps you focus on what's most important:
   
- **Core Syntax**: It provides definitive rules for the syntax and semantics of the language.
- **Library Specifications**: It defines standard libraries and their behavior.
- **Undefined/Implementation-defined Behavior**: It explains what parts of the language are left to the compiler to decide, which is crucial when writing portable code.
- **Compliance Levels**: It specifies what a C-compliant implementation must support.

## **Key Sections of the Documentation**
  
The C17 standard is divided into several key sections, each with its own focus. Knowing these sections will help you locate information faster and understand where to look depending on your need:

- **Preprocessor Directives**: This section covers `#include`, `#define`, conditional compilation (`#ifdef`, `#ifndef`), etc. It is important for understanding how macros and conditional code work.
- **Syntax and Semantics**: Covers the basic constructs (types, expressions, statements, etc.) of the language. For example, how control structures like `if`, `for`, and `while` should behave.
- **Data Types**: Describes primitive types (`int`, `char`, `float`, etc.), qualifiers (`const`, `volatile`), and derived types (pointers, arrays, structures).
- **Functions**: Discusses function declarations, definitions, and the rules for parameter passing.
- **Storage Classes and Lifetime**: Covers static, auto, register, extern, and the rules about scope and lifetime of variables.
- **Error Handling**: Standards for error reporting (e.g., `errno`) and how functions return error codes or indicate failure.
- **Standard Library**: Defines functions in libraries like `stdio.h`, `stdlib.h`, `string.h`, and others, which are key to C programming.
   
### **Focus on Annexes**

- **Annex J**: Lists common undefined and implementation-defined behavior. This is useful to avoid pitfalls, as C leaves many behaviors (e.g., overflow of signed integers, uninitialized variables) undefined.
- **Annex K**: (Optional) defines the bounds-checking interfaces, which adds more safety to certain standard functions. Some platforms might not support this, but it’s still worth noting.

## **Understand Technical Terminology**
   
To properly grasp the documentation, you must become familiar with the technical language of the standard. This section highlights the most commonly used terms in the standard:

- **Undefined Behavior**: Refers to situations where the C standard doesn’t define what happens, meaning the compiler can do anything. Understanding this helps prevent bugs and platform-specific code.
- **Implementation-defined Behavior**: The compiler must document what it does in certain situations, but it can vary between implementations. Examples include sizes of `int` or behavior of left-shift on negative numbers.
- **Well-defined/Conforming**: Well-defined behavior adheres to the standard, meaning code will run predictably across compliant compilers.
- **Shall/Should/May**: These are strict terminologies in the C standard:
  - **Shall**: A mandatory requirement.
  - **Should**: A recommended behavior but not strictly required.
  - **May**: Optional behavior that can vary based on implementation.

---

## **Use of Formal Language (BNF/EBNF Notation)**

The standard often defines grammar and syntax using a formal notation called **Backus-Naur Form (BNF)** or its extended version **EBNF**. This notation describes the valid forms of expressions and statements. Here’s how to read it:

- **Non-terminal symbols**: These are rules that need further breakdown. They appear on the left-hand side and are usually enclosed in angle brackets `<statement>`.
- **Terminal symbols**: These are basic tokens in the language (e.g., keywords like `if`, operators like `+`).
- **Optional elements**: Represented with square brackets `[]`. It means the element is not mandatory.
- **Repetition**: Often shown with curly braces `{}` or an asterisk `*`, indicating that a particular syntax can be repeated.
   
Example of reading EBNF:
```
<if-statement> ::= "if" "(" <expression> ")" <statement> ["else" <statement>]
```
This means that an `if` statement consists of the `if` keyword, followed by an expression in parentheses, followed by a statement. Optionally, an `else` statement may appear.

## **Pay Attention to Undefined and Implementation-defined Behavior**
   
One of the most challenging aspects of C is that it leaves certain behaviors undefined or implementation-defined. This flexibility makes C both powerful and dangerous. Key to understanding the standard is recognizing these behaviors and how to avoid them:

- **Undefined Behavior (UB)**: The standard doesn't define what happens. Examples:
  - Dereferencing null pointers.
  - Accessing out-of-bounds array elements.
  - Integer overflow with signed integers.
   
  **Strategy**: Always validate inputs, avoid dangerous patterns (e.g., pointer arithmetic without bounds checks), and enable compiler flags like `-Wall` (GCC) to catch potential UB.
   
- **Implementation-defined Behavior**: C allows different implementations to define certain aspects (e.g., size of `int`, representation of `char`). This is why portability can be a challenge in C.
   
  **Strategy**: Avoid making assumptions about platform-specific behavior and use fixed-width integer types (`int32_t`, `uint8_t`, etc.) when necessary for portability.

## **Reading Standard Library Function Signatures**
   
C17 has an extensive standard library, and its function signatures often use technical language. A proper understanding of how to read these is crucial:
   
- **Function Prototype**: In C, this includes the return type, the function name, and the parameters.
   ```c
   int printf(const char *format, ...);
   ```
   - `int`: Return type. `printf` returns an integer, typically the number of characters printed.
   - `const char *format`: A pointer to a constant character array (the format string).
   - `...`: Indicates variable arguments.
   
- **Function Contracts**: The documentation specifies the "contract" of a function, which includes:
   - **Preconditions**: What the function expects (e.g., the format string must be valid).
   - **Postconditions**: What the function guarantees after it runs (e.g., how many characters it printed).
   - **Side effects**: Whether the function modifies global state or interacts with the environment (e.g., file output).

---

## **Handling Technical Jargon in Descriptions**

Certain terms in C17 documentation are dense and may seem overwhelming. Break them down:

- **Type Qualifiers**: Words like `const` and `volatile` describe how a variable can be used. `const` means it can’t be changed after initialization, while `volatile` tells the compiler not to optimize the variable because it can be changed outside of program control (e.g., by hardware).
- **Pointer and Reference Jargon**:
   - **Lvalue**: Refers to an object that persists beyond a single expression (usually the variable name).
   - **Rvalue**: A temporary value that does not persist beyond the expression (e.g., result of `x + 1`).
   
   Understanding these terms is essential for mastering C’s memory model and how pointers and arrays behave.

## **Exploring Examples in the Standard**

The C17 standard includes a number of code examples that demonstrate correct usage of syntax and semantics. Use these as a starting point to build your understanding. As you read the documentation, experiment with these examples by implementing them and seeing the output.

---

## **Utilize External References and Summaries**
   

Sometimes, the C standard can be dense and difficult to interpret directly. Using external resources such as books (Outside this book), online tutorials, or summaries that explain sections of the standard can be immensely helpful.

---

### Summary

Understanding the C standard documentation requires patience, attention to detail, and familiarity with technical terminology. Focus on critical sections (syntax, semantics, library functions), grasp undefined and implementation-defined behavior, and use external resources when necessary. By methodically approaching the standard, you’ll gain a deep understanding of C and be able to write reliable, portable code.