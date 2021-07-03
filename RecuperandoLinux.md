# Recuperando um linux do windows

Ontem desinstalei algum programas do meu Linux Mint 20.1 com cinnamon através do menu. Botão direito sobre o programa - Desinstalar. Desinstalei vários que não estava precisando para aliviar o HD.

Lembro que um deles pediu confirmação para remover um pacote com cinnamon. Confirmei sem prestar muita atenção.

Achei estranho o fato de após desinstalar dezenas de programas o espaço livre em disco não alterar.

O problema foi quando reiniciei o computador. Ele me avisa que não encontrou o cinnamon e numa mensagenzinha como aqueles window manager bem antigos e sem qualquer menu. Apenas com OK e Cancel. Desliguei e fui dormir, já me preparando para reinstalar tudo. Sei que não existe sistema perfeito mas me parece que o Mint não deveria ter permitido que o seu ambiente gráfico fosse removido. Embora saiba que eu assinei em baixo mas tudo bem. Talvez qualquer outra distro tenha o mesmo comportamento. Estes acontecimentos me fazem refletir e repensar algumas coisas, como a seguir.

Então me veio a mente um comentário de um colega sobre a estabilidade do Debian. Será que é hora de sacrificar todo o conforto do Mint pela estabilidade e segurança do Debian? Passei algum tempo refletindo sobre isso. Pela manhã, ao acordar, ainda na cama, pensei isso "cada distro tem seus recursos, características e um perfil de usuário que a usa". O Mint é bem adequado para usuários iniciantes no Linux, pois é bem amigável e com muitos recursos no modo gráfico. Ideal para usuários que vem do Windows mas não somente. Já o Debian requer um pouco mais de conhecimento e de preferência um usuário com boa experiência com linux e o terminal. Talvez para ter maior estabilidade e segurança precise abdicar de alguns recursos de que gosto, ou melhor, consegui-los de outra forma não tão confortável. Talvez. O Mint vai continuar no meu coração mas talvez seja o momento de dar uma chance ao Debian, que há muito tem minha admiração e respeito.

Podemos perceber pelo instalador. O do Debian pede a senha do root além da do user comum. A do Mint/Ubuntu somente do user comum. Sempre que uso Ubuntu eu atribui senha para o root pis já tive problema por não ter esta senha. Numa recuperação do sistema somente com senha de root.

Levantei e fui para o computador dos filhos, que tem o Windows. Nem lembrei que ele também tem o Mint em dual boot. Antes disso liguei o meu notebook e deixei ele chegar até aquela pequena mensagem. No computador  dos filhos fui acessar o Facebook, mas não lembrei a senha, que está salva em meu nootbook e que também tenho em um arquivo texto nele. E agora? Acessei o git que havia instalado e executei

ssh ribafs@192.168.0.xx

Uma maravilha. Lá estava eu, no meu notebook. O sistema estava inteiro, ou melhor, faltando apenas o ambiente gráfico, mas todo o restante funcionando. Então verifiquei no arquivo das senhas, mesmo sem abrir:

cat /backup/Senhas.txt | grep face

Ele me mostrou e eu acessei o Facebook.

Resolvi restaurar o grub do notebook via ssh. Restaurei e reiniciei mas não era o grub. A mensagem que eu recebia já havia passado pelo grub.

Foi quando lembrei do cinnamon, então, via ssh, executei no notebook:

sudo apt update

sudo apt install cinnamon

Bem, estou agora digitando este texto em meu notebook e no Linux Mint 20.1 com cinnamon e tudo. Legal, não?

Claro que tudo isso poderia ser feito de qualquer outro sistema operacional, inclusive de um celular com um aplicativo com SSH. Acabo de instalar um aqui num celular com Android para testar e é uma beleza. Vale muito a pena ter o SSH, este canivete suiço, instalado em seu celular. Sugestão "Mobile SSH". É pequeno, simples, configurável e resolve.

Mas o LMDE 4 está sendo baixado no computador dos filhos. Vou usar o rufus para instalar num pendrive e dar um crédito ao Debian e ainda vou usar algo do Mint e com cinnamon, usando o LMDE. Afinal gostaria de ficar com o melhor dos dois mundos e vou tentar. Bola pra frente.

Como a versão atual está bem mais lenta que antes, isso me faz lembrar que o Debian é bem mais leve que os Ubuntus.

