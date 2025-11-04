# Revisão de Sistemas Digitais: ADC, DAC e PWM

Este documento organiza os conceitos-chave da revisão e fornece as respostas didaticamente explicadas para as questões propostas.

---

## 1. Conceitos-Chave (Formato Flashcard)

### Teorema de Nyquist-Shannon (Taxa de Amostragem $f_s$)
**Explicação:** Para evitar distorção (*aliasing*), a taxa de amostragem ($f_s$) deve ser pelo menos o dobro da maior frequência do sinal ($f_{max}$) que se deseja medir.  
**Fórmula:** $f_s \ge 2 \cdot f_{max}$.

---

### Aliasing (Distorção por Sobreposição)
**Explicação:** É a distorção que ocorre quando se amostra um sinal a uma frequência muito baixa (abaixo da regra de Nyquist). O sinal digital resultante parece ter uma frequência mais baixa do que o sinal original.

---

### Amostragem (Processo A/D)
**Explicação:** É o processo de medir (coletar amostras) de um sinal analógico contínuo em intervalos de tempo discretos e regulares. É o "quando" medimos o sinal.

---

### Quantização (Processo A/D)
**Explicação:** É o processo de aproximar o valor analógico contínuo (medido na amostragem) para o nível digital (discreto) mais próximo disponível. É o "arredondamento" do valor para o que o ADC consegue representar.

---

### Resolução (LSB - Least Significant Bit)
**Explicação:** É o menor degrau de quantização, ou seja, a menor mudança na tensão de entrada que o ADC consegue detectar. Quanto menor o LSB, maior a precisão (resolução) do conversor.

---

### Cálculo do LSB (Tamanho do Degrau)
**Explicação:** $LSB = V_{ref} / (2^N - 1)$, onde $V_{ref}$ é a tensão de referência e $N$ é o número de bits do ADC.  
Para 10 bits, temos $2^{10} = 1024$ níveis (de 0 a 1023), o que dá 1023 intervalos.

---

### Efeito de $V_{ref}$ na Resolução
**Explicação:** Mantendo o número de bits (N) constante, se você **aumentar** $V_{ref}$, o tamanho do LSB também **aumenta**. Isso significa que a resolução *piora*, pois cada "degrau" da escada de quantização fica maior.

---

### Função do ADC (Conversor Analógico-Digital)
**Explicação:** Converte um sinal analógico contínuo (do mundo real, vindo de um sensor) em um valor digital discreto (um número binário) que o computador ou microcontrolador possa entender.

---

### Função do DAC (Conversor Digital-Analógico)
**Explicação:** Converte um código digital (um número binário vindo do processador) em um sinal analógico (tensão ou corrente) proporcional àquele código.

---

### PWM (Modulação por Largura de Pulso)
**Explicação:** É uma técnica digital usada para *simular* uma saída analógica. Ela gera uma tensão média controlando a largura (o *duty cycle*) de um pulso digital que liga e desliga rapidamente.

---

### Duty Cycle (Ciclo de Trabalho) do PWM
**Explicação:** É a porcentagem de tempo que o sinal digital permanece em nível ALTO (ligado) dentro de um período.  
Um duty cycle de 25% significa que o sinal fica 25% do tempo ligado e 75% desligado.

---

### Cálculo da Tensão Média (PWM)
**Explicação:** $V_{média} = V_{max} \cdot \text{Duty Cycle}$.  
**Exemplo:** Um sinal de 12 V com 25% de duty cycle resulta em $12 V \cdot 0,25 = 3 V$ de tensão média.

---

### Fluxo de Sinal (Sensor → Atuador)
**Explicação:**  
Sensor (Analógico) → ADC (Converte para Digital) → Processamento Digital (CPU/Microcontrolador) → DAC ou PWM+RC (Converte para Analógico) → Atuador (Analógico).

---

### PWM+RC vs. DAC Dedicado
**Explicação:**
- **PWM + RC (Filtro Passa-Baixa):** É uma forma barata de criar um DAC. O PWM gera os pulsos e o filtro RC "suaviza" esses pulsos, extraindo a tensão média.  
  Ideal para saídas lentas e de baixa precisão (ex: controlar intensidade de LED, aquecedor, velocidade de motor).
- **DAC Dedicado:** É um chip específico, mais caro, usado para saídas que exigem alta velocidade e alta precisão (ex: geração de áudio, sinais de teste).

---

## 2. Resolução das Questões da Revisão

### Questão 1 – Nyquist
**Pergunta:** Considerando um sinal cuja maior frequência é $f_{max}$, qual relação deve atender a taxa de amostragem $f_s$ para evitar aliasing?  
**Resposta Correta:** c) $f_s \ge 2 \cdot f_{max}$  

**Explicação Didática:**  
Esta é a Regra de Nyquist-Shannon. Imagine que você está filmando uma roda girando. Se filmar muito devagar, a roda pode parecer estar parada ou girando para trás (*aliasing*).  
Para capturar corretamente o movimento, você precisa tirar "fotos" (amostras) a uma taxa pelo menos o dobro da frequência mais rápida do sinal.

