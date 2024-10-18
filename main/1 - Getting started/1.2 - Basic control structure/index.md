# 1.2 - Basic control structure

In programming, control structures are fundamental elements that govern the flow of execution within a program. These structures enable decisions to be made, repetitive tasks to be handled efficiently, and the smooth progression of a program from one operation to another. They primarily include:

- **Conditional Statements**: `if`, `else if`, `else`, `switch`
- **Loops**: `for`, `while`, `do-while`
- **Jump Statements**: `break`, `continue`, `return`, `goto`


## **Conditional Statements**
Conditional statements allow a program to make decisions and execute code blocks based on conditions.

### a. `if` Statement
The `if` statement is the most basic form of decision-making. It allows code to be executed only if a particular condition is true.

#### Syntax:
```c
if (condition) {
    // Block of code to be executed if the condition is true
}
```

#### Example:
```c
int a = 10, b = 20;
if (a < b) {
    printf("a is less than b\n");
}
```
In this example, the condition `a < b` evaluates to true, so the message "a is less than b" is printed.

### b. `else` Statement
The `else` statement complements `if`. It defines a block of code to execute if the `if` condition is false.

#### Syntax:
```c
if (condition) {
    // Block of code if the condition is true
} else {
    // Block of code if the condition is false
}
```

#### Example:
```c
int a = 10, b = 20;
if (a > b) {
    printf("a is greater than b\n");
} else {
    printf("a is less than or equal to b\n");
}
```
Here, since `a > b` is false, the `else` block will execute, printing "a is less than or equal to b".

### c. `else if` Statement
The `else if` statement allows you to test multiple conditions sequentially. As soon as one condition is met, the corresponding block is executed, and no further conditions are checked.

#### Syntax:
```c
if (condition1) {
    // Block of code if condition1 is true
} else if (condition2) {
    // Block of code if condition2 is true
} else {
    // Block of code if none of the conditions are true
}
```

#### Example:
```c
int marks = 85;
if (marks >= 90) {
    printf("Grade: A\n");
} else if (marks >= 75) {
    printf("Grade: B\n");
} else if (marks >= 60) {
    printf("Grade: C\n");
} else {
    printf("Fail\n");
}
```
In this example, the program checks conditions sequentially, and since `marks >= 75` is true, it prints "Grade: B".

### Ternary Operation

In C, a **ternary operator** (`? :`) offers a shorthand way to write simple `if-else` statements. It is useful for cases where the `if-else` structure only involves assigning values or returning results based on a condition. This operator can reduce the verbosity of your code and make it more concise.

Basic Syntax:
```c
condition ? expression_if_true : expression_if_false;
```

- **condition**: The logical condition to evaluate.
- **expression_if_true**: Executed if the condition is true.
- **expression_if_false**: Executed if the condition is false.

Example:

Using `if-else`:
```c
int a = 10, b = 20;
int max;

if (a > b) {
    max = a;
} else {
    max = b;
}
```

Using the Ternary Operator:
```c
int a = 10, b = 20;
int max = (a > b) ? a : b;
```

In this case, the ternary operator checks whether `a > b` and assigns `a` to `max` if true, otherwise assigns `b` to `max`.

Important Considerations:
- **Readability**: Ternary operators should be used sparingly for simple, short expressions. Overusing them, especially for more complex conditions or multiple operations, can reduce readability.
- **Nesting**: While ternary operators can be nested, this is discouraged because it can lead to difficult-to-read and maintain code.

### Example of Nesting (Not recommended for complex cases):
```c
int a = 10, b = 20, c = 5;
int max = (a > b) ? a : (b > c) ? b : c;
```

Here, the code checks if `a > b` first, and if not, it checks whether `b > c`. While this is valid syntax, it can quickly become unreadable if expanded further.

## d. `switch` Statement
The `switch` statement is an alternative to multiple simple `if-else` statements. It tests the value of a single variable and executes one block of code depending on the case that matches the value.

