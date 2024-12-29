; **********************************************************************
; * Constantes
; **********************************************************************

DISPLAYS       			EQU 0A000H  			; endereco dos displays de 7 segmentos (periferico POUT-1)
TEC_LIN        			EQU 0C000H  			; endereco das linhas do teclado (periferico POUT-2)
TEC_COL        			EQU 0E000H  			; endereco das colunas do teclado (periferico PIN)
LINHA_TECLADO  			EQU 10H     			; linha auxiliar para testagem (futura 4  linha, 1000b) 
MASCARA        			EQU 0FH     			; para isolar os 4 bits de menor peso, ao ler as colunas do teclado

COMANDOS                EQU 6000H               ; endereco de base dos comandos do MediaCenter
DEFINE_LINHA            EQU COMANDOS + 0AH      ; endereco do comando para definir a linha	
DEFINE_COLUNA   		EQU COMANDOS + 0CH      ; endereco do comando para definir a coluna
DEFINE_PIXEL    		EQU COMANDOS + 12H      ; endereco do comando para escrever um pixel
APAGA_AVISO     		EQU COMANDOS + 40H		; endereco do comando para apagar o aviso de nenhum cenario selecionado
APAGA_ECRA 	 			EQU COMANDOS + 02H		; endereco do comando para apagar todos os pixels ja desenhados
SELECIONA_CENARIO_FUNDO EQU COMANDOS + 42H		; endereco do comando para selecionar uma imagem de fundo
SELECIONA_CENARIO_FRONTAL EQU COMANDOS + 46H	; endereco do comando para selecionar uma imagem para a pausa, a frente da imagem de fundo
APAGA_CENARIO_FRONTAL	EQU COMANDOS + 44H		; endereco do comando para apagar a imagem de pausa
TOCA_SOM				EQU COMANDOS + 5AH      ; endereco do comando para tocar um som

SOM_SONDA				EQU 0 					; numero do audio da sonda
SOM_ASTEROIDE 			EQU 1					; numero do audio do asteroide mineravel
SOM_SEM_ENERGIA			EQU 2					; numero do audio de ficar sem energia
SOM_ASTEROIDE_NM		EQU 3					; numero do audio do asteroide nao mineravel
SOM_NAVE_EXPLOSAO		EQU 4					; numero do audio da nave a explodir

ECRA_NAVE_SONDA			EQU 4					; numero do ecra da nave e das sondas

APAGA_ECRA_ESPECIFICO	EQU	COMANDOS + 00H		; endereco do comando para apagar um ecra especifico
SELECIONA_ECRA_ESPECIFICO EQU COMANDOS + 04H 	; endereco do comando para selecionar um ecra especifico	  

LINHA_AST_CSD			EQU	0					; linha do asteroide no canto superior direito
COLUNA_AST_CSD			EQU	58					; coluna do asteroide no canto superior direito

LINHA_AST_CENT			EQU 0					; linha do asteroide no centro superior
COLUNA_AST_CENT			EQU	30					; coluna do asteroide no centro superior

LINHA_AST_CSE 			EQU 0					; linha do asteroide no canto superior esquerdo
COLUNA_AST_CSE			EQU	0					; coluna do asteroide no canto superior esquerdo

LIMITE_ECR 				EQU 33					; limite inferior do ecra, para detetar se o asteroide ultrapassou ou nao

POS_FORA_ECRA			EQU 64					; posicao de um asteroide fora do ecra


LINHA_TRAJETORIA_LIMITE	EQU 24					; linha a partir da qual um asteroide pode usar a mesma trajetoria que outro esteja a usar

LARGURA_ASTEROIDE		EQU 5					; largura dos asteroides

COLISAO_AST				EQU 1					; indica que houve colisao de uma sonda com um asteroide

TIPO_MINERAVEL			EQU 0					; valor entre 0 e 3 que representa o tipo asteroide mineravel

COR_PIXEL_ANM			EQU   0F556H			; cor do pixel do asteroide nao mineravel: cinzento em ARGB (opaco no maximo, vermelho e verde a 33% e azul a 40%)
COR_PIXEL_AM     		EQU   0FF7BH            ; cor do pixel do asteroide mineravel: rosa em ARGB (opaco e vermelho no maximo, verde a 46% e azul a 73%)
COR_PIXEL_ANM_A			EQU   0FF00H			; cor do pixel do asteroide nao mineravel quando atingido pela sonda: vermelho em ARGB (opaco e vermelho no maximo, verde e azul a 0)

N_ASTEROIDES			EQU 04H					; numero de asteroides que podem aparecer simultaneamente no ecra

LINHA_NAVE				EQU	26					; linha da nave (limite inferior)
COLUNA_NAVE				EQU	24					; coluna da nave (meio do ecra)
LARGURA_NAVE			EQU	17					; largura da nave
ALTURA_NAVE				EQU	6					; comprimento da nave
COR_PIXEL_R     		EQU 0FC3FH      		; cor do pixel: roxo em ARGB(opaco e azul no m ximo, vermelho a 80% e verde a 20%)
COR_PIXEL_L    			EQU 0FF93H      		; cor do pixel: laranja em ARGB(opaco e vermelho no maximo, verde a 60% e azul a 20%)
COR_PIXEL_A    			EQU 0FFF0H      		; cor do pixel: amarelho em ARGB(opaco, vermelho e verde no maximo, azul a 0)


LINHA_S_DE				EQU 26					; linha da sonda da diagonal esquerda
COLUNA_S_DE				EQU	27					; coluna da sonda da diagonal esquerda
DIRECAO_SDE				EQU -1					; direcao da sonda da diagonal esquerda em relacao as colunas

LINHA_S_C				EQU 25					; linha da sonda central
COLUNA_S_C				EQU 32					; coluna da sonda central
DIRECAO_SC				EQU 0					; a sonda central apenas vai para cima

LINHA_S_DD				EQU	26					; linha da sonda da diagonal direita
COLUNA_S_DD				EQU	37					; coluna da sonda da diagonal direita
DIRECAO_SDD				EQU 1					; direcao da sonda da diagonal direita em relacao as colunas


COR_PIXEL_S				EQU	0F0F0H				; cor do pixel da sonda: verde em ARGB


LINHA_PAINEL			EQU 29					; linha do painel (limite inferior)
COLUNA_PAINEL			EQU 29					; coluna do painel (meio da nave)
LARGURA_PAINEL			EQU 7					; largura do painel
ALTURA_PAINEL			EQU 2					; altura do painel
COR_PIXEL_B				EQU	  0FFFFH			; cor do pixel: branco em ARGB (opaco, vermelho, azul e verde a 100%)
COR_PIXEL_C				EQU	  0FA53H			; cor do pixel: castanho em ARGB (opaco a 100%, vermelho a 66%, verde a 33% e azul a 20%)
COR_PIXEL_AZULE			EQU   0F00CH			; cor do pixel: azul escuro em ARGB (opaco a 100%, vermelho e verde a 0, azul a 80%)
COR_PIXEL_AZULC			EQU   0F0CFH			; cor do pixel: azul claro em ARGB (opaco a 100%, vermelho a 0, verde a 80%, azul a 100%)
COR_PIXEL_VE			EQU	  0F090H			; cor do pixel: verde escuro em ARGB (opaco a 100%, vermelho e azul a 0, verde a 60%)
COR_PIXEL_VC			EQU   0F0F0H			; cor do pixel: verde claro em ARGB (opaco a 100%, vermelho e azul a 0, verde a 100%)
COR_PIXEL_RE			EQU   0F80AH			; cor do pixel: roxo escuro em ARGB (opaco a 100%, vermelho a 53%, verde a 0, azul a 66%)
COR_PIXEL_CINZAC		EQU	  0F887H			; cor do pixel: cinza claro em ARGB (opaco a 100%, vermelho e verde a 53%, azul a 46%)
COR_PIXEL_CINZAE		EQU   0F343H			; cor do pixel: cinza escuro em ARGB (opaco a 100%, vermelho e azul a 20%, verde a 26%)

N_PAINEIS				EQU  0005H				; numero de versoes diferentes do painel da nave

TECLA_0					EQU 0000H 		
TECLA_1 				EQU 0001H 		
TECLA_2 				EQU 0002H 
TECLA_C 				EQU 000CH
TECLA_D 				EQU 000DH 
TECLA_E 				EQU 000EH 

FATOR_ENERGIA			EQU 1000		; fator para calculo da energia em decimal
DIV_ENERGIA				EQU 10			; divisor para calculo da energia em decimal

LIMITE_SONDA			EQU 14			; linha limite que a sonda alcanca antes de desaparecer

PERDA_ENERGIA			EQU 3			; valor da perda periodica de energia
ENERGIA_SONDA			EQU 5			; valor da perda de energia ao lancar uma sonda
ENERGIA_AM				EQU 25			; valor do ganho de energia ao destruir um asteroide mineravel

N_SONDAS				EQU 03H         ; numero de sondas que podem aparecer simultaneamente no ecra

TAMANHO_PILHA			EQU 100H		; tamanho de cada pilha

CONTADOR_DISPLAY		EQU	064H		; valor inicial do contador do display (hexadecimal)

CENARIO_FUNDO_INICIO	EQU 0000H		; cenario de fundo de quando se come a o simulador
CENARIO_FUNDO_TERMIN	EQU 0001H		; cenario de fundo de quando o jogador termina o jogo voluntariamente
CENARIO_FUNDO_EXPLOSAO	EQU	0002H		; cenario de fundo de quando ocorre colis o de um asteroide com a nave e perde
CENARIO_FUNDO_JOGO		EQU 0003H		; cenario de fundo enquanto o jogador joga
CENARIO_FUNDO_ENERGIA	EQU 0004H		; cenario de fundo de quando o jogador fica sem energia na nave e perde	
CENARIO_FRONTAL_PAUSA	EQU 0005H		; cenario frontal quando o jogador coloca em pausa

INICIO_JOGO				EQU 0000H		; estado do jogo em que o jogador acabou de comecar
TERMINA_JOGO			EQU 0001H		; estado do jogo em que o jogador o terminou manualmente
EXPLODE_JOGO			EQU 0002H		; estado do jogo em que um asteroide colide com a nave e acaba
DURANTE_JOGO			EQU 0003H		; estado a meio do jogo
ENERGIA_JOGO			EQU 0004H		; estado do jogo em que o jogador fica sem energia e acaba
PAUSA_JOGO 				EQU 0005H		; estado do jogo em que o jogador colocou em pausa



; **********************************************************************
; * Dados 
; **********************************************************************

	PLACE		1000H
; Reserva de espa o para as pilhas dos processos

	STACK TAMANHO_PILHA					; espaco reservado para a pilha do processo "programa principal"
SP_inicial_prog_princ:					; endereco com que o processo "programa principal" e inicializado

	STACK TAMANHO_PILHA					; espaco reservado para a pilha do processo "teclado"
SP_inicial_teclado:						; endereco com que o processo "teclado" e inicializado

	STACK TAMANHO_PILHA * N_ASTEROIDES	; espaco reservado para a pilha de todos os processos "asteroide"
SP_inicial_asteroide:					; endereco com que cada processo "asteroide" e inicializado
										; cada processo "asteroide" vai ter o seu SP, sendo estes diferentes entre si

	STACK TAMANHO_PILHA					; espaco reservado para a pilha do processo "nave"
SP_inicial_luzes_nave:					; endereco com que o processo "nave"e  inicializado

	STACK TAMANHO_PILHA					; espaco reservado para a pilha do processo "energia"
SP_inicial_energia:						; endereco com que o processo "energia" e inicializado

	STACK TAMANHO_PILHA * N_SONDAS		; espaco reservado para a pilha de todos os processos "sonda"
SP_inicial_sonda:						; endereco com que cada processo "sonda" e inicializado
										; cada processo "sonda" vai ter o seu SP, sendo estes diferentes entre si
	
	STACK TAMANHO_PILHA					; espaco reservado para a pilha do processo "controlo"
SP_inicial_contr:						; endereco com que o processo "controlo" e inicializado


; Tabela das rotinas de interrup  o

tab:
	WORD rot_int_0						; rotina de atendimento da interrupcao 0
	WORD rot_int_1						; rotina de atendimento da interrupcao 1
	WORD rot_int_2						; rotina de atendimento da interrupcao 2
	WORD rot_int_3						; rotina de atendimento da interrupcao 3


; Tabela dos LOCKs para cada rotina de interrupcao comunicar ao processo

evento_int:
	LOCK 0								; LOCK para a rotina de interrupcao 0
	LOCK 0								; LOCK para a rotina de interrupcao 1
	LOCK 0								; LOCK para a rotina de interrupcao 2
	LOCK 0								; LOCK para a rotina de interrupcao 3

; Tabela que comunica com os restantes processos em que fase do jogo e que o jogador se encontra
; (ou seja, inicio, pausa ou terminar forcadamente)
estado_jogo:
	LOCK INICIO_JOGO					; estado inicial do jogo
	WORD INICIO_JOGO					; o teclado necessita de verificar o estado do jogo
										; sem esperar que alguma coisa seja escrita no LOCK


