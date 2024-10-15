## Junções (JOIN)

As junções são operações fundamentais em SQL que permitem combinar registros de duas ou mais tabelas com base em uma condição relacionada. Vamos explorar os diferentes tipos de junções: **INNER JOIN**, **LEFT JOIN**, **RIGHT JOIN**, **FULL JOIN** e **CROSS JOIN**.

### **** INNER JOIN

O **INNER JOIN** retorna apenas as linhas que têm correspondência em ambas as tabelas. Se não houver correspondência, a linha não será incluída no resultado.

**Exemplo**:
Suponha que temos duas tabelas: `Funcionarios` e `Departamentos`.

- `Funcionarios`
  | ID | Nome   | DeptID |
  |----|--------|--------|
  | 1  | Pedro  | 101    |
  | 2  | Maria  | 102    |
  | 3  | Paulo  | 101    |

- `Departamentos`
  | DeptID | NomeDepto   |
  |--------|-------------|
  | 101    | Financeiro  |
  | 102    | Recursos Humanos |

Consulta usando INNER JOIN:
```sql
SELECT Funcionarios.Nome, Departamentos.NomeDepto
FROM Funcionarios
INNER JOIN Departamentos ON Funcionarios.DeptID = Departamentos.DeptID;
```
**Resultado**:
| Nome   | NomeDepto          |
|--------|--------------------|
| Pedro  | Financeiro         |
| Maria  | Recursos Humanos    |
| Paulo  | Financeiro         |

### **** LEFT JOIN

O **LEFT JOIN** retorna todas as linhas da tabela à esquerda e as linhas correspondentes da tabela à direita. Se não houver correspondência, os resultados da tabela à direita serão NULL.

**Exemplo**:
```sql
SELECT Funcionarios.Nome, Departamentos.NomeDepto
FROM Funcionarios
LEFT JOIN Departamentos ON Funcionarios.DeptID = Departamentos.DeptID;
```
**Resultado**:
| Nome   | NomeDepto          |
|--------|--------------------|
| Pedro  | Financeiro         |
| Maria  | Recursos Humanos    |
| Paulo  | Financeiro         |

Se adicionarmos um funcionário sem departamento:
- `Funcionarios`
  | ID | Nome   | DeptID |
  |----|--------|--------|
  | 4  | Carlos | NULL   |

O resultado do LEFT JOIN agora será:
| Nome   | NomeDepto          |
|--------|--------------------|
| Pedro  | Financeiro         |
| Maria  | Recursos Humanos    |
| Paulo  | Financeiro         |
| Carlos | NULL               |

### **** RIGHT JOIN

O **RIGHT JOIN** é o oposto do LEFT JOIN. Ele retorna todas as linhas da tabela à direita e as linhas correspondentes da tabela à esquerda. Se não houver correspondência, os resultados da tabela à esquerda serão NULL.

**Exemplo**:
```sql
SELECT Funcionarios.Nome, Departamentos.NomeDepto
FROM Funcionarios
RIGHT JOIN Departamentos ON Funcionarios.DeptID = Departamentos.DeptID;
```
**Resultado**:
| Nome   | NomeDepto          |
|--------|--------------------|
| Pedro  | Financeiro         |
| Maria  | Recursos Humanos    |
| Paulo  | Financeiro         |
| NULL   | Recursos Humanos    |

### **** FULL JOIN

O **FULL JOIN** combina os resultados do LEFT e RIGHT JOIN. Retorna todas as linhas de ambas as tabelas, com NULLs onde não há correspondência.

**Exemplo**:
```sql
SELECT Funcionarios.Nome, Departamentos.NomeDepto
FROM Funcionarios
FULL OUTER JOIN Departamentos ON Funcionarios.DeptID = Departamentos.DeptID;
```
**Resultado**:
| Nome   | NomeDepto          |
|--------|--------------------|
| Pedro  | Financeiro         |
| Maria  | Recursos Humanos    |
| Paulo  | Financeiro         |
| Carlos | NULL               |
| NULL   | Recursos Humanos    |

### **** CROSS JOIN

O **CROSS JOIN** retorna o produto cartesiano das duas tabelas, ou seja, combina todas as linhas de uma tabela com todas as linhas da outra.

**Exemplo**:
```sql
SELECT Funcionarios.Nome, Departamentos.NomeDepto
FROM Funcionarios
CROSS JOIN Departamentos;
```
Se tivermos duas tabelas com três funcionários e dois departamentos, o resultado será seis combinações.

### Exercícios Práticos

1. **INNER JOIN**: Crie uma consulta para listar todos os funcionários e seus respectivos departamentos usando INNER JOIN.

2. **LEFT JOIN**: Crie uma consulta para listar todos os departamentos e seus funcionários, mesmo aqueles que não têm funcionários atribuídos.

3. **RIGHT JOIN**: Crie uma consulta para listar todos os funcionários e seus departamentos, garantindo que todos os departamentos sejam mostrados, mesmo aqueles sem funcionários.

4. **FULL JOIN**: Crie uma consulta para listar todos os funcionários e todos os departamentos, mostrando onde não há correspondências.

5. **CROSS JOIN**: Crie uma consulta para listar todos os possíveis pares de funcionários e departamentos.