### Syntax:
```c
switch (expression) {
    case constant1:
        // Block of code if expression equals constant1
        break;
    case constant2:
        // Block of code if expression equals constant2
        break;
    default:
        // Block of code if no case matches
}
```

### Example:
```c
int day = 3;
switch (day) {
    case 1:
        printf("Monday\n");
        break;
    case 2:
        printf("Tuesday\n");
        break;
    case 3:
        printf("Wednesday\n");
        break;
    default:
        printf("Invalid day\n");
}
```
Here, the value of `day` matches `3`, so "Wednesday" is printed.

---

# 2. **Looping Structures**
Loops allow code to be executed repeatedly based on a condition.

## a. `for` Loop
the `for` loop is commonly used for iterations where the number of repetitions is known beforehand.

### Syntax:
```c
for (initialization; condition; increment/decrement) {
    // Block of code to be executed
}
```

### Example:
```c
for (int i = 0; i < 5; i++) {
    printf("i = %d\n", i);
}
```
This loop initializes `i` to 0, checks if `i` is less than 5, and increments `i` after each iteration. It prints the value of `i` until `i` becomes 5.

## b. `while` Loop
The `while` loop is used when the number of iterations is not known in advance, and the loop should continue as long as a condition is true.

### Syntax:
```c
while (condition) {
    // Block of code to be executed
}
```

### Example:
```c
int i = 0;
while (i < 5) {
    printf("i = %d\n", i);
    i++;
}
```
This loop continues until `i` reaches 5, printing the value of `i` at each step.

#### c. `do-while` Loop
The `do-while` loop is similar to the `while` loop, but the condition is evaluated after the loop body has executed. This ensures that the loop runs at least once.

#### Syntax:
```c
do {
    // Block of code to be executed
} while (condition);
```

#### Example:
```c
int i = 0;
do {
    printf("i = %d\n", i);
    i++;
} while (i < 5);
```
Here, the loop will execute the block of code at least once before checking the condition.

---

## 3. **Jump Statements**
Jump statements alter the normal flow of control by jumping directly to a specific part of the program or exiting from a block of code.

### a. `break` Statement
The `break` statement is used to exit a loop or `switch` statement prematurely.

#### Example:
```c
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        break;
    }
    printf("i = %d\n", i);
}
```
In this example, when `i` equals 5, the `break` statement exits the loop, and the program stops printing values.

### b. `continue` Statement
the `continue` statement skips the current iteration of the loop and moves to the next iteration.

##### Example:
```c
for (int i = 0; i < 10; i++) {
    if (i == 5) {
        continue;
    }
    printf("i = %d\n", i);
}
```
When `i` equals 5, the `continue` statement skips printing and moves to the next iteration.

### c. `return` Statement
The `return` statement exits a function and optionally returns a value to the calling function.

#### Example:
```c
int sum(int a, int b) {
    return a + b;
}
```
In this function, `return` exits the function and returns the sum of `a` and `b`.

### d. `goto` Statement
The `goto` statement allows for an unconditional jump to a labeled statement. 

> [!CAUTION]
> `goto` It is rarely used due to the potential for making code difficult to read.

##### Syntax:
```c
goto label;
...
label:
    // Block of code
```

##### Example:
```c
int i = 0;
if (i == 0) {
    goto skip;
}
printf("This won't be printed\n");
skip:
printf("This is printed\n");
```
Here, the `goto` statement jumps to the `skip` label, skipping the first `printf` statement.

---

## Summary

Basic control structures enable effective control over the flow of execution in a program:

- **Conditional Statements**: Provide decision-making capabilities (`if`, `else if`, `else`, `switch`).
- **Looping Constructs**: Allow repetitive execution (`for`, `while`, `do-while`).
- **Jump Statements**: Alter the normal flow of execution (`break`, `continue`, `return`, `goto`).