; LOCK para o teclado comunicar aos restantes processos que uma tecla foi detetada
tecla_detetada:
	LOCK 0					; valor da tecla pressionada (0H, 1H, 2H, ..., 0EH, 0FH)


; contador da energia do display
contador_display:
	WORD CONTADOR_DISPLAY


; linha a ser usada no teclado (para verificar se alguma tecla ainda esta a ser premida)
linha_teclado:
	WORD 0

; tecla que dispara a sonda na diagonal esquerda (tecla 0)
disp_sonda_diag_l:		; (isto e, dispara sonda diagonal left)
	WORD TECLA_0

; tecka que dispara a sonda central (tecla 1)
disp_sonda_central:
	WORD TECLA_1

; tecla que dispara a sonda na diagonal direita (tecla 2)
disp_sonda_diag_r:		; (isto e, dispara sonda diagonal right)
	WORD TECLA_2

; tecla que inicia/reinicia o jogo (tecla C)
inic_jogo:
	WORD TECLA_C

; tecla que coloca o jogo em pausa (tecla D)
pause_jogo:
	WORD TECLA_D

; tecla que termina o jogo (tecla E)
termin_jogo:
	WORD TECLA_E

; verifica se o jogo ja estava em andamento e foi retirado da pausa ou se
; foi iniciado neste preciso momento
pausa_ou_iniciar:
	WORD 0				; 0 se vai ser iniciado agora, 1 se vai ser retirado da pausa		

trajetoria_disponiveis:	; 0 se nenhum asteroide ocupa a trajet ria/ 1, 2, 3 ou 4 consoante a inst ncia a ocupar
	WORD 0				; asteroide movimenta-se do canto superior esquerdo para o canto inferior direito
	WORD 0				; asteroide movimenta-se do centro superior para o canto inferior esquerdo
	WORD 0				; asteroide movimenta-se do centro superior paro o centro inferior
	WORD 0				; asteroide movimenta-se do centro superior para o canto inferior direito
	WORD 0				; asteroide movimenta-se do canto superior direito para o canto inferior esquerdo


; informacao importante sobre os asteroides
inf_asteroides:

	; INSTANCIA 0

	WORD 0				; tipo de asteroide (0 se for mineravel, 1/2/3 se for nao mineravel)
	WORD 0				; linha atual do asteroide
	WORD 0				; coluna atual do asteroide
	WORD 0				; sentido do movimento em relacao as colunas


	; INSTANCIA 1

	WORD 0				; tipo de asteroide (0 se for mineravel, 1/2/3 se for nao mineravel)
	WORD 0				; linha atual do asteroide
	WORD 0				; coluna atual do asteroide
	WORD 0				; sentido do movimento em relacao as colunas

	; INSTANCIA 2

	WORD 0				; tipo de asteroide (0 se for mineravel, 1/2/3 se for nao mineravel)
	WORD 0				; linha atual do asteroide
	WORD 0				; coluna atual do asteroide
	WORD 0				; sentido do movimento em relacao as colunas

	; INSTANCIA 3

	WORD 0				; tipo de asteroide (0 se for mineravel, 1/2/3 se for nao mineravel)
	WORD 0				; linha atual do asteroide
	WORD 0				; coluna atual do asteroide
	WORD 0				; sentido do movimento em relacao as colunas


; indica se houve colisao entre um asteroide e uma sonda
; 0 se nao houve colisao, 1 se houve colisao
colisao_asteroides:
	WORD 0				; instancia 0
	WORD 0				; instancia 1
	WORD 0				; instancia 2
	WORD 0				; instancia 3


; numero de sondas que se encontram no ecra
n_sondas: 
	LOCK 0				; 0 se a sonda da diagonal esquerda nao estiver no ecra; 1 se estiver
	LOCK 0				; 0 se a sonda central nao estiver no ecra; 1 se estiver
	LOCK 0				; 0 se a sonda da diagonal direita nao estiver no ecra; 1 se estiver


; posicao atual das sondas
pos_sondas:		
	WORD LINHA_S_DE			; linha da sonda da diagonal esquerda
	WORD COLUNA_S_DE		; coluna da sonda da diagonal esquerda

	WORD LINHA_S_C			; linha da sonda central
	WORD COLUNA_S_C			; coluna da sonda central

	WORD LINHA_S_DD			; linha da sonda da diagonal direita
	WORD COLUNA_S_DD		; coluna da sonda da diagonal direita

sentido_sondas:
	WORD DIRECAO_SDE		; a sonda da esquerda avanca -1 colunas
	WORD DIRECAO_SC			; a sonda do centro nao avanca colunas
	WORD DIRECAO_SDD		; a sonda da direita avanca 1 coluna



def_asteroide_nm:      ; tabela que define um asteroide nao mineravel (cor, comprimento, largura, pixels)
 
	WORD		LARGURA_ASTEROIDE

	WORD		0, 0, COR_PIXEL_ANM, 0, 0
	WORD		0, COR_PIXEL_ANM, COR_PIXEL_ANM, COR_PIXEL_ANM, 0
	WORD		COR_PIXEL_ANM, COR_PIXEL_ANM, COR_PIXEL_ANM, COR_PIXEL_ANM, COR_PIXEL_ANM
	WORD		0, COR_PIXEL_ANM, COR_PIXEL_ANM, COR_PIXEL_ANM, 0
	WORD		0, 0, COR_PIXEL_ANM, 0, 0


def_asteroide_m:      ; tabela que define um asteroide mineravel (cor, comprimento, largura, pixels)
 
	WORD		LARGURA_ASTEROIDE

	WORD		0, COR_PIXEL_AM, 0, COR_PIXEL_AM, 0
	WORD		COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM
	WORD		COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM
	WORD		0, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, 0
	WORD		0, 0, COR_PIXEL_AM, 0, 0


def_asteroide_nm_atingido:      ; tabela que define um asteroide nao mineravel quando atingido pela sonda(cor, comprimento, largura, pixels)
 
	WORD		LARGURA_ASTEROIDE

	WORD		COR_PIXEL_ANM_A, 0, COR_PIXEL_ANM_A, 0, COR_PIXEL_ANM_A
	WORD		0, COR_PIXEL_ANM_A, COR_PIXEL_ANM_A, COR_PIXEL_ANM_A, 0
	WORD		COR_PIXEL_ANM_A, COR_PIXEL_ANM_A, 0, COR_PIXEL_ANM_A, COR_PIXEL_ANM_A
	WORD		0, COR_PIXEL_ANM_A, COR_PIXEL_ANM_A, COR_PIXEL_ANM_A, 0
	WORD		COR_PIXEL_ANM_A, 0, COR_PIXEL_ANM_A, 0, COR_PIXEL_ANM_A


def_asteroide_m_a1:				; tabela que define primeira forma de um asteroide mineravel quando atingido pela sonda (cor, comprimento, largura, pixels)

	WORD		LARGURA_ASTEROIDE

	WORD		0, 0, 0, 0, 0
	WORD		0, COR_PIXEL_AM, 0, COR_PIXEL_AM, 0
	WORD		COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM
	WORD		0, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, 0
	WORD		0, 0, COR_PIXEL_AM, 0, 0


def_asteroide_m_a2:				; tabela que define segunda forma de um asteroide mineravel quando atingido pela sonda (cor, comprimento, largura, pixels)

	WORD		LARGURA_ASTEROIDE

	WORD		0, 0, 0, 0, 0
	WORD		0, COR_PIXEL_AM, 0, COR_PIXEL_AM, 0
	WORD		0, COR_PIXEL_AM, COR_PIXEL_AM, COR_PIXEL_AM, 0
	WORD		0, 0, COR_PIXEL_AM, 0, 0
	WORD		0, 0, 0, 0, 0


def_asteroide_m_a3:				; tabela que define terceira forma de um asteroide mineravel quando atingido pela sonda (cor, comprimento, largura, pixels)

	WORD		LARGURA_ASTEROIDE

	WORD		0, 0, 0, 0, 0
	WORD		0, 0, 0, 0, 0
	WORD		0, 0, COR_PIXEL_AM, 0, 0
	WORD		0, 0, 0, 0, 0
	WORD		0, 0, 0, 0, 0


def_asteroide_apagar:			; tabela que define um asteroide transparente que apaga um asteroide
	WORD LARGURA_ASTEROIDE
	WORD 0, 0, 0, 0, 0
	WORD 0, 0, 0, 0, 0
	WORD 0, 0, 0, 0, 0
	WORD 0, 0, 0, 0, 0
	WORD 0, 0, 0, 0, 0


def_nave:		     ; tabela que define a nave e o painel de instrumentos (cor, comprimento, largura, pixels)
	
	WORD        LARGURA_NAVE, ALTURA_NAVE

	WORD        0, 0, 0, 0, 0, 0, 0, 0, COR_PIXEL_R, 0, 0, 0, 0, 0, 0, 0, 0
	WORD    	0, 0, 0, COR_PIXEL_RE, 0, 0, COR_PIXEL_R, COR_PIXEL_R, COR_PIXEL_R, COR_PIXEL_R, COR_PIXEL_R, 0, 0, COR_PIXEL_RE, 0, 0, 0

	WORD        0, 0, 0, COR_PIXEL_RE, COR_PIXEL_CINZAC, COR_PIXEL_CINZAC, COR_PIXEL_CINZAC, COR_PIXEL_CINZAC, COR_PIXEL_R, COR_PIXEL_CINZAC, COR_PIXEL_CINZAC, COR_PIXEL_CINZAC, COR_PIXEL_CINZAC, COR_PIXEL_RE, 0, 0, 0
	WORD		0, 0, COR_PIXEL_CINZAC, COR_PIXEL_CINZAE, COR_PIXEL_L, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_L, COR_PIXEL_CINZAE, COR_PIXEL_CINZAC, 0, 0
	
	WORD		0, COR_PIXEL_CINZAC, COR_PIXEL_CINZAE, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_A, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_CINZAE, COR_PIXEL_CINZAC, 0
	WORD 		COR_PIXEL_CINZAC, COR_PIXEL_CINZAE, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_L, COR_PIXEL_CINZAE, COR_PIXEL_CINZAC 			


def_painel_cores0:			; tabela que define o painel de cores da nave na primeira forma (cor, comprimento, largura, pixels)

	WORD	LARGURA_PAINEL, ALTURA_PAINEL

	WORD	COR_PIXEL_AM, COR_PIXEL_B, COR_PIXEL_R, COR_PIXEL_AZULE, COR_PIXEL_A, COR_PIXEL_AZULC, COR_PIXEL_A
	WORD	COR_PIXEL_A, COR_PIXEL_C, COR_PIXEL_A, COR_PIXEL_VC, COR_PIXEL_ANM_A, COR_PIXEL_A, COR_PIXEL_VE


def_painel_cores1:			; tabela que define o painel de cores da nave na segunda forma (cor, comprimento, largura, pixels)

	WORD	LARGURA_PAINEL, ALTURA_PAINEL

	WORD	COR_PIXEL_R, COR_PIXEL_ANM_A, COR_PIXEL_A, COR_PIXEL_B, COR_PIXEL_AZULC, COR_PIXEL_A, COR_PIXEL_C
	WORD	COR_PIXEL_L, COR_PIXEL_A, COR_PIXEL_AM, COR_PIXEL_AZULE, COR_PIXEL_A, COR_PIXEL_VE, COR_PIXEL_A


def_painel_cores2:			; tabela que define o painel de cores da nave na terceira forma (cor, comprimento, largura, pixels)

	WORD	LARGURA_PAINEL, ALTURA_PAINEL

	WORD	COR_PIXEL_A, COR_PIXEL_VE, COR_PIXEL_A, COR_PIXEL_ANM_A, COR_PIXEL_A, COR_PIXEL_VC, COR_PIXEL_A
	WORD	COR_PIXEL_AZULE, COR_PIXEL_B, COR_PIXEL_AM, COR_PIXEL_C, COR_PIXEL_R, COR_PIXEL_A, COR_PIXEL_AZULC


def_painel_cores3:			; tabela que define o painel de cores da nave na quarta forma (cor, comprimento, largura, pixels)

	WORD	LARGURA_PAINEL, ALTURA_PAINEL

	WORD	COR_PIXEL_B, COR_PIXEL_A, COR_PIXEL_AZULC, COR_PIXEL_A, COR_PIXEL_C, COR_PIXEL_R, COR_PIXEL_A
	WORD	COR_PIXEL_ANM_A, COR_PIXEL_AM, COR_PIXEL_A, COR_PIXEL_VC, COR_PIXEL_A, COR_PIXEL_AZULE, COR_PIXEL_L


def_painel_cores4:			; tabela que define o painel de cores da nave na quinta forma (cor, comprimento, largura, pixels)

	WORD	LARGURA_PAINEL, ALTURA_PAINEL

	WORD	COR_PIXEL_VE, COR_PIXEL_A, COR_PIXEL_AZULE, COR_PIXEL_A, COR_PIXEL_R, COR_PIXEL_A, COR_PIXEL_ANM_A
	WORD	COR_PIXEL_C, COR_PIXEL_AZULC, COR_PIXEL_B, COR_PIXEL_AM, COR_PIXEL_A, COR_PIXEL_L, COR_PIXEL_A
			


