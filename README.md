# PFL First Project — Logical Calculator

A logical proposition calculator developed in **Haskell** for the **Functional and Logic Programming (PFL)** course at FEUP (2026/2027).

The program parses logical expressions and classifies them based on their truth values across all possible variable assignments.

## Features

The calculator supports:

- **Boolean constants:** `T` (True) and `F` (False).
- **Variables:** Single lowercase letters (`a`–`z`).
- **Logical operators:** Negation (`!`), conjunction (`&`) and disjunction (`|`).
- **Parentheses:** Nested expressions and operator precedence.
- **Truth tables:** Generation of all possible Boolean assignments.
- **Classification:** Automatic identification of tautologies, contradictions and contingent propositions.

Each proposition is classified as:

| Classification | Description |
|---|---|
| `TAUTOLOGY` | Always true, regardless of variable assignments. |
| `CONTRADICTION` | Always false, regardless of variable assignments. |
| `CONTINGENT` | Can be true or false depending on variable assignments. |

## Project Structure

```text
PFL-FirstProject/
├── Main.hs
├── src/
│   ├── App.hs
│   ├── Logic.hs
│   ├── Parsing.hs
│   ├── Prop.hs
│   └── PropParser.hs
├── examples/
│   └── Calculator.hs
├── .ghci
├── .gitignore
├── hie.yaml
└── README.md
```

### Module Overview

| Module | Description |
|---|---|
| `Main.hs` | Application entry point. |
| `App.hs` | Handles input, output and expression processing. |
| `Logic.hs` | Evaluates propositions, generates truth tables and classifies results. |
| `Prop.hs` | Defines the logical proposition data type. |
| `PropParser.hs` | Parses logical expressions into syntax trees. |
| `Parsing.hs` | Parsing library provided in Lecture 11. |

The project follows a **modular structure**, separating the parsing logic, proposition evaluation and input/output handling.

## How to Run

Make sure **GHC** is installed.

From the project's root directory, run:

```bash
runghc -isrc Main.hs
```

Enter logical propositions, one per line. Press `Ctrl+D` to finish the input.

Alternatively, run the program using an input file:

```bash
runghc -isrc Main.hs < input.txt
```

### Example Input

```text
T
a&F
a
a|!a
!p&!!p
p&T|p
p|!p&q
p&!p&p
!(p&q)|p
```

### Expected Output

```text
TAUTOLOGY
CONTRADICTION
CONTINGENT
TAUTOLOGY
CONTRADICTION
CONTINGENT
CONTINGENT
CONTRADICTION
TAUTOLOGY
```

## Implementation

The project consists of two main tasks.

### Task 1 — Logical Expression Parsing

A recursive parser converts logical expressions into syntax trees using the `Prop` data type.

The parser follows the operator precedence:

1. **NOT (`!`)** — Highest precedence.
2. **AND (`&`)** — Intermediate precedence.
3. **OR (`|`)** — Lowest precedence.

Parentheses can override the default precedence.

### Task 2 — Proposition Evaluation and Classification

The classification process consists of:

1. Extracting the unique variables from a proposition.
2. Generating all possible Boolean assignments.
3. Evaluating the proposition for each assignment.
4. Classifying the proposition based on the resulting truth table.
