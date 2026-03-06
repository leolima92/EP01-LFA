# EP01-LFA

# Tradutor de Números Romanos – Autômato Finito Determinístico (Transdutor)

## Descrição

Este projeto implementa um **Transdutor Finito Determinístico (AFD)** capaz de reconhecer números representados em **algarismos romanos** e convertê-los para o sistema **indo-arábico (decimal)**.

O autômato percorre a cadeia de entrada símbolo por símbolo e, a cada transição válida, acumula o valor decimal correspondente.

O sistema também valida a entrada, rejeitando sequências inválidas como:

- IC
- VX
- MMMM

O tradutor reconhece números romanos até **3999**, seguindo as regras tradicionais da numeração romana.

---

# Modelo Formal do Autômato

O transdutor pode ser definido formalmente como:

```

T = (Q, Σ, Γ, δ, λ, q0, F)

```

Onde:

## Q – Conjunto de Estados

O conjunto de estados representa os possíveis contextos da leitura da cadeia.

Exemplos de estados utilizados:

```

Q = {
q0,
qM1, qM2, qM3,
qH0,
qT0,
qU0,
qI, qII, qIII,
qV, qVI, qVII, qVIII,
qF
}

```

Cada grupo de estados representa uma **parte do número romano**:

- Milhares
- Centenas
- Dezenas
- Unidades

---

## Σ – Alfabeto de Entrada

O alfabeto de entrada é formado pelos símbolos da numeração romana:

```

Σ = { I, V, X, L, C, D, M }

```

---

## Γ – Alfabeto de Saída

O alfabeto de saída corresponde aos valores decimais que podem ser emitidos durante as transições:

```

Γ = { 1, 5, 10, 50, 100, 500, 1000 }

```

---

## q0 – Estado Inicial

```

q0

```

Representa o estado inicial antes da leitura da cadeia.

---

## F – Conjunto de Estados Finais

Estados que representam o reconhecimento válido da cadeia.

Exemplo:

```

F = { q0, qI, qII, qIII, qV, qVI, qVII, qVIII, qF }

```

---

# Tipo de Transdutor

O modelo implementado é um **Transdutor de Mealy**.

### Motivo

A saída depende **da transição realizada**, ou seja, do par:

```

(estado atual, símbolo de entrada)

```

Exemplo:

```

δ(qI, V) → qF
λ(qI, V) = +3

```

Isso ocorre no caso da conversão de **IV**, onde:

```

1 + 3 = 4

```

Portanto a saída é produzida **na transição**, característica do modelo de **Mealy**.

---

# Regras da Numeração Romana

| Símbolo | Valor |
|-------|------|
| I | 1 |
| V | 5 |
| X | 10 |
| L | 50 |
| C | 100 |
| D | 500 |
| M | 1000 |

### Regras aplicadas

Se um símbolo menor vier **antes** de um maior → **subtração**

Exemplo:

```

IV = 4
IX = 9

```

Se um símbolo menor vier **depois** de um maior → **adição**

Exemplo:

```

VI = 6
VIII = 8

```

---

# Exemplos de Conversão

| Romano | Decimal |
|------|------|
| III | 3 |
| IV | 4 |
| IX | 9 |
| XIV | 14 |
| XXIX | 29 |
| XLII | 42 |
| LXXXVIII | 88 |
| CXCIV | 194 |
| MCMXC | 1990 |
| MMXXIV | 2024 |

---

# Estrutura do Projeto

```

roman-transducer/
│
├── src/
│   └── main.rb
│
├── docs/
│   └── automato.mmd
│
└── README.md

```

---

# Execução

Para executar o programa:

```

ruby main.rb

```

Exemplo de uso:

```

Digite um número romano: VIII
Resultado: 8

```

---

# Complexidade

O autômato percorre a cadeia **uma única vez**.

Portanto a complexidade é:

```

O(n)

```

onde **n** é o tamanho da cadeia de entrada.

---

# Diagrama do Autômato

O diagrama do autômato foi modelado utilizando **Mermaid** e pode ser encontrado em:

```

docs/automato.mmd

```

---

# Autores

Projeto desenvolvido para a disciplina de **Linguagens Formais e Autômatos**.
```

---

## Próximo passo importante

Agora precisamos criar o **diagrama Mermaid do autômato**, porque o professor pediu isso explicitamente.

Se quiser, eu posso te gerar **o Mermaid completo do AFD romano** que encaixa exatamente com esse código.