; *********************************************************************************
; * Codigo
; *********************************************************************************

	PLACE 0			; o codigo comeca em 0000H
inicio:
	MOV SP, SP_inicial_prog_princ		; inicializa SP do programa principal
	MOV BTE, tab						; inicializa BTE (registo de Base da Tabela de Excecoes)
	MOV [APAGA_AVISO], R1   			; apaga o aviso de nenhum cen rio selecionado
	MOV [APAGA_ECRA], R1				; apaga todos os pixels ja desenhados
	MOV R1, CENARIO_FUNDO_INICIO		; cenario de fundo de inicio
	MOV [SELECIONA_CENARIO_FUNDO], R1	; seleciona o cenario de fundo

	EI0									; permite interrupcoes 0
	EI1									; permite interrupcoes 1
	EI2									; permite interrupcoes 2
	EI3									; permite interrupcoes 3
	EI									; permite interrupcoes gerais


; Cria todos os processos do programa
	CALL teclado						; cria o processo teclado
	CALL controlo						; cria o processo controlo
	CALL nave							; cria o processo nave
	CALL energia						; cria o processo energia
	MOV R11, N_SONDAS					; numero de sondas que podem aparecer no ecra
ciclo_sondas:
	SUB R11, 1							; diminui no ciclo o n  de sondas
	CALL sonda							; cria uma instancia do processo sonda
	CMP R11, 0							; ja chegou a 0?
	JNZ ciclo_sondas					; se ainda nao, cria outra instancia
	
	MOV R11, N_ASTEROIDES				; n mero de asteroides que podem aparecer no ecr 
ciclo_asteroides:
	SUB R11, 1							; diminui no ciclo o n  de asteroides
	CALL asteroide						; cria uma instancia do processo asteroide
	CMP R11, 0							; ja chegou a 0?
	JNZ ciclo_asteroides				; se ainda nao, cria outra instancia


; resto do programa principal (neste caso, analisa qual a tecla detetada no teclado e realiza
;	uma funcionalidade consoante a tecla premida)

obtem_tecla:
	MOV R0, [tecla_detetada]			; bloqueia neste LOCK ate uma tecla ser carregada
	MOV R1, [estado_jogo+2]				; obtem o estado do jogo neste momento do jogo

	MOV R2, DURANTE_JOGO
	CMP R1, R2							; verifica se o jogador se encontra a meio do jogo
	JZ durante_jogo_teclas				; se sim, analisa as teclas que podem ser premidas 

	MOV R2, INICIO_JOGO
	CMP R1, R2							; verifica se o jogador se encontra na tela inicial
	JZ inicia_jogo_tecla				; se sim, apenas verifica a tecla de inicializar

	MOV R2, PAUSA_JOGO
	CMP R1, R2							; verifica se o jogador se encontra em pausa
	JZ pausa_jogo_teclas				; se sim, analisa as teclas que podem ser premidas

	MOV R2, TERMINA_JOGO
	CMP R1, R2							; verifica se o jogador terminou o jogo manualmente
	JZ inicia_jogo_tecla				; se sim, apenas verifica a tecla de inicializar

	MOV R2, EXPLODE_JOGO			
	CMP R1, R2							; verifica se um asteroide explodiu a nave
	JZ inicia_jogo_tecla				; se sim, apenas verifica a tecla de inicializar

	MOV R2, ENERGIA_JOGO				
	CMP R1, R2							; verifica se a nave ficou sem energia
	JZ inicia_jogo_tecla				; se sim, apenas verifica a tecla de inicializar

durante_jogo_teclas:
	CALL teclas_jogo_em_andamento
	JMP obtem_tecla						; pede outra tecla

inicia_jogo_tecla:
	CALL tecla_jogo_comecar
	JMP obtem_tecla						; pede outra tecla

pausa_jogo_teclas:
	CALL teclas_jogo_pausa
	JMP obtem_tecla						; pede outra tecla


	


; **********************************************************************
; Rotina
;
; TECLAS_JOGO_EM_ANDAMENTO - Verifica apenas se as teclas que tem 
;						funcionalidade foram premidas; se sim, aplicar
;						a funcionalidade especifica.
;
; Argumentos:			R0 - valor da tecla pressionada
;
; ********************************************************************** 

teclas_jogo_em_andamento:
	PUSH R1
	PUSH R2
	MOV R1, [termin_jogo]			; copia a tecla de terminar o jogo (tecla E)
	CMP R0, R1						; a tecla pressionada e a E?
	JZ	func_tecla_E_and			; se sim, ativa a funcionalidade da tecla

	MOV R1, [disp_sonda_diag_l] 	; copia a tecla de disparar a sonda na diagonal esquerda (tecla 0)
	CMP R0, R1						; a tecla pressionada e a 0?
	JZ	func_tecla_0_and			; se sim, ativa a funcionalidade da tecla

	MOV R1, [disp_sonda_central]	; copia a tecla de disparar a sonda central (tecla 1)
	CMP R0, R1						; a tecla pressionada e a 1?
	JZ  func_tecla_1_and			; se sim, ativa a funcionalidade da tecla

	MOV R1, [disp_sonda_diag_r]		; copia a tecla de disparar a sonda na diagonal direita (tecla 2)
	CMP R0, R1						; a tecla pressionada e a 2?
	JZ  func_tecla_2_and			; se sim, ativa a funcionalidade da tecla

	MOV R1, [pause_jogo]			; copia a tecla de colocar o jogo em pausa (tecla D)
	CMP R0, R1						; a tecla pressionada e a D?
	JZ	func_tecla_D_and			; se sim, ativa a funcionalidade da tecla

	JMP sai_teclas_em_jogo_andamento; se nenhuma tecla corresponder  as possiveis, nao acontece nada							

func_tecla_0_and:
	CALL func_tecla_0
	JMP sai_teclas_em_jogo_andamento

func_tecla_1_and:
	CALL func_tecla_1
	JMP sai_teclas_em_jogo_andamento

func_tecla_2_and:
	CALL func_tecla_2
	JMP sai_teclas_em_jogo_andamento

func_tecla_D_and:
	CALL func_tecla_D
	JMP sai_teclas_em_jogo_andamento

func_tecla_E_and:
	CALL func_tecla_E

sai_teclas_em_jogo_andamento:
	POP R2
	POP R1
	RET


; **********************************************************************
; Rotina
;
; TECLA_JOGO_COMECAR - Verifica apenas se a teclas de inicializar/reiniciar 
;						o jogo foi premida; se sim, aplicar
;						a funcionalidade especifica.
;
; Argumentos:			R0 - valor da tecla pressionada
;
; ********************************************************************** 

tecla_jogo_comecar:
	PUSH R1
	PUSH R2
	MOV R1, [inic_jogo]				; copia a tecla de iniciar/reinicar o jogo (tecla C)
	CMP R0, R1					; a tecla pressionada e a C?
	JZ func_tecla_C_com					; se sim, ativa a funcionalidade da tecla
	JMP sai_tecla_jogo_comecar

func_tecla_C_com:
	CALL func_tecla_C
	
sai_tecla_jogo_comecar:
	POP R2
	POP R1
	RET 


; **********************************************************************
; Rotina
;
; TECLAS_JOGO_PAUSA - Verifica apenas se as teclas que t m 
;						funcionalidade foram premidas; se sim, aplicar
;						a funcionalidade especifica.
;
; Argumentos:			R0 - valor da tecla pressionada
;
; ********************************************************************** 


teclas_jogo_pausa:
	PUSH R1
	PUSH R2
	MOV R1, [termin_jogo]				; copia a tecla de terminar o jogo (tecla E)
	CMP R0, R1					; a tecla pressionada e a E?
	JZ func_tecla_E_pau					; se sim, ativa a funcionalidade da tecla

	MOV R1, [pause_jogo]				; copia a tecla de pausar o jogo (tecla D)
	CMP R0, R1					; a tecla pressionada e a D?
	JZ func_tecla_D_pau					; se sim, ativa a funcionalidade da tecla

	JMP sai_teclas_jogo_pausa

func_tecla_D_pau:
	CALL func_tecla_C 				; como o jogo vai ser tirado da pausa, queremos apenas retirar 
									; o cenario frontal
	JMP sai_teclas_em_jogo_andamento

func_tecla_E_pau:
	CALL func_tecla_E

sai_teclas_jogo_pausa:
	POP R2 
	POP R1 
	RET

; **********************************************************************
; Rotina
;
; func_tecla_0 - Escreve no LOCK da sonda da diagonal esquerda,
;				desbloqueando os processos que se encontravam bloqueados.
;
; ********************************************************************** 
func_tecla_0:
	PUSH R1
	MOV R1, n_sondas				; vai buscar o endereco da tabela das sondas
	MOV [R1], R0					; escreve no LOCK da sonda da diagonal esquerda, desbloqueando
									; os processos que se encontravam bloqueados
	POP R1
	RET



; **********************************************************************
; Rotina
;
; func_tecla_1 - Escreve no LOCK da sonda da diagonal central,
;				desbloqueando os processos que se encontravam bloqueados.
;
; ********************************************************************** 
func_tecla_1:
	PUSH R1
	MOV R1, n_sondas				; vai buscar o endereco da tabela das sondas
	MOV [R1+2], R0					; escreve no LOCK da sonda central, desbloqueando os processos
									; que se encontravam bloqueados
	POP R1
	RET



; **********************************************************************
; Rotina
;
; func_tecla_2 - Escreve no LOCK da sonda da diagonal direita,
;				desbloqueando os processos que se encontravam bloqueados.
;
; ********************************************************************** 

func_tecla_2:
	PUSH R1
	MOV R1, n_sondas				; vai buscar o endereco da tabela das sondas
	MOV [R1+4], R0					; escreve no LOCK da sonda da diagonal direita, desbloqueando
									; os processos que se encontravam bloqueados
	POP R1
	RET



; **********************************************************************
; Rotina
;
; func_tecla_C - Escreve no LOCK do estado de jogo, mudando-o para Iniciar,
;				desbloqueando os processos que se encontravam bloqueados.
;
; ********************************************************************** 

func_tecla_C:
	PUSH R1
	PUSH R2
	MOV R1, estado_jogo				; vai buscar o endereco da tabela do estado de jogo
	MOV R2, DURANTE_JOGO			; copia o valor da constante de iniciar o jogo
	MOV [R1], R2					; escreve no LOCK do estado de jogo desbloqueando
									; os processos que se encontravam bloqueados
	MOV [R1+2], R2					; escreve na WORD da tabela o estado do jogo
	POP R2
	POP R1
	RET



; **********************************************************************
; Rotina
;
; func_tecla_D - Escreve no LOCK do estado de jogo, mudando-o para Pausa,
;				desbloqueando os processos que se encontravam bloqueados.
;
; ********************************************************************** 

func_tecla_D:
	PUSH R1
	PUSH R2
	MOV R1, estado_jogo				; vai buscar o endereco da tabela do estado de jogo	
	MOV R2, PAUSA_JOGO				; copia o valor da constante de pausar o jogo
	MOV [R1], R2					; escreve no LOCK do estado de jogo, desbloqueando 
									; os processos que se encontravam bloqueados
	MOV [R1+2], R2					; escreve na WORD do estado de jogo
	POP R2
	POP R1
	RET



; **********************************************************************
; Rotina
;
; func_tecla_E - Escreve no LOCK do estado de jogo, mudando-o para Terminar,
;				desbloqueando os processos que se encontravam bloqueados.
;
; ********************************************************************** 

func_tecla_E:
	PUSH R1
	PUSH R2
	MOV R1, estado_jogo				; vai buscar o endereco da tabela do estado de jogo
	MOV R2, TERMINA_JOGO			; copia o valor da constante de terminal o jogo
	MOV [R1], R2					; escreve no LOCK do estado de jogo, desbloqueando
									; os processos que se encontravam bloqueados
	MOV [R1+2], R2					; escreve na WORD da tabela o estado de jogo
	POP R2
	POP R1
	RET



; **********************************************************************
; Processo
;
; CONTROLO - Verifica o estado do jogo em que o jogador se encontra,
;				fazendo alteracoes no programa consoante o estado atual.
;
; **********************************************************************

PROCESS SP_inicial_contr	; indicacao que esta rotina e um processo + valor do SP

controlo:
	MOV R0, [estado_jogo]	; le o LOCK do estado do jogo (bloqueia ate ser escrito no LOCK)

	CMP R0, DURANTE_JOGO	; verifica se o jogo se encontra em execucao (ecra do jogo)
	JZ exe_contr			; se sim, aplica as funcionalidades permitidas

	CMP R0,	TERMINA_JOGO	; verifica se o jogo foi terminado forcadamente
	JZ term_contr			; se sim, aplica as funcionalidades permitidas

	CMP R0, PAUSA_JOGO		; verifica se o jogo se encontra em pausa
	JZ pausa_contr			; se sim, aplica as funcionalidades permitidas

	CMP R0, EXPLODE_JOGO	; verifica se um asteroide explodiu a nave e o jogador perdeu
	JZ explode_contr		; se sim, aplica as funcionalidades permitidas

	CMP R0, ENERGIA_JOGO	; verifica se a nave ficou sem energia e o jogador perdeu
	JZ energia_contr		; se sim, aplica as funcionalidades permitidas