Escrevi este artigo usando o Linux Mint 20.1 com cinnamon, mas esta linha já estou encrevendo com o Xed no LMDE 4. Muita coisa fica realmente mais ágil, com melhor desempenho que no Mint, principalmente se for o 20.1 com cinnamon. Uma beleza, ganha-se estabilidade e desempenho, sem perder o Cinnamon e parte do Mint. O melhor dos 3 mundos. :) Tem mais, a esposa nem vai perceber que mudei de sistema, alias, é muito difícil, mesmo para quem entende, perceber diferenças.

Muita coisa do que eu tinha no Mint 20.1 continua disponível no LMDE 4, com pouca diferença: o Mint traz o driver da minha impressora (Canon G3110), o LMDE não traz mas uma rápida busca e ok. O Mint 20.1 traz o PHP 7.4 (trabalho com PHP) e o LMDE 4, que usa Debian 10, traz o 7.3. Eu rpeferia o 7.4, mas o 7.3 vai me atender. E mais algumas poucas diferenças, mas agora estou melhor. Pelo menos mudei e estou com algo novo (igual criança por novidade).

Ainda bem que demorei alguns dias para publicar este relato, pois agora me apareceu um problema muito grande: o som não está prestando. Baixei o Debian e estou criando uma VM para testar. Instalei com Gnome e Cinnamon. Embora pretenda usar o Cinnamon, ele usa algo do Gnome. Se o som ficar legal irei instalar o Debian puro. Imagino que o desempenho será ainda melhor. Não terei um look bonitão, mas tá bom.

Ufa, anets mesmo de testar o Debian na VM percebi que o problema no som era apenas no fone de ouvido. Beleza. Mas mesmo assim vou fazer uns t estes com o Debian.

O desempenho não dá para ser percebido numa VM, a não ser que concedamos bons recursos para ela. Ideal é criar uma partição para ele para boot. Mas não preciso fazer isso, pois já fiz isso algumas vezes e sei que a performance do Debian é superior a do Ubuntu e Mint.

Fatalidade
Algo me empurrou para o Debian puro. Eu removi meu HD com o Mint e coloquei outro que estava planejando comprar. Como não deu certo coloquei o meu de volta. Então veio o empurrão, que até agora não entendi. Sem eu mexer em nada no HD ele perdeu o grub. Como o outro não foi imadiatamente detectado pela BIOS, ela ficou fazendo uns testes. Talvez tenha acontecido alguma alteração na BIOS que não enxergou o Grub. REsumindo: agora já estou terminando este artigo usando o Gedit no Debian. Preferia estar usando o Xed do Mint, mas ele já estava ficando bem pesadinho. Então é melhor me acostumar e ficar por aqui, pois também não quero ficar usando muito do meu tempo apenas trocando de distro.

Porque Ubuntu ganha terreno

Durante a instalação do Debian, na fase da criação das partições, que sempre escolho manual para criar:

- UEFI - 1GB
- swap - 4GB
- / - uns 60GB
- /backup - restante

Estou com um HD bem pequeno, apenas 120GB. Apenas porque é SSH. De vez em quando tenho que estar apagando coisas e até formatando e instalando tudo novamente, para aliviar. Hoje estarei indo comprar um maior para acabar com isso. Agora, após instalar o Debian, instalar o AMP, alguns softwares e configurar como geralmente faço, estou com 45GB livres dos 60. Não lembro quanto restava livre no Mint após instalar, mas logo eu estava com 20 e até 6GB livres e isso me incomoda não ter espaço para mexer. A questão aqui é ser SSD, pois tenho um de 320, mas SATA e não aguento, depois de provar o SSD. O original SATA de 1TB queimou. Sem pró. Até mais tarde.

Apesar de já ter feito isso, instalar Debian, algumas vezes, quase desisti da instalação, pois não estava lembrando como proceder. Nem lembrava mais que durante esta fase ele usava o Gparted. Já estava ficando viciado com a facilidade do instalador do Ubuntu e o do Mint é ainda melhor. Isso justifica que a cada dia o Ubuntu e derivadas ganha ainda mais vantagem em relação ao Debian e a outras. Sabe o que é sintomático e ainda mais grave? É que em minha última pesquisa sobre distros voltadas para servidor, vi que o Ubuntnu é o mais popular e disparado em relação ao segundo. Para servidor ao meu ver não deveria, mas mostra que praticidade, facilidade conquista.

Realmente o Gedit abre bem mais rápido no Debian que o Xed no Mint. Que fiqiue registrado, pois tomara que alguém do Mint escute e mude isso.