---

### Questão 2 – Resolução/LSB
**Pergunta:** Um ADC de 10 bits com $V_{ref}=5$ V tem tamanho de LSB igual a:  
**Resposta Correta:** b) 5 V / 1023 ≈ 4,88 mV  

**Explicação Didática:**
- **Nº de Bits (N):** 10  
- **Nº de Níveis:** $2^{10} = 1024$ níveis (de 0 a 1023)  
- **Nº de Intervalos:** 1023  
- **Cálculo:**  
  $LSB = V_{ref} / (2^N - 1)$  
  $LSB = 5 V / 1023 ≈ 0,004887 V ≈ 4,88 mV$

---

### Questão 3 – PWM (Tensão Média)
**Pergunta:** Um PWM de 12 V a 25% de duty cycle aplicado a uma carga resulta (idealmente) em tensão média de:  
**Resposta Correta:** b) 3 V  

**Explicação Didática:**  
$V_{média} = V_{max} \cdot \text{Duty Cycle}$  
$V_{média} = 12 V \cdot 0,25 = 3 V$

---

### Questão 4 – Fluxo de Sinal e PWM/DAC
**Pergunta:** Descreva o fluxo "Sensor (analógico) → ADC → Processamento digital → PWM+RC (ou DAC) → Atuador (analógico)". Explique quando preferir PWM+RC e quando optar por DAC dedicado.

**Resposta Didática:**

**Descrição do Fluxo:**  
1. **Sensor (analógico):** Mede uma grandeza real (ex: temperatura, luz, som).  
2. **ADC:** Converte o sinal analógico em digital (amostragem e quantização).  
3. **Processamento Digital:** O microcontrolador analisa os dados e toma decisões.  
4. **PWM+RC (ou DAC):** Converte o comando digital de volta para analógico.  
5. **Atuador (analógico):** Executa a ação física (motor, LED, alto-falante etc.).

**Comparação:**
- **PWM+RC:** Baixo custo, boa para sistemas lentos e baixa precisão (ex: LED, motor DC).  
- **DAC Dedicado:** Alta velocidade e precisão (ex: áudio, instrumentação).

---

### Questão 5 – Quantização
**Pergunta:** No processo de conversão A/D, a etapa de quantização refere-se a:  
**Resposta Correta:** c) Aproximar o valor analógico contínuo para o nível discreto mais próximo.  

**Explicação Didática:**  
O processo A/D tem duas etapas:  
1. **Amostragem:** Mede o valor em intervalos de tempo fixos.  
2. **Quantização:** Arredonda o valor analógico para o nível digital mais próximo.

---

### Questão 6 – Efeito de $V_{ref}$
**Pergunta:** Mantendo a mesma resolução (mesmo número de bits), aumentar $V_{ref}$ em um ADC:  
**Resposta Correta:** b) Aumenta o tamanho do LSB.  

**Explicação Didática:**  
Pela fórmula $LSB = V_{ref} / (2^N - 1)$, se $V_{ref}$ aumenta e $N$ é fixo, o LSB também aumenta — ou seja, a resolução piora.

---

### Questão 7 – PWM (Efeito do Duty Cycle)
**Pergunta:** Em um PWM com $V_{max}$ e frequência constantes, ao passar o duty cycle de 20% para 40%, a tensão média na carga:  
**Resposta Correta:** c) Dobra.  

**Explicação Didática:**  
$V_{média} = V_{max} \cdot \text{Duty Cycle}$  
Logo, se o duty cycle dobra (de 0,20 para 0,40), a tensão média também dobra.

---

### Questão 8 – Amostragem vs. Quantização
**Pergunta:** Explique a diferença entre amostragem e quantização usando um exemplo do cotidiano.  

**Resposta Didática:**  
Imagine medir a temperatura de um paciente:
- **Amostragem:** É *quando* você mede (ex: de hora em hora).  
- **Quantização:** É *como* o valor é registrado (ex: o termômetro mostra 37,3 °C mesmo que o valor real fosse 37,2845 °C).

Em resumo:  
- Amostragem lida com o **tempo**.  
- Quantização lida com o **valor**.

---

### Questão 9 – Necessidade de ADC/DAC
**Pergunta:** Por que ADC/DAC são necessários em sistemas digitais?  
**Resposta Correta:** b) Porque o mundo real é analógico e os computadores são digitais.  

**Explicação Didática:**  
O ADC converte sinais do mundo real (analógicos) em números binários.  
O DAC faz o caminho inverso, convertendo números digitais em sinais analógicos para controlar atuadores.

---

### Questão 10 – Conceito de DAC (em Inglês)
**Pergunta:** What is a DAC (Digital-to-Analog Converter) and what is its main function?  
**Resposta Correta:** b) A device that converts a digital code (binary numeric value) into a continuous analog signal (voltage or current) proportional to that code.  

**Explicação Didática:**  
Um DAC transforma um número digital em um sinal analógico contínuo, gerando uma tensão proporcional ao valor do código binário.

---