exe_contr:
	CALL executar_jogo
	JMP controlo

term_contr:
	CALL termina_jogo
	JMP controlo

pausa_contr:
	CALL pausa_jogo
	JMP controlo

explode_contr:
	CALL explode_jogo 
	JMP controlo

energia_contr:
	CALL energia_jogo 
	JMP controlo


; **********************************************************************
; Rotina
;
; EXECUTAR_JOGO - Faz todas as alteracoes para iniciar o jogo.
;
; **********************************************************************


executar_jogo:
	PUSH R0
	PUSH R1
	MOV R1, [pausa_ou_iniciar]			; copia o endereco da variavel que verifica					
										; se o jogo vai ser tirado da pausa ou inicializado
	CMP R1, 0							; vai ser inicializado agora?
	JZ iniciar_executavel				; se sim, faz as inicializacoes necess rias
	MOV R1, APAGA_CENARIO_FRONTAL		; endere o para apagar o cenario frontal
	MOV [R1], R0						; apaga o cenario frontal
										; se for tirado da pausa, apenas tira o fundo
										; especifico da pausa
	JMP sai_executar_jogo
iniciar_executavel:
	MOV R1, 1							; coloca o valor a 1,
										; dizendo que o jogo foi iniciado
	MOV [pausa_ou_iniciar], R1			; coloca o valor da variavel a 1				
	MOV R0, CENARIO_FUNDO_JOGO			; copia o cenario de fundo do jogo
	MOV [SELECIONA_CENARIO_FUNDO], R0	; altera o cenario de fundo para o do jogo
	CALL desenha_nave
	MOV R0, DISPLAYS					; copia o endereco do display
	MOV R1, CONTADOR_DISPLAY			; copia o valor inicial do display
	MOV [contador_display], R1			; copia o valor para a variavel (hexadecimal)
	CALL from_hex_to_dec				; transforma o valor da energia em decimal
	MOV [R0] , R5						; inicializa o valor do display (100 em decimal)

sai_executar_jogo:
	POP R1
	POP R0
	RET



; **********************************************************************
; Rotina
;
; TERMINA_JOGO - Faz todas as alteracoes para terminar o jogo.
;
; **********************************************************************

termina_jogo:
	PUSH R0
	PUSH R1 
	MOV [APAGA_ECRA], R1			   ; apaga todos os pixels ja desenhados
	CALL limpa_pos_asteroides			; coloca os asteroides fora do ecra, para serem depois novamente criados
	MOV R1, CENARIO_FUNDO_TERMIN		; cenario de fundo de terminar
	MOV [SELECIONA_CENARIO_FUNDO], R1	; seleciona o cenario de fundo
	MOV [APAGA_CENARIO_FRONTAL], R1		; apaga a pausa, caso tenho sido o ultimo estado de jogo
	MOV R0, 0							; coloca o valor a 0,
										; dizendo que o jogo foi terminado
	MOV [pausa_ou_iniciar], R0			; coloca a variavel a 0, dizendo assim que
										; a proxima vez que o jogo comecar, certas inicializacoes
										; vao ser necessarias
sai_termina_jogo:
	POP R1
	POP R0
	RET

; **********************************************************************
; Rotina
;
; PAUSA_JOGO - Faz todas as alteracoes para colocar o jogo em pausa
;
; **********************************************************************

pausa_jogo:
	PUSH R0
	MOV R0, CENARIO_FRONTAL_PAUSA		; cenario frontal de pausa
	MOV [SELECIONA_CENARIO_FRONTAL], R0	; seleciona o cenario frontal de pausa
	POP R0
	RET


; **********************************************************************
; Rotina
;
; EXPLODE_JOGO - Faz todas as alteracoes para terminar o jogo quando o 
;				asteroide explode.
;
; **********************************************************************
	
explode_jogo:
	PUSH R0
	PUSH R1
	MOV [APAGA_ECRA], R1			   ; apaga todos os pixels ja desenhados
	CALL limpa_pos_asteroides			; coloca os asteroides fora do ecra, para serem depois novamente criados
	MOV R1, CENARIO_FUNDO_EXPLOSAO		; cenario de fundo de explosao
	MOV [SELECIONA_CENARIO_FUNDO], R1	; seleciona o cenario de fundo
	MOV R1, SOM_NAVE_EXPLOSAO			; som da nave a explodir
	MOV [TOCA_SOM], R1					; reproduz o som
	MOV R0, 0							; coloca o valor a 0,
										; dizendo que o jogo foi terminado
	MOV [pausa_ou_iniciar], R0			; coloca a variavel a 0, dizendo assim que
										; a proxima vez que o jogo comecar, certas inicializacoes
										; vao ser necessarias
	POP R1
	POP R0
	RET


; **********************************************************************
; Rotina
;
; ENERGIA_JOGO - Faz todas as alteracoes para terminar o jogo quando a
;				nave fica sem energia.
;
; **********************************************************************

energia_jogo:
	PUSH R0
	PUSH R1
	MOV [APAGA_ECRA], R1			   ; apaga todos os pixels ja desenhados
	CALL limpa_pos_asteroides			; coloca os asteroides fora do ecra, para serem depois novamente criados
	MOV R1, CENARIO_FUNDO_ENERGIA		; cenario de fundo de sem energia
	MOV [SELECIONA_CENARIO_FUNDO], R1	; seleciona o cen rio de fundo
	MOV R1, SOM_SEM_ENERGIA				; som da nave ficar sem energia
	MOV [TOCA_SOM], R1					; reproduz o som
	MOV R0, 0							; coloca o valor a 0,
										; dizendo que o jogo foi terminado
	MOV [pausa_ou_iniciar], R0			; coloca a variavel a 0, dizendo assim que
										; a proxima vez que o jogo come ar, certas inicializacoes
										; vao ser necessarias
	POP R1
	POP R0
	RET




; **********************************************************************
; Processo
;
; NAVE - Muda periodicamente o painel da nave quando e escrito algo no 
;			LOCK do evento_int (terceiro LOCK).
;
; **********************************************************************

PROCESS SP_inicial_luzes_nave ; indicacao que esta rotina e um processo + valor do SP



nave:
	MOV R3, N_PAINEIS			; numero de vers es diferentes do painel da nave

muda_painel:
	MOV R1, evento_int			; endereco da tabela das interrupcoes
	MOV R2, [R1+6]				; bloqueia neste LOCK, e espera que a interrupcao da
								; nave escreva algo (INT3)
	MOV R0, DURANTE_JOGO		; estado de jogo executavel
	MOV R1, [estado_jogo+2]		; estado de jogo atual (WORD)
	CMP R0, R1
	JNZ muda_painel				; se nao for o estado executavel, espera
	MOV R0, ECRA_NAVE_SONDA		; numero do ecra da nave e das sondas
	MOV [SELECIONA_ECRA_ESPECIFICO], R0; seleciona o ecra da nave e das sondas

	SUB R3, 1					; enquanto todos os paineis nao aparecem, o ciclo nao acaba

	CMP R3, 4					; e a versao 4 do painel?
	JZ	versao_4				; se sim, desenha o painel 4

	CMP R3, 3					; e a versao 3 do painel?
	JZ versao_3					; se sim, desenha o painel 3

	CMP R3, 2					; e a versao 2 do painel?
	JZ versao_2					; se sim, desenha o painel 2

	CMP R3, 1					; e a versao 1 do painel?
	JZ versao_1					; se sim, desenha o painel 1

	CMP R3, 0					; e a versao 0 do painel?
	JZ versao_0					; se sim, desenha o painel 0


versao_4:
	MOV R7, def_painel_cores4	; endereco do painel de cores 4
	CALL desenha_painel
	JMP muda_painel
versao_3:
	MOV R7, def_painel_cores3	; endereco do painel de cores 4
	CALL desenha_painel
	JMP muda_painel
versao_2:
	MOV R7, def_painel_cores2	; endereco do painel de cores 4
	CALL desenha_painel
	JMP muda_painel
versao_1:
	MOV R7, def_painel_cores1	; endereco do painel de cores 4
	CALL desenha_painel
	JMP muda_painel
versao_0:
	MOV R7, def_painel_cores0	; endereco do painel de cores 4
	CALL desenha_painel
	JMP nave



; **********************************************************************
; Rotina
;
; DESENHA_PAINEL - Desenha uma versao do painel da nave.
;
; Argumentos:		R7 - endereco do painel de cores
;
; **********************************************************************

desenha_painel:
	PUSH R1
	PUSH R2
	PUSH R4
	PUSH R5
	PUSH R6
	MOV R1, LINHA_PAINEL		; posicao da linha do painel
	MOV R2, COLUNA_PAINEL		; posicao da coluna do painel
	MOV R4, R7					; endereco da tabela
	ADD R4, 4					; endereco da primeira cor do painel
	MOV R5, [R7]				; numero de colunas do painel
	MOV R6, [R7+2]				; numero de linhas do painel
	CALL desenha_pixels
	POP R6
	POP R5
	POP R4
	POP R2
	POP R1
	RET

; **********************************************************************
; Processo
;
; ENERGIA - Faz o decremento periodico da energia da nave (-3 energia
;				a cada 3 segundos).
;
; **********************************************************************

PROCESS SP_inicial_energia		; indicacao de que a rotina que se segue e um processo,
								; com indicacao do valor para inicializar o SP

energia:
	MOV R1, [evento_int + 4]	; bloqueia ate ser escrito um valor no interruptor 2 (da energia)
	MOV R0, DURANTE_JOGO		; estado de jogo executavel
	MOV R1, [estado_jogo+2]		; estado de jogo atual (WORD)
	CMP R0, R1
	JNZ energia					; se nao for o estado executavel, espera
	MOV R0, PERDA_ENERGIA		; copia o valor da perda periodica de energia
	MOV R1, [contador_display]	; copia o valor da energia atual (hexadecimal)
	SUB R1, R0					; subtrai o valor da perda periodica a energia atual
	MOV [contador_display], R1	; copiar o valor novo da energia para o contador
	CMP R1, 0					; a energia ja chegou a 0?
	JLE ajusta_energia			; se a energia for menor ou igual a 0, salta
	CALL from_hex_to_dec		; transformar o valor hexadecimal em decimal
	MOV [DISPLAYS], R5			; apresentar o valor da energia (decimal)	
	JMP energia

ajusta_energia:
	CALL concluir_energia_z		; ajusta a energia caso seja inferior a 0
	MOV R0, ENERGIA_JOGO		; copia o estado de jogo em que perde-se por falta de energia
	MOV [estado_jogo], R0		; altera o estado de jogo, desbloquenado os processos bloqueados
	MOV [estado_jogo+2], R0		; altera a WORD do estado de jogo
	JMP energia






; **********************************************************************
; Processo
;
; SONDA - Lanca uma sonda na direcao selecionada pela tecla do teclado.
;
; **********************************************************************

PROCESS SP_inicial_sonda		; indicacao de que a rotina que se segue e um processo,
								; com indicacao do valor para inicializar o SP

sonda:
	MOV R1, TAMANHO_PILHA		; tamanho em palavras da pilha de cada processo
	MUL R1, R11					; TAMANHO_PILHA vezes o numero da instancia da "sonda"
	SUB SP, R1					; inicializa o SP desta instancia da "sonda"
	MOV R10, R11				; copia do n  de instancia da sonda
	SHL R10, 1					; multiplica por 2 porque as tabelas sao de WORDS


	; espera que uma sonda seja lancada
lanca_sonda:
	MOV R9, n_sondas			; endereco da tabela que espera que uma sonda seja lancada,
								; escrevendo no LOCK
	MOV R8, [R9+R10]			; espera ate que se escreva no LOCK que informa que uma sonda
								; e para ser lancada
	CALL energia_sonda			; atualiza o valor da energia
	MOV R0, [contador_display]	; valor da energia atual
	CMP R0, 0					; a energia ja chegou a 0 ou e negativa?
	JLE	ajusta_energia_sonda	; se sim, termina
	MOV R0, SOM_SONDA			; som de lancamento da sonda
	MOV [TOCA_SOM], R0			; toca o som da sonda
	MOV R8, R10					; copia o valor do numero da inst ncia da sonda
	SHL R10, 1					; obtem o endereco a somar para a posicao das sondas
	MOV R9, pos_sondas			; endereco da tabela das posicoes das sondas
	MOV R1, [R9+R10]			; linha da sonda desta instancia
	ADD R10, 2					; endereco da coluna das posicoes das sondas
	MOV R2, [R9+R10]			; coluna da sonda desta instancia
	SUB R10, 2					; repoe o valor de R10
	MOV R9, sentido_sondas		; endereco da tabela com os sentidos das sondas
	MOV R4, [R9+R8]				; sentido da sonda, em relacao as colunas
	MOV R5, R1					; copia a linha da sonda
	MOV R6, R2					; copia a coluna da sonda
	