Caramba, se eu lembrasse que a diferença de desempenho era tanta e em praticamente tudo (até agora exceto com libreoffice, que continua pesado. Paciẽncia) eu já teria mudado há muito. Existem pequenas diferenças que estou contornando, depois passarei detalhes. Espero me segurar, pois detendo ficar esperando pelo computador. Até o boot é sensivelmente mais rápido. Agora, olhei agora para a barra de tarefas abaixo e neste aspecto, look e na usabilidade o Mint ganha disparado. Aquela história, precisamos ter consciẽncia sobre o que é mais importante para nós.

Esperarei alguns dias, até que tenha instalado e testado tudo que uso para somente então publicar este artigo, com a apreciação final.

Como todas as mensagens são moderadas no grupo Mint Brasil não acredito que este artigo seja liberado. Pelo menos integralmente, não. Então cortarei e publicarei somente até a parte do LMDE.

Que reviravolta. Comecei este artigo no Linuc Mint, mudei para o LMDE, dpois para o Debian e agora estou no Ubuntu 20.10. Pequeno esclarecimento, pois pretendo continuar usando o Ubuntu. De fato, o Mint com Cinnamon foi a distribuição mais completa e confortável que já usei. Mas aconteceu um problema, além dela estar muito pesasa e isso me fez refletir. Refletindo fui parar no LMDE, que é ainda um Mint com Cinnamon, com todos os seus ótimos recursos e look mas não usando o Ubuntu e sim o Debian. Mas algo me levou a ir em frente e fui para o a Debian puro, na versão 10. Tive que reinstalar e me deu bastante trabalho. Enquanto isso, fiz algumas pesquisas, assisti um vídeo do Diolinux sobre algumas distros e isso me levou a usar o Ubuntu. Ele não tem o desempenho do Debian mas é bem superior ao do Mint. Veja o que me levou a usar o Ubuntu. Fiquei pensando, se não existisse o Mint nem o Ubuntu e todos tivessem que usar o Debian. Ao meu ver bem poucas pessoas usariam Linux, pois o Debian exige um perfil de usuário mais experiente. Isso mostra realmente que o Ubuntu entrega um ótimo sistema e é democrático, pois é muito amigável. Olha o que me veio a mente agora, enquanto escreveia isso: o Mint é ainda mais amigável que o Ubuntu, inclusive estou usando pequena parte dele, que é o Cinnamon, mas ele também está deixando de ser democrático e exige um computador mais potente que o Ubuntu. Independente disso, o Ubuntu foi quem desencadeou tudo isso. Se não fosse ele, atualmente estariamos usando o Debian ou um dos descendentes do RedHat. Praticamente temos duas grandes raizes: Debian e RedHat.

O interessante é que este raciocínio me mostrou que nem sempre o melhor é entregado por uma organização sem fins lucrativas mas pode sim ser entregue por uma empresa, como é o caso da Canonical. Lembrando, se a empresa realmente for idônea ela tem mais recursos financeiros para bancar as ações que uma organização. Termino citando a Wikipédia, outra grande democrata:

"A proposta do Ubuntu é oferecer um sistema que qualquer pessoa possa utilizar sem dificuldades, independentemente de nacionalidade, nível de conhecimento ou limitações físicas. O sistema deve ser constituído principalmente por software livre e deve também ser isento de qualquer taxa. 
O nome "Ubuntu" IPA: [u'buntu] deriva do conceito sul africano de mesmo nome, diretamente traduzido como "humanidade com os outros" ou "sou o que sou pelo que nós somos todos".
"Uma pessoa com Ubuntu está aberta e disponível para outros, apoia os outros, não se sente ameaçada quando outros são capazes e bons, baseada em uma autoconfiança que vem do conhecimento que ele ou ela pertence a algo maior e é diminuída quando os outros são humilhados ou diminuídos, quando os outros são torturados ou oprimidos."

Esse nome busca passar a ideologia do projeto, baseada nas liberdades do software livre e no trabalho comunitário de desenvolvimento. O sistema é muito comumente chamado "Ubuntu Linux", porém, oficialmente a Canonical, desenvolvedora do sistema, usa apenas o nome "Ubuntu", uma vez que o sistema ao ser portado para outros núcleos livres para além do Linux recebe outros nomes (por exemplo, o Ubuntu implementado sobre o OpenSolaris recebe o nome de "Nexenta") - ao contrário do Debian, por exemplo, que recebe este nome independentemente do núcleo usado."

Isso fechou. Essa filosofia, esta generosidade me conquistou. É esta distro que eu quero usar e devo apoiar.

O default do Ubuntu é bem bonito, bem mais que o Cinnamon nele, mas o Cinnamon é mais prático. Não preciso saber de cor o nome dos programas instalados. Apenas clico no menu e digito o nome do programa ou parte e ele já aparece. Além de alguns recursos que ele traz.


