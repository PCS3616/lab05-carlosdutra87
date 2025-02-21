@ /0000  JP MAIN

@ /0300       ; Variáveis e constantes
     N K =0        ; Contador n
     SQUARE K =0   ; Soma acumulada (n²)
     ADDR K /0102  ; Endereço base para salvar
     TWO K =2      ; Constante 2
     ONE K =1      ; Constante 1
     LIMIT K =63   ; Limite n = 63
     TMP K =0      ; Temporário para armazenar endereço
     OPSALVA K /9000

     @ /0100       ; Início da tabela de quadrados perfeitos

     @ /0200       ; Código começa aqui
     MAIN LV /000; AC = 0 (n = 0)
     MM N          ; Armazena n
     MM SQUARE     ; Zera a soma acumulada

LOOP LD N          ; AC = n
     ML TWO        ; AC = 2 * n
     AD ONE        ; AC = 2 * n + 1
     AD SQUARE     ; Soma acumulada += (2 * n + 1)
     MM SQUARE     ; Atualiza o quadrado de n

     LD ADDR       ; Carrega o endereço onde salvar
     AD OPSALVA    ; Soma o opcode MM com o endereço
     MM SALVA      ; Atualiza a instrução SALVA abaixo
     LD SQUARE     ; Carrega o aquare
     SALVA K =0    ; Instrução MM [valor de ADDR]
     
     LD ADDR       ; Incrementa o endereço de armazenamento
     AD TWO        ; Próximo endereço (2 bytes)
     MM ADDR       ; Atualiza ADDR


     LD N          ; Incrementa n
     AD ONE        
     MM N

     SB LIMIT      ; Verifica se n >= 64
     JZ END        ; Se sim, fim do programa

     JP LOOP       ; Volta para calcular o próximo quadrado

END  HM /0000      ; Halt - fim do programa