ciclo_sonda:
	MOV R0, ECRA_NAVE_SONDA		; ecra para desenhar a sonda
	MOV R3, COR_PIXEL_S			; cor do pixel da sonda
	CALL escreve_pixel			; desenha a sonda correspondende
	CALL verifica_colisao_ast_sonda	; verifica se houve colisao entre os asteroides e a sonda
	CMP R0, 0					; houve colisao?
	JNZ destroi_asteroide		; se houver, destroi o asteroide

ciclo_sonda_bloqueante:
	MOV R9, evento_int
	MOV R7, [R9+2]				; le o LOCK desta interrupcao (bloqueia ate a rotina
								; de interrupcao escrever)

	MOV R8, [estado_jogo+2]		; estado de jogo atual (WORD)						
	MOV R7, TERMINA_JOGO		; estado de jogo de terminar manualmente
	CMP R7, R8					; o estado atual e o de terminar?
	JZ reset_sonda				; se for o estado de terminar o jogo, reset da posicao das sondas

	MOV R7, EXPLODE_JOGO		; estado de jogo de colisao de asteroide com a nave
	CMP R7, R8					; o estado atual e o de explodir com a nave?
	JZ reset_sonda				; se for o estado de explodir com a nave, reset da posicao das sondas

	MOV R7, ENERGIA_JOGO		; estado de jogo de ficar sem energia na nave
	CMP R7, R8					; o estado atual e o de ficar sem energia?
	JZ reset_sonda				; se for este o estado, reset da posicao das sondas

	MOV R7, DURANTE_JOGO		; estado de jogo execut vel
	CMP R7, R8					; o estado de jogo e o execut vel?
	JNZ ciclo_sonda_bloqueante	; se nao for o executavel, espera que seja

continua_ciclo_sonda:
	MOV R0, ECRA_NAVE_SONDA		; ecra para desenar a sonda							
	MOV R3, 0					; cor do pixel transparente
	CALL escreve_pixel			; apaga a sonda
	MOV R9, LIMITE_SONDA
	CMP R1, R9					; a sonda ja chegou ao limite?
	JZ alcance_sonda			; se ainda nao chegou, continua
	SUB R1, 1					; sobe a linha da sonda
	ADD R2, R4					; para desenhar a sonda na coluna seguinte,
	
	MOV R9, pos_sondas			; endereco da tabela com as posi  es das sondas
	MOV [R9+R10], R1			; atualiza a linha atual da sonda
	ADD R10, 2				
	MOV [R9+R10], R2			; atualiza a coluna atual da sonda
	SUB R10, 2
								; tendo em conta o sentido
	JMP ciclo_sonda

;a sonda ja ultrapassou o limite maximo de alcance
alcance_sonda:
	MOV R9, pos_sondas			; endereco da tabela das posicoes das sondas
	MOV [R9+R10], R5			; colocaco valor da linha inicial da sonda
	ADD R10, 2
	MOV [R9+R10], R6			; coloca o valor da coluna inicial da sonda
	SUB R10, 2		
	SHR R10, 1					; numero da instancia em WORDs (0, 2 ou 4)
	JMP lanca_sonda 


ajusta_energia_sonda:
	CALL concluir_energia_z		; ajusta a energia caso seja inferior a 0
	MOV R0, ENERGIA_JOGO		; copia o estado de jogo em que perde-se por falta de energia
	MOV [estado_jogo], R0		; altera o estado de jogo, desbloquenado os processos bloqueados
	MOV [estado_jogo+2], R0		; altera a WORD do estado de jogo
	JMP lanca_sonda

;da reset a posicao da sonda
reset_sonda:
	CALL reset_pos_sonda 
	SHR R10, 1					; numero da instancia em WORDs (0, 2 ou 4)
	JMP lanca_sonda
	

destroi_asteroide:
	CALL reset_pos_ast

	; apaga a sonda da posicao atual
	MOV R9, pos_sondas			; endereco da tabela com a posicao das sondas
	MOV R1, [R9+R10]			; linha da sonda
	ADD R10, 2
	MOV R2, [R9+R10]			; coluna da sonda
	MOV R3, 0					; cor do pixel transparente
	MOV R0, ECRA_NAVE_SONDA
	CALL escreve_pixel
	SUB R10, 2
	JMP reset_sonda





; **********************************************************************
; RESET_POS_AST - Destroi um asteroide por ter sido destruido por uma
;					sonda, verificando se era mineravel ou nao.
;
; Argumentos:	R11 - numero da instancia do asteroide
;
; **********************************************************************	

reset_pos_ast:
	PUSH R1
	PUSH R2
	PUSH R9
	PUSH R10
	PUSH R11
	MOV R9, colisao_asteroides		; endereco da tabela que indica se houve colisao de um asteroide com uma sonda
	MOV R1, COLISAO_AST				; valor que indica que houve colisao entre asteroide e sonda
	SHL R11, 1						; valor da instancia em WORD
	MOV [R9+R11], R1				; indica que ocorreu colisao nesta instancia
	SHR R11, 1						; repoe o valor de R11 entre 0 e 3
	MOV R10, R11					; copia o numero da instancia do asteroide
	MOV R9, inf_asteroides			; endereco da tabela com informacao dos asteroides
	SHL R11, 3
	MOV R1, [R9+R11]				; tipo de asteroide (mineravel: 0)

	CMP R1, 0						; asteroide era mineravel?
	JZ incrementa_display			; se sim, aumenta o display em 25 de energia


	JMP sai_reset_pos_ast

incrementa_display:
	CALL ast_min_display

sai_reset_pos_ast:
	CALL remove_aviso_trajetoria
	POP R11
	POP R10
	POP R9
	POP R2
	POP R1
	RET

; **********************************************************************
; AST_MIN_DISPLAY - Aumenta o display em 25 de energia por ter sido
;						destruido um asteroide mineravel
;
; **********************************************************************	

ast_min_display:
	PUSH R0
	PUSH R1
	MOV R0, ENERGIA_AM			; valor do ganho de energia de um ast miner vel
	MOV R1, [contador_display]	; valor da energia atual (hexadecimal)
	ADD R1, R0					; subtrair o gasto de lancar uma sonda
	MOV [contador_display], R1	; atualizar o valor do contador
	CALL from_hex_to_dec		; passar para decimal
	MOV [DISPLAYS], R5			; atualizar o display com o valor em decimal
	POP R1
	POP R0
	RET






; **********************************************************************
; Rotina
;
; ENERGIA_SONDA - Depois de lancar a sonda, retirar 5 de energia a energia
;					atual da nave e atualizar o display.
;
; **********************************************************************

energia_sonda:
	PUSH R0
	PUSH R1
	MOV R0, ENERGIA_SONDA		; valor do gasto de energia numa sonda
	MOV R1, [contador_display]	; valor da energia atual (hexadecimal)
	SUB R1, R0					; subtrair o gasto de lancar uma sonda
	MOV [contador_display], R1	; atualizar o valor do contador
	CALL from_hex_to_dec		; passar para decimal
	MOV [DISPLAYS], R5			; atualizar o display com o valor em decimal
	POP R1
	POP R0
	RET


; **********************************************************************
; Rotina
;
; RESET_POS_SONDA - Da reset a posicao das sonda.
;
; Argumentos:		R10 - numero da instancia da sonda * 4
;
; **********************************************************************

reset_pos_sonda:
	PUSH R0
	PUSH R1
	PUSH R10
	SHR R10, 2				; numero da instancia da sonda entre 0 e 2
	MOV R9, pos_sondas		; endere o da tabela com a posicao atual das sondas
	CMP R10, 0				; instancia 0 das sondas
	JZ reset_esq			; da reset a sonda da esquerda
	CMP R10, 1				; instancia 1 das sondas
	JZ reset_cent			; da reset a sonda do centro
	
	MOV R0, LINHA_S_DD		; linha da sonda direita
	MOV R1, COLUNA_S_DD		; coluna da sonda direita

	JMP sai_reset_pos_sonda


reset_esq:
	MOV R0, LINHA_S_DE		; linha da sonda esquerda
	MOV R1, COLUNA_S_DE		; coluna da sonda esquerda

	JMP sai_reset_pos_sonda

reset_cent:
	MOV R0, LINHA_S_C		; linha da sonda central
	MOV R1, COLUNA_S_C		; coluna da sonda central

sai_reset_pos_sonda:
	SHL R10, 2				; instancia em WORDs para a tabela das posicoes
	MOV [R9+R10], R0		; reset da linha
	ADD R10, 2
	MOV [R9+R10], R1		; reset da coluna
	POP R10
	POP R1
	POP R0
	RET



; **********************************************************************
; Rotina
;
;  VERIFICA_COLISAO_AST_SONDA - Verifica se houve colisao entre a sonda
;								e os asteroides.
;
; Argumentos:		R10 - numero da inst ncia da sonda * 4
;				
; Return:			R0 - Indica se houve colisao ou nao (0 se ainda n o, 
;							1 se ja)
;					R11 - numero da inst ncia do asteroide
;
; **********************************************************************

verifica_colisao_ast_sonda:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R9
	PUSH R10
	SHR R10, 2					; numero da instancia entre 0 e 2
	MOV R11, R10				; copia do numero da instancia da sonda
	MOV R9, inf_asteroides		; endereco da tabela com a informacao sobre os asteroides

	MOV R10, 0					; numero da instancia inicial do asteroide
	MOV R5, N_ASTEROIDES		; numero de asteroides a verificar

ciclo_verifica_colisao_ast_sonda:
	CALL obtem_limites_asteroide			; return: R1 - Limite inferior (linha)
											;		  R2 - Limite lateral esquerdo (coluna)
											;         R3 - Limite lateral direito (coluna)
											
	CALL colisao_ast_sonda					; return: R0 - 0 se nao houver colisao, 1 se houver
	CMP R0, 0
	JNZ houve_colisao_ast
	ADD R10, 1					; nova instancia
	SUB R5, 1					; menos um asteroide para tratar
	CMP R5, 0					; todos os asteroides ja foram tratados?
	JNZ ciclo_verifica_colisao_ast_sonda

	JMP sai_verifica_colisao_ast_sonda

houve_colisao_ast:
	MOV R11, R10				; se houver colisao, copia o numero  da instancia do asteroide
	MOV R0, 1					; houve colisao

sai_verifica_colisao_ast_sonda:
	POP R10
	POP R9
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET






; **********************************************************************
; Rotina
;
; COLISAO_AST_SONDA - Verifica se houve colisao entre a sonda
;						e um dos asteroides.
;
; Argumentos:		R1 - Limite inferior asteroide (linha)
;					R2 - Limite lateral esquerdo asteroide (coluna)
;					R3 - Limite lateral direito asteroide (coluna)		
;					R11 - numero da instancia da sonda
;
; Return: 			R0 - Indica se houve colisao ou nao (0 se ainda nao, 
;							1 se ja)
;
; **********************************************************************

colisao_ast_sonda:
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R9
	PUSH R11
	SHL R11, 2
	MOV R4, LARGURA_ASTEROIDE	; largura do asteroide
	MOV R6, R1					; copia o valor do limite inferior
	SUB R6, R4					; LIMITE SUPERIOR ASTEROIDE (linha)
	MOV R9, pos_sondas			; endereco da tabela com as posicoes das sondas
	MOV R4, [R9+R11]			; linha da sonda atual
	ADD R11, 2
	MOV R5, [R9+R11]			; coluna da sonda atual

	CMP R4, R1
	JLT limite_superior_ast 	; se a linha da sonda for menor do que o limite
								; inferior do asteroide, salta

	MOV R0, 0					; se a linha da sonda for superior, nao ha colisao
	JMP sai_colisao_ast_sonda

limite_superior_ast:
	CMP R4, R6
	JGT limites_lateral_ESQUERDO_ast; se a linha da sonda for maior do que o limite
									; superior do asteroide, salta
	MOV R0, 0
	JMP sai_colisao_ast_sonda		; se a linha da sonda for inferior, nao ha colisao


limites_lateral_ESQUERDO_ast:
	CMP R5, R2
	JGT	limite_lateral_DIREITO_ast 				; se a coluna da sonda for maior do que o limite lateral
												; esquerdo do asteroide, salta
	MOV R0, 0
	JMP sai_colisao_ast_sonda	; se a coluna for inferior, nao ha colisao		

limite_lateral_DIREITO_ast:
	CMP R5, R3						
	JLT colisao_ast					; se a coluna da sonda for menor do que o limite lateral
									; direito do asteroide, hovue colisao
	MOV R0, 0
	JMP sai_colisao_ast_sonda

colisao_ast:
	MOV R0, 1						; houve colisao	

sai_colisao_ast_sonda:
	POP R11
	POP R9
	POP R6
	POP R5
	POP R4
	RET








; **********************************************************************
; Processo
;
; ASTEROIDE - Desenha os asteroides aleatoriamente, do topo do ecra;
;				caso um saia do ecra, aperece outro (max. : 4 asteroides
;				no ecra).
;
; **********************************************************************

PROCESS SP_inicial_asteroide	; indicacao de que a rotina que se segue e um processo,
								; com indicacao do valor para inicializar o SP

asteroide:
	MOV R1, TAMANHO_PILHA		; tamanho em palavras da pilha de cada processo
	MUL R1, R11					; TAMANHO_PILHA vezes o numero da instancia do "asteroide"
	SUB SP, R1					; inicializa o SP desta inst ncia da "asteroide"
	MOV R10, R11				; copia do numero de instancia do asteroide

gera_asteroide:
	CALL gera_posicao_tipo				; gera o tipo de asteroide e trajetoria para cada instancia

estado_jogavel_asteroide:
	YIELD
	MOV R0, DURANTE_JOGO				; estado de jogo executavel
	MOV R1, [estado_jogo+2]				; estado de jogo atual (WORD)
	CMP R0, R1
	JNZ estado_jogavel_asteroide		; se nao for o estado executavel, espera

ciclo_asteroide:
	MOV R9, colisao_asteroides			; endereco da tabela que indica se ocorreu colisao ou nao
	SHL R10, 1
	MOV R0, [R9+R10]					; 0 se nao ocorreu colisao, 1 se ocorreu
	SHR R10, 1
	CMP R0, 0							; houve colisao com uma sonda?
	JNZ	animacao_destruir				; se ocorreu colisao, fazer animacao de destruir
	MOV R9, inf_asteroides				; endere o da tabela com a informacao dos asteroides
	SHL R10, 3							; multiplica o numero da instancia por 8 para ter o endereco certo
	MOV R0, [R9+R10]					; copia o valor do tipo de asteroide			

	CMP R0, TIPO_MINERAVEL				; o asteroide e mineravel?
	JZ desenha_mineravel				; se sim, desenha um asteroide mineravel

	; se n o for, desenha um nao mineravel
	JMP desenha_nao_mineravel

desenha_mineravel:
	MOV R4, def_asteroide_m				; endereco da tabela que define um asteroide mineravel
	ADD R10, 2
	MOV R1, [R9+R10]					; copia a linha atual do asteroide
	ADD R10, 2							
	MOV R2, [R9+R10]					; copia a coluna atual do asteroide
	SUB R10, 4
	SHR R10, 3							; numero da instancia do asteroide
	CALL desenha_ast					; desenha o asteroide mineravel

	JMP limite_inferior_ecra_ast				

desenha_nao_mineravel:
	MOV R4, def_asteroide_nm			; endereco da tabela que define um asteroide nao mineravel
	ADD R10, 2
	MOV R1, [R9+R10]					; copia a linha atual do asteroide
	ADD R10, 2
	MOV R2, [R9+R10]					; copia a coluna atual do asteroide
	SUB R10, 4
	SHR R10, 3							; numero da instancia do asteroide
	CALL desenha_ast					; desenha o asteroide nao mineravel


; verifica se os asteroides ultrapassaram o limite inferior do ecr 	
limite_inferior_ecra_ast:
	CALL verifica_limite_ecra
	CMP R0, 0							; ultrapassou? (se R0 for 0, o asteroide ainda nao ultrapassou)
	JNZ gera_asteroide					; se ultrapassou, cria um novo asteroide, aleatoriamente

	CALL verifica_colisao_nave			; verifica se um asteroide colidiu com a nave
	CMP R0, 0							; colidiu? (se R0 for 0, o asteroide ainda nao colidiu com a nave)
	JNZ explode_nave					; termina o jogo porque houve colisao entre um asteroide e a nave


atualiza_pos_ast:
	MOV R9, evento_int					; endereco da tabela dos interruptores
	MOV R0, [R9]						; espera que a interrupcao escreva no LOCK para desenhar o asteroide
	MOV R0, DURANTE_JOGO				; estado de jogo executavel
	MOV R1, [estado_jogo+2]				; estado de jogo atual (WORD)
	CMP R0, R1
	JNZ atualiza_pos_ast				; se n o for o estado executavel, espera



; apaga o asteroide da posicao atual
apaga_asteroide:
	CALL apaga_asteroide_desenho
	CALL muda_pos_ast	
	JMP ciclo_asteroide				


explode_nave:
	MOV R0, EXPLODE_JOGO				; estado de jogo de colisao entre um asteroide e a nave
	MOV R9, estado_jogo					; tabela que contem o estado de jogo atual
	MOV [R9], R0						; altera o estado de jogo para EXPLODE_JOGO, desbloqueando os processos
										; que se encontravam bloqueados
	MOV [R9+2], R0						; altera o estado de jogo da WORD para EXPLODE_JOGO

	CALL limpa_pos_asteroides			; coloca os asteroides numa posicao fora da tela e limpa
										; as trajetorias ocupadas

	JMP gera_asteroide					; cria a nova posicao do asteroide para ser
										; usada no reinicio de jogo


animacao_destruir:
	CALL animacao_ast_explosao
	JMP limite_inferior_ecra_ast	


; **********************************************************************
; DESENHA_AST - Desenha um asteroide na linha e coluna
;			indicadas com a forma e cor definidas na tabela 
;			indicada.
;
; Argumentos:	R1 - linha
;				R2 - coluna
;				R4 - tabela que define o asteroide
;				R10 - n  da inst ncia do asteroide
;
; **********************************************************************

desenha_ast:
	PUSH R0
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	MOV R0, R10						; copia o n da instancia, para ser usada para selecionar o ecra
	MOV R7, R4						; copia o endere o da tabela
	MOV R5, [R4]					; obtem o n de colunas do asteroide
	MOV R6, [R4]					; obtem o n de linhas do asteroide
	ADD R4, 2
	CALL desenha_pixels
	POP R7
	POP R6
	POP R5
	POP R4
	POP R0
	RET

; **********************************************************************
; MUDA_POS_AST - Atualiza a posicao do asteroide para ser desenhado na 
;					proxima posicao
;
; Argumentos:	R10 - numero da instancia do asteroide
;
;
; **********************************************************************
	
muda_pos_ast:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R9
	PUSH R10
	PUSH R11
	SHL R10, 3							; para usar na tabela das informacoes dos asteroides
	MOV R11, R10						; copia o numero da instancia * 8
	MOV R9, inf_asteroides				; tabela da informacao dos asteroides
	ADD R10, 2							
	MOV R1, [R9+R10]					; copia a linha atual do asteroide
	ADD R10, 2	
	MOV R2, [R9+R10]					; copia a coluna atual doo asteroide
	ADD R10, 2
	MOV R3, [R9+R10]					; copia sentido do movimento das colunas
	ADD R1, 1							; atualiza o valor da linha
	ADD R2, R3							; atualiza o valor da coluna
	ADD R11, 2
	MOV [R9+R11], R1					; guarda o novo valor da linha
	ADD R11, 2							
	MOV [R9+R11], R2					; guarda o novo valor da coluna
	POP R11
	POP R10
	POP R9
	POP R3
	POP R2
	POP R1
	RET


; **********************************************************************
; Rotina
;
; VERIFICA_COLISAO_NAVE - Verifica se houve colisao entre o asteroide
;							e a nave.
;
; Argumentos:			R10 - Numero da instancia do asteroide.
;
; Return:				R0 - Indica se houve colisao ou nao (0 se ainda nao, 
;								1 se ja)
;
; **********************************************************************

verifica_colisao_nave:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R9
	CALL obtem_limites_asteroide			; return: R1 - Limite inferior (linha)
											;		  R2 - Limite lateral esquerdo (coluna)
											;         R3 - Limite lateral direito (coluna)

	MOV R4, LINHA_NAVE						; LIMITE SUPERIOR NAVE
	MOV R5, COLUNA_NAVE						; LIMITE LATERAL ESQUERDO NAVE
	MOV R6, LARGURA_NAVE					; largura da nave
	ADD R6, R5								; LIMITE LATERAL DIREITO NAVE

	CMP R1, R4
	JGT limite_lateral_DIREITO_nave_esquerda; se o limite inferior do asteroide for superior ao da nave, salta

	MOV R0, 0								; nao houve colisao
	JMP sai_verifica_colisao_nave

;VERIFICA LIMITE LATERAL DIREITO DO ASTEROIDE

limite_lateral_DIREITO_nave_esquerda:
	CMP R3, R5
	JGT	limite_lateral_DIREITO_nave_direita	; se o limite lateral direito do asteroide for superior ao
												; limite lateral esquerdo da nave, salta
	JMP limite_lateral_ESQUERDO_nave_esquerda	; se for inferior, testar outro lado do asteroide

limite_lateral_DIREITO_nave_direita:
	CMP R3, R6
	JLT colisao_nave						; se o limite lateral direito do asteroide for inferior ao
											; limite lateral direito da nave, houve colisao
	JMP limite_lateral_ESQUERDO_nave_esquerda


;VERIFICA LIMITE LATERAL ESQUERDO DO ASTEROIDE

limite_lateral_ESQUERDO_nave_esquerda:
	CMP R2, R5
	JGT limite_lateral_ESQUERDO_nave_direita	; se o limite lateral esquerdo do asteroide for superior ao
												; limite lateral esquerdo da nave, salta
	MOV R0, 0
	JMP sai_verifica_colisao_nave				; se for inferior, nao ha colisao

limite_lateral_ESQUERDO_nave_direita:
	CMP R2, R6
	JLT colisao_nave							; se o limite lateral esquerdo do asteroide for inferior ao
												; limite lateral direito da nave, houve colisao
	MOV R0, 0
	JMP sai_verifica_colisao_nave				; se for superior, nao ha colisao


colisao_nave:
	MOV R0, 1								; houve colisao


sai_verifica_colisao_nave:
	POP R9
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET


	





; **********************************************************************
; Rotina
;
; OBTEM_LIMITES_ASTEROIDE - Obtem o limite inferior, esquerdo e direito
;							do asteroide.
;
; Argumentos:			R10 - N da instancia do asteroide.
;
; Return:				R1 - Limite inferior (linha)
;						R2 - Limite lateral esquerdo (coluna)
;						R3 - Limite lateral direito (coluna)
;
; **********************************************************************

obtem_limites_asteroide:
	PUSH R4
	PUSH R9
	PUSH R10
	MOV R9, inf_asteroides			; endereco da tabela com a informacao sobre os asteroides
	SHL R10, 3						; para obter um valor valido para saber a informacao dos asteroides

	MOV R4, LARGURA_ASTEROIDE		; valor da largura do asteroide
	ADD R10, 2						
	MOV R1, [R9+R10]				; valor da linha do asteroide
	ADD R1, R4						; LIMITE INFERIOR
	ADD R10, 2
	MOV R2, [R9+R10]				; LIMITE LATERAL ESQUERDO
	MOV R3, R2						; copia o valor da coluna
	ADD R3, R4						; LIMITE LATERAL DIREITO
	POP R10
	POP R9
	POP R4
	RET
	





; **********************************************************************
; Rotina
;
; VERIFICA_LIMITE_ECRA - Verifica se o asteroide ja ultrapassou o
;							o limite inferior do ecra.
;
; Argumentos:			R10 - Numero da instancia do asteroide
;
; Return:				R0 - Indica se ultrapassou ou nao (0 se ainda nao, 
;								1 se ja)
;
; **********************************************************************


;verifica se um asteroide ja pode ser gerado na mesma trajetoria que outro (a partir da linha 24)
verifica_limite_ecra:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R9
	PUSH R10
	SHL R10, 3							; para usar no endereco da tabela da informacao dos asteroides
	MOV R9, inf_asteroides				; tabela da informacao sobre os asteroides
	ADD R10, 2
	MOV R1, [R9+R10]					; linha atual do asteroide
	SUB R10, 2
	SHR R10, 3							; numero da instancia do asteroide
	MOV R2, LINHA_TRAJETORIA_LIMITE		; linha limite para o qual um asteroide pode usar a mesma trajetoria que outro
	CMP R1, R2							; ja chegou a linha 24?
	JZ limpa_trajetoria					; se sim, remove o aviso que a trajetoria nao pode ser usada

	JMP verifica_limite_inferior_ecra


limpa_trajetoria:
	CALL remove_aviso_trajetoria


;verifica se um asteroide ja ultrapassou o final da linha
verifica_limite_inferior_ecra:
	MOV R2, LIMITE_ECR 
	CMP R1, R2							; o asteroide ja chegou ao final do ecra?
	JGE reset_asteroide					; vai apagar o asteroide e avisar que outro pode ser criado
	MOV R0, 0							; o asteroide ainda nao ultrapassou o limite
	JMP sai_verifica_limite_ecra

reset_asteroide:
	MOV R9, inf_asteroides				; endereco da tabela da informacao sobre os asteroides
	MOV R4, def_asteroide_apagar		; endereco da tabela do asteroide transparente
	SHL R10, 3
	ADD R10, 4							
	MOV R2, [R9+R10]					; copia a coluna atual do asteroide
	SUB R10, 4
	SHR R10, 3							; numero da instancia do asteroide
	CALL desenha_ast					; apaga o asteroide
	MOV R0, 1							; o asteroide ultrapassou o limite
	JMP sai_verifica_limite_ecra


sai_verifica_limite_ecra:
	POP R10
	POP R9
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET

; **********************************************************************
; Rotina
;
; REMOVE_AVISO_TRAJETORIA - Remove o aviso da tabela trajetoria_disponiveis
;							de que uma trajetoria estava ocupada por um
;							asteroide, podendo ser ocupada por outro.
;
; Argumentos:			R10 - Numero da instancia do asteroide
;
; **********************************************************************

remove_aviso_trajetoria:
	PUSH R0
	PUSH R1
	PUSH R10
	ADD R10, 1							; as instancias usadas na tabela estao entre 1 e 4
	MOV R0, trajetoria_disponiveis		; copia o endereco das trajetorias disponiveis

ciclo_remove_aviso_trajetoria:
	MOV R1, [R0]
	CMP R10, R1							; na tabela, a ordem das trajetorias esta indicada
	JZ sai_remove_aviso_trajetoria
	ADD R0, 2							; proxima trajetoria
	JMP ciclo_remove_aviso_trajetoria


sai_remove_aviso_trajetoria:
	MOV R1, 0
	MOV [R0], R1							; coloca o valor da trajetoria a 0, indicando que pode ser usada
	POP R10
	POP R1
	POP R0
	RET

; **********************************************************************
; Rotina
;
; ANIMACAO_AST_EXPLOSAO - Faz a animacao de propagagao da explosao de
;							um asteroide quando ha colisao com uma sonda.
;
; Argumentos:			R10 - Numero da instancia do asteroide
;
; **********************************************************************

animacao_ast_explosao:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R7
	PUSH R8
	PUSH R9
	PUSH R10
	MOV R9, colisao_asteroides		; endereco da tabela das colisoes com asteroides
	MOV R0, 0						; indicacao que a coliao ja foi tratada, dando reset ao valor
	SHL R10, 1
	MOV [R9+R10], R0				; coloca o valor da colisao a 0
	MOV R9, inf_asteroides			; endereco da tabela com a informacao sobre os asteroides
	SHL R10, 2
	MOV R3, [R9+R10]				; TIPO de asteroide						
	ADD R10, 2
	MOV R1, [R9+R10]				; LINHA do asteroide
	ADD R10, 2
	MOV R2, [R9+R10]				; COLUNA do asteroide
	SUB R10, 4
	SHR R10, 3						; numero da instancia do asteroide

	MOV R9, evento_int				; endereco da tabela dos LOCKs das interrupcoes
	CMP R3, TIPO_MINERAVEL			; o asteroide e mineravel?
	JZ anima_mineravel				; se sim, faz a explosao do mineravel
	JMP anima_n_mineravel			; se nao, faz a explosao do nao mineravel

anima_mineravel:
	MOV R0, SOM_ASTEROIDE			; som de explosao do asteroide mineravel
	MOV [TOCA_SOM], R0				; toca o som de explosao do asteroide
	MOV R4, def_asteroide_m_a1		; primeira fase de um asteroide mineravel atingido
	CALL desenha_ast

anima_mineravel_a2:
	MOV R0, [R9]				; bloqueia ate ser escrito um valor no LOCK do interruptor dos asteroides
	MOV R8, [estado_jogo+2]		; estado de jogo atual (WORD)						
	MOV R7, DURANTE_JOGO		; estado de jogo executavel
	CMP R7, R8					; o estado de jogo e o executavel?
	JNZ anima_mineravel_a2		; se nao for o executavel, espera que seja

	MOV R4, def_asteroide_m_a2	; segunda fase de um asteroide mineravel atingido
	CALL desenha_ast
anima_mineravel_a3:
	MOV R0, [R9]				; bloqueia ate ser escrito um valor no LOCK do interruptor dos asteroides
	MOV R8, [estado_jogo+2]		; estado de jogo atual (WORD)						
	MOV R7, DURANTE_JOGO		; estado de jogo executavel
	CMP R7, R8					; o estado de jogo e o executavel?
	JNZ anima_mineravel_a3		; se nao for o executavel, espera que seja

	MOV R4, def_asteroide_m_a3	; terceira fase de um asteroide mineravel atingido
	CALL desenha_ast

sai_anima_mineravel:
	MOV R0, [R9]				; bloqueia ate ser escrito um valor no LOCK do interruptor dos asteroides
	MOV R8, [estado_jogo+2]		; estado de jogo atual (WORD)						
	MOV R7, DURANTE_JOGO		; estado de jogo executavel
	CMP R7, R8					; o estado de jogo e o executavel?
	JNZ sai_anima_mineravel		; se nao for o executavel, espera que seja
	CALL apaga_asteroide_desenho
	
	JMP reset_pos_asteroides	





anima_n_mineravel:
	MOV R0, SOM_ASTEROIDE_NM			; som de explosao do asteroide nao mineravel
	MOV [TOCA_SOM], R0					; toca o som de explosao do asteroide
	MOV R4, def_asteroide_nm_atingido	; unica fase de explosao de um asteroide nao mineravel
	CALL desenha_ast

sai_anima_n_mineravel:
	MOV R0, [R9]				; bloqueia ate ser escrito um valor no LOCK do interruptor dos asteroides
	MOV R8, [estado_jogo+2]		; estado de jogo atual (WORD)						
	MOV R7, DURANTE_JOGO		; estado de jogo execut vel
	CMP R7, R8					; o estado de jogo e o executavel?
	JNZ sai_anima_n_mineravel	; se n o for o executavel, espera que seja

	CALL apaga_asteroide_desenho



reset_pos_asteroides:
	MOV R9, inf_asteroides			; endereco da tabela com informacao dos asteroides
	SHL R10, 3
	MOV R1, POS_FORA_ECRA			; linha e coluna fora do ecra
	ADD R10, 2
	MOV [R9+R10], R1 				; colocar a linha fora do ecra
	ADD R10, 2
	MOV [R9+R10], R1				; coloca a coluna fora do ecra
	SUB R10, 4
	MOV R1, [R9+R10]				; tipo de asteroide (mineravel: 0)
	
	POP R10
	POP R9
	POP R8
	POP R7
	POP R4
	POP R3
	POP R2
	POP R1
	POP R0
	RET
			







; **********************************************************************
; Rotina
;
; GERA_POSICAO_TIPO - Gera pseudo-aleatoriamente (usando so bits 4 a 7
;						dos PINS de sa da do teclado) o tipo de asteroide
;						(0: mineravel; 1,2,3: nao mineravel) e a trajetoria
;						e posicao inicial do mesmo.
;
; Argumentos:			R10 - Numero da instancia do asteroide
;
; **********************************************************************

gera_posicao_tipo:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R9
	PUSH R10
	MOV R0, TEC_LIN				; endereco do periferico das linhas
	MOV R2, TEC_COL				; endereco do periferico das colunas

;OBTEM TIPO ASTEROIDE
obtem_tipo:
	MOVB [R0], R5				; escrever no periferico de saida (linhas)
	MOVB R1, [R2]				; ler do periferico das colunas
	MOV R4, 4					; modulo a usar
	SHR R1, 5					; coloca os bits 7 a 5 (aleatorios) nos bits 2 a 0
	MOD R1, R4					; obtemos um valor entre 0 e 3 (hexadecimal)
	MOV R9, inf_asteroides		; endereco das tabelas com informacao sobre os asteroides
	SHL R10, 3					; atualiza o numero da instancia para o respetivo endereco das informacoes
	MOV [R9+R10], R1			; coloca o tipo de asteroide (mineravel se for 0, nao mineravel
								; para qualquer outro numero)
	 

;OBTEM POSICAO E TRAJETORIA DO ASTEROIDE
obtem_posicao:
	YIELD
	MOV R0, TEC_LIN				; endereco do periferico das linhas
	MOVB [R0], R5				; escrever no periferico de saida (linhas)
	MOVB R1, [R2]				; ler do periferico das colunas
	MOV R4, 5					; modulo a usar
	SHR R1, 5					; coloca os bits 7 a 5 (aleatorios) nos bits 2 a 0
	MOD R1, R4					; obtemos um valor entre 0 e 4 (hexadecimal)
	SHL R1, 1					; atualiza o valor porque as tabelas sao de WORDs
	MOV R9, trajetoria_disponiveis; endereco da tabela das trajetorias possiveis
	MOV R0, [R9+R1]				; valor da trajetoria (0 se nao estiver ocupada)
	CMP R0, 0					; a trajetoria esta disponivel?
	JNZ obtem_posicao			; se estiver ocupada, pede outro valor aleatorio

	;a trajetoria esta disponivel
	SHR R10, 3					; numero da instancia do asteroide
	ADD R10, 1					; para o numero de instancia ser entre 1 e 4
	MOV [R9+R1], R10			; avisa que a trajetoria esta ocupada
	SUB R10, 1					; volta a colocar o numero da instancia entre 0 e 3
	SHL R10, 3					; para ser usado no endereco da tabela (WORDs)
	SHR R1, 1					; divide o valor por dois, para o ter entre 0 e 4

	CMP R1, 0					; asteroide movimenta-se do canto superior esquerdo 
								; para o canto inferior direito?
	JZ cse_nave					; se sim, salta
	
	CMP R1, 1					; asteroide movimenta-se do centro superior para 
								; o canto inferior esquerdo?
	JZ cent_cie					; se sim, salta

	CMP R1, 2					; asteroide movimenta-se do centro superior paro 
								; o centro inferior?
	JZ cent_nave				; se sim, salta

	CMP R1, 3					; asteroide movimenta-se do centro superior para 
								; o canto inferior direito?
	JZ cent_cid					; se sim, salta
	
	CMP R1, 4					; asteroide movimenta-se do canto superior direito 
								; para o canto inferior esquerdo?
	JZ csd_nave					; se sim, salta



;canto superior esquerdo -> nave
cse_nave:
	MOV R1, LINHA_AST_CSE		; linha asteroide canto superior esquerdo
	MOV R2, COLUNA_AST_CSE		; coluna asteroide canto superior esquerdo
	MOV R3, DIRECAO_SDD			; sentido do asteroide em relacao as colunas
	MOV R4, 0					; numero trajetoria
	CALL guarda_inf
	JMP sai_gera_pos_tipo

;centro superior -> canto inferior esquerdo
cent_cie:
	MOV R1, LINHA_AST_CENT		; linha asteroide centro
	MOV R2, COLUNA_AST_CENT		; coluna asteroide centro
	MOV R3, DIRECAO_SDE			; sentido do asteroide em relacao as colunas
	MOV R4, 1					; numero trajetoria
	CALL guarda_inf
	JMP sai_gera_pos_tipo

;centro superior -> nave
cent_nave:
	MOV R1, LINHA_AST_CENT		; linha asteroide centro
	MOV R2, COLUNA_AST_CENT		; coluna asteroide centro
	MOV R3, DIRECAO_SC			; sentido do asteroide em relacao as colunas
	MOV R4, 2					; numero trajetoria
	CALL guarda_inf
	JMP sai_gera_pos_tipo

;centro superior -> canto inferior direito
cent_cid:
	MOV R1, LINHA_AST_CENT		; linha asteroide centro
	MOV R2, COLUNA_AST_CENT		; coluna asteroide centro
	MOV R3, DIRECAO_SDD			; sentido do asteroide em relacao as colunas
	MOV R4, 3					; numero trajetoria
	CALL guarda_inf
	JMP sai_gera_pos_tipo

;canto superior direito -> nave
csd_nave:
	MOV R1, LINHA_AST_CSD			; linha asteroide canto superior direito
	MOV R2, COLUNA_AST_CSD			; coluna asteroide canto superior direito
	MOV R3, DIRECAO_SDE			; sentido do asteroide em relacao  as colunas
	MOV R4, 4					; numero trajetoria
	CALL guarda_inf

sai_gera_pos_tipo:
	POP R10
	POP R9
	POP R4
	POP R3
	POP R2
	POP R1
	POP R0
	RET



; **********************************************************************
; Rotina
;
; GUARDA_INF - Guarda as informacoes sobre o asteroide.
;
; Argumentos:			R1 - linha inicial
;						R2 - coluna inicial
;						R3 - sentido do asteroide
;						R10 - numero da instancia * 8 (em WORDs e na respetiva 
;													informacao)
;
; **********************************************************************

guarda_inf:
	PUSH R9
	PUSH R10
	MOV R9, inf_asteroides		; endereco da tabela com as informacoes dos asteroides
	ADD R10, 2
	MOV [R9+R10], R1			; guarda a linha do asteroide da instancia
	ADD R10, 2
	MOV [R9+R10], R2			; guarda a coluna do asteroide da instancia
	ADD R10, 2
	MOV [R9+R10], R3			; guarda o sentido do movimento
	POP R10
	POP R9
	RET






; **********************************************************************
; Processo
;
; TECLADO - Verifica se uma tecla ainda esta a ser premida
;				desde a ultima operacao feita e qual e a proxima
;				tecla a ser premida para definir a proxima
;				operacao.
;
; **********************************************************************

PROCESS SP_inicial_teclado	; indicacao que esta rotina e um processo + valor do SP


teclado:
	MOV R0, [linha_teclado] ; linha a testar no teclado
ha_tecla:
	YIELD
	CALL retoma_tecla		; tirar o valor da coluna
	CMP R7, 0				; ha tecla premida durante a leitura da coluna?
	JNZ ha_tecla			; se ainda houver uma tecla premida, espera ate nao haver

tira_linha:
	WAIT 					; ciclo potencialmente bloqueante, logo este e o ponto de fuga para outro processo
	MOV R0, LINHA_TECLADO	; reinicia a linha a ser testada, caso nenhuma tecla tenha sido premida

espera_tecla:
	SHR R0, 1				; proxima linha a ser testada
	JZ tira_linha			; se a linha chegar a 0, recomecar o ciclo
	CALL retoma_tecla
	CMP R7, 0				; ha tecla premida durante a leitura da coluna?
	JZ  espera_tecla		; se nenhuma tecla premida durante a leitura, repete

	MOV [linha_teclado], R0	; guardar o valor da linha da tecla premida
	MOV R1, 0				; contador das linhas
	MOV R2, 0				; contador das colunas			
	
conta_linhas:
	ADD R1, 1				; incrementa o contador (linhas)
	SHR R0, 1				; executar ate a linha ser 0
	JNZ conta_linhas		; se a linha ainda nao for zero, repete
	SUB R1, 1				; como as linhas sao entre 0 e 3, diminui-se uma linha

conta_colunas:
	ADD R2, 1				; incrementa o contador (colunas)
	SHR R7, 1				; executar ate a coluna ser 0
	JNZ conta_colunas		; se a coluna ainda nao for zero, repete
	SUB R2, 1				; como as colunas sao entre 0 e 3, diminui-se uma coluna
	
transforma_em_hexadecimal:
	SHL R1, 2				; multiplica a linha por 4
	ADD R1, R2				; obtem-se o valor da tecla, em hexadecimal
	MOV [tecla_detetada], R1; informa quem estiver bloqueado neste LOCK que uma tecla foi carregada
							; (o valor da tecla e 4 * linha + coluna)
	JMP teclado
	
 
	 

; **********************************************************************
; Rotina 
;
; RETOMA_TECLA - Faz uma leitura as teclas de uma linha do teclado e retorna
;		o valor lido
;
; Argumentos: R0 - linha a testar (em formato 1, 2, 4 ou 8)
;
; Retorna:    R7 - valor lido das colunas do teclado (0, 1, 2, 4, ou 8)
;
; **********************************************************************

retoma_tecla:
	PUSH R1
	PUSH R2 
	PUSH R3
	MOV R1, TEC_LIN	; endereco do periferico das linhas
	MOV R2, TEC_COL	; endereco do periferico das colunas
	MOV R3, MASCARA	; para isolar os 4 bits de menor peso, ao ler as colunas do teclado
	MOVB [R1], R0	; escrever no periferico de saida (linhas)
	MOVB R7, [R2]	; ler do periferico de saida (colunas)
	AND R7, R3		; elimina bits para al m dos bits 0-3 (colunas)
	POP R3
	POP R2
	POP R1
	RET



; **********************************************************************
; DESENHA_NAVE - Desenha uma nave na linha e coluna indicadas com a
;			forma e cor definidas na tabela indicada.
;
; **********************************************************************
desenha_nave:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	MOV R4, def_nave	; copia o endereco da tabela que define a nave
	MOV R7, R4			; copia o endereco
	MOV R1, LINHA_NAVE	; posicao da linha da nave
	MOV R2, COLUNA_NAVE	; posicao da coluna da nave
	MOV R5, [R7]		; numero de colunas
	MOV R6, [R7+2]		; numero de linhas
	ADD R4, 4			; passa para o endereco da cor do primeiro pixel
	MOV R0, ECRA_NAVE_SONDA; ecra para desenhar a nave e a sonda
	CALL desenha_pixels	; desenha os pixels da nave
	POP  R7
	POP  R6
	POP  R5
	POP  R4
	POP  R2
	POP  R1
	POP R0
	RET 

; **********************************************************************
; APAGA_ASTEROIDE_DESENHO - Apaga o desenho de um asteroide de uma
;								determinada instancia.
;
; Argumentos:				R10 - numero da instancia do asteroide
;
; **********************************************************************
apaga_asteroide_desenho:
	PUSH R1
	PUSH R2
	PUSH R4
	PUSH R9
	PUSH R10

	MOV R9, inf_asteroides
	MOV R4, def_asteroide_apagar		; endereco da tabela do asteroide transparente
	SHL R10, 3							; para ter o endereco correto
	ADD R10, 2
	MOV R1, [R9+R10]					; copia a linha atual do asteroide
	ADD R10, 2							
	MOV R2, [R9+R10]					; copia a coluna atual do asteroide
	SUB R10, 4
	SHR R10, 3							; numero da instancia do asteroide

	CALL desenha_ast
	POP R10
	POP R9
	POP R4
	POP R2
	POP R1
	RET





; **********************************************************************
; DESENHA_PIXELS - Desenha os pixels de um objeto no ecra, na linha e
;			coluna indicadas, com a cor e forma indicadas.
;
; Argumentos:	R0 - ecra usado para desenhar
;				R1 - posicao da linha	
;				R2 - posicao da coluna	
;				R4 - endereco do pixel atual, da tabela indicada
;				R5 - numero de colunas
;				R6 - numero de linhas			 
;				R7 - endereco da tabela que define o objeto
;
; **********************************************************************

desenha_pixels:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R8
	MOV R8, R2			; copia a posicao da coluna para desenhar o objeto
desenha:
	MOV  R3, [R4]		; obtem a cor do proximo pixel do objeto
	CALL escreve_pixel	; escreve cada pixel do objeto
	ADD  R4, 2			; endereco da cor do proximo pixel
	ADD  R2, 1			; proxima coluna
	SUB  R5, 1			; menos uma coluna para tratar
	JNZ  desenha		; continua ate percorrer toda a largura do objeto
	MOV  R5, [R7]		; reinicia a contagem das colunas para desenhar o objeto
	MOV  R2, R8			; reinicia a posicao da coluna para desenhar o objeto
	ADD  R1, 1			; proxima linha
	SUB  R6, 1			; menos uma linha para tratar
	JNZ  desenha		; continua ate percorrer todas as linhas do objeto
	POP R8
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET	



; **********************************************************************
; ESCREVE_PIXEL - Escreve um pixel na linha e coluna indicadas.
;
; Argumentos:	R0 - ecra a usar
;				R1 - linha
;				R2 - coluna
;				R3 - cor do pixel (em formato ARGB de 16 bits)
;
; **********************************************************************

escreve_pixel:
	MOV [SELECIONA_ECRA_ESPECIFICO], R0; seleciona o ecra a usar
	MOV	[DEFINE_LINHA], R1	; seleciona a linha
	MOV	[DEFINE_COLUNA], R2	; seleciona a coluna
	MOV	[DEFINE_PIXEL], R3	; altera a cor do pixel na linha e coluna ja selecionadas
	RET


; **********************************************************************
; Rotina
;
; FROM_HEX_TO_DEC - Muda o valor do display de hexadecimal para "decimal"
;					(o valor visual e o decimal, mas o numero continua a ser
;					em hexadecimal).
;
; Argumentos:		R1 - Valor do display em hexadecimal
;
; Return:			R5 -  Valor do display em decimal
;
; **********************************************************************


from_hex_to_dec: 
	PUSH R0
	PUSH R2
	PUSH R3
	PUSH R4
	MOV R3, FATOR_ENERGIA
	MOV R2, DIV_ENERGIA
ciclo_hex_to_dec:
	MOD R1, R3					; numero = numero MOD fator (numero e o valor a converter)
	DIV R3, R2					; fator = fator DIV 10; fator de divisao (comecar em 1000 decimal)
	CMP R3, 0					; o fator e 0?
	JZ sai_from_hex_to_dec		; se for 0, sai
	MOV R4, R1 					; copia o valor do numero
	DIV R4, R3					; digito = numero DIV fator (o digito e usado no numero "decimal")
	SHL R5, 4					; resultado = resultado SHL 4 (feito para dar espaco ao novo digito)
	OR  R5, R4					; resultado = resultado OR digito (vai compondo o resultado)
	JMP ciclo_hex_to_dec 

sai_from_hex_to_dec:
	POP R4
	POP R3
	POP R2
	POP R0
	RET
	

; **********************************************************************
; Rotina
;
; CONCLUI_ENERGIA_Z - Caso a energia passe para um valor negativo, passar
;						o valor para 0 (ex. : passar 0FFDH para 0000H).
;
; **********************************************************************

concluir_energia_z:
	PUSH R0
	MOV R0, [contador_display]
ciclo_energia_z:
	CMP R0, 0				; o valor ja chegou a 0?
	JZ sai_ciclo_energia_z	; se ja chegou, sai
	ADD R0, 1				; sobe o valor do contador em uma unidade hexadecimal
	JMP ciclo_energia_z		; repete ate chegar a 0
sai_ciclo_energia_z:
	MOV [DISPLAYS], R0		; apresentar o valor correto
	MOV [contador_display], R0; copiar o valor correto para a variavel
	POP R0
	RET


; **********************************************************************
; Rotina
;
; LIMPA_POS_ASTEROIDES - Coloca os asteroides na linha e colunas 64, desta
;						forma, vao ser apagados e vao ser novamente criados,
;						numa posiCAo logicamente correta (tomando uma
;						trajetOria correta).
;
; **********************************************************************

limpa_pos_asteroides:
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R9
	PUSH R10
	MOV R9, inf_asteroides			; endere o da tabela com a informaCAo dos asteroides
	MOV R4, N_ASTEROIDES			; nUmero de asteroides ao mesmo tempo no ecra
	MOV R3, LIMITE_ECR 				; linha e coluna a usar
	MOV R5, POS_FORA_ECRA
ciclo_limpa_pos_asteroides:
	MOV R10, R4						; copia o numero de asteroides
	SHL R10, 3						; para que o endereco da tabela da instancia esteja correto
	SUB R10, 4
	MOV R1, [R9 + R10]				; coluna do asteroide desta instancia
	SUB R10, 2
	MOV R2, [R9 + R10]				; linha do asteroide desta instancia
	MOV R1, R3						; coloca a coluna no pixel 33
	MOV R2, R5						; coloca a linha no pixel 33
	MOV [R9+R10], R2				; copia o valor da linha para a memoria
	ADD R10, 2
	MOV [R9+R10], R1				; copia o valor da coluna para a memoria
	SUB R4, 1						; menos um asteroide a usar
	CMP R4, 0						; ja todos os asteroides foram atualizados?
	JNZ ciclo_limpa_pos_asteroides  ; se nao, repete


; remove a indicacao de que as trajetorias estao ocupadas
	MOV R1, 0
	MOV R4, trajetoria_disponiveis	; endereco da tabela das trajetorias disponiveis
	MOV R3, 5						; numero de trajetorias

reset_todas_trajetorias:
	MOV R0, [R4]					; copia o valor da trajetoria
	MOV R0, R1						; coloca o valor a 0
	MOV [R4], R0					; guarda o valor na memoria
	ADD R4, 2
	SUB R3, 1						; menos uma trajetoria para tratar
	CMP R3, 0						; ja foram tratadas todas as trajetorias?
	JZ sai_limpa_pos_asteroides		; se sim, acaba
	JMP reset_todas_trajetorias		; se nao, repete

sai_limpa_pos_asteroides:
	POP R10
	POP R9
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	RET



; **********************************************************************
; ROT_INT_0 - 	Rotina de atendimento da interrupcao 0
;				escreve no LOCK que o processo asteroide le.
;
; **********************************************************************

rot_int_0:
	PUSH R1
	MOV  R1, evento_int
	MOV	[R1], R0			; desbloqueia o processo do asteroide (nao interessa o valor do registo)
	POP	R1
	RFE



; **********************************************************************
; ROT_INT_1 - 	Rotina de atendimento da interrupcao 1
;				escreve no LOCK que o processo sonda le.
;
; **********************************************************************

rot_int_1:
	PUSH R1
	MOV  R1, evento_int
	MOV	[R1+2], R0			; desbloqueia o processo da sonda (nao interessa o valor do registo)
	POP	R1
	RFE



; **********************************************************************
; ROT_INT_2 - 	Rotina de atendimento da interrupcao 2
;				escreve no LOCK que o processo energia le.
;
; **********************************************************************

rot_int_2:
	PUSH R1
	MOV  R1, evento_int
	MOV	[R1+4], R0			; desbloqueia o processo da energia (nao interessa o valor do registo)
	POP	R1
	RFE



; **********************************************************************
; ROT_INT_3 - 	Rotina de atendimento da interrupcao 3
;				escreve no LOCK que o processo nave le.
;
; **********************************************************************

rot_int_3:
	PUSH R1
	MOV  R1, evento_int
	MOV	[R1+6], R0			; desbloqueia o painel da nave (nao interessa o valor do registo)
	POP	R1
	RFE
	
	
			
	

 				







