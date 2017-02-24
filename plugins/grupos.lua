local config = require 'config'
local u = require 'utilities'
local api = require 'methods'

local plugin = {}
function plugin.onTextMessage(msg, blocks)
    if blocks[1] == 'lista' then
         local message = [[
*MENU DE GRUPOS E CANAIS*

/menudegrupos
``` lista com opções de grupos ```
/menudecanais
``` Lista de menu de canais ```
]]
    if msg.from.username ~= nil then
      referencia = msg.from.username
    else
      referencia = msg.from.id
    end

    referencia = string.gsub(referencia, '_', '')
    referencia = string.gsub(referencia, '*', '')

    if msg.chat.type == 'private' then
      api.sendMessage(msg.from.id, message, true)
    elseif not(msg.chat.type == 'private') then
      local res = api.sendMessage(msg.from.id, message, true)

      if res then
        api.sendMessage(msg.chat.id, 'Confira a lista no seu privado!', true)
      else
        api.sendMessage(msg.chat.id, '*' .. msg.from.first_name ..'*'.. ' (@' .. referencia ..') ' .. '[clique aqui](http://telegram.me/' .. bot.username .. '?start=start)' ..  ' para enviar uma mensagem no meu privado e tente clicar em /lista novamente.', true)
      end
    end
end

--##################################### MENU DE GRUPOS ###################################################
if blocks[1] == 'menudegrupos' then
     if not(msg.chat.type == 'private') then return end
    local message = [[
*Menu de Grupos*
/lisamista
``` lista de grupos mistos ```
/grupos
``` lista de grupos ativos ```
/amizades
``` Grupos de Amizades```
/mistos
``` Grupos de vários gêneros```
/gruposmusicais
``` Grupos só de musicas ```
]]
    api.sendMessage(msg.chat.id, message, true)

end

--##################################### MENU DE CANAIS ###################################################
if blocks[1] == 'menudecanais' then
     if not(msg.chat.type == 'private') then return end
    local message = [[
*Menu de Canais*
/canaisdemusicas
``` Canais de Musicas ```
/canaispessoais
``` Canais Pessoais ```
/canaiseducativos
``` Canais Educativos ```
/canaisdelivros
``` Canais de Livros ```
/canaisdegibshqsmangas
``` Canais de Gibs/Hqs/Mangás ```
/canaisdefilmeseseries
``` Canais de Filmes e Series ```
/canaisdenoticias
``` Canais de Notícias ```
/canaisdeesportes
``` Canais de Esportes ```
/canaisdestickers
``` Canais de Stickers ```
/canaisdegifs
``` Canais de Gifs ```
/canaisdiversos
``` Canais Diversos ```
/canaisdetecnologia
``` Canais de Tecnologia ```
/canaisdeimagens
``` Canais de Imagens ```
/canaisdedivulgacoes
``` Canais de Divulgações ```
]]
    api.sendMessage(msg.chat.id, message, true)

end
--##################################### LISTAGEM DE GRUPOS ###################################################
if blocks[1] == 'grupos' then
     if not(msg.chat.type == 'private') then return end
    local message = [[
*Grupos de animes*

[👥-GRUPO OTAKU-👥](https://telegram.me/grupo_otaku) - O melhor grupo de Animes

[🐉 Grupo Digimon Brasil 🇧🇷](https://telegram.me/DigimonBrasil) - Digimon

[🇯🇵 Anime Land Brasil 🇧🇷](https://telegram.me/grupoanimebrasil) - Anime 

[🗡 Naruto/Boruto 🇧🇷](https://telegram.me/gruponarutobrasil) - Naruto Brasil

[🐣 Pokémon Brasil 🇧🇷](https://telegram.me/BRPokemon) - Pokemon Br

*Grupos de Nerds*

[🌏 Mundo dos Debates 🤓](https://t.me/joinchat/AAAAAD0O7mBEB1sETypJfA) - Tema Livre

[👊🏻 Invasão Nerd 👊🏻](https://telegram.me/InvasaoNerd) - Cultura pop/nerd

*Grupos de Iniciantes*

[📝 Dicas Chat 💬](https://telegram.me/DicasChat) - Para recém chegados no app

[👥 Grupo Telegram BR 🇧🇷](https://telegram.me/GrupoTelegramBR) - Telegram em Foco

*Grupos de Músicas*

[🎧 Mundo da Música🎶](https://telegram.me/GrupoMundoDaMusica) - 90 k de Músicas

[👥 Music's Group 🎶](https://telegram.me/joinchat/DINjaD4xhOdNtOpcZWg2pA) 

*Grupos de Divulgação*

[📢 Rede Telezap 🚀](https://telegram.me/RedeTelezap) - Divulgação Limpa

[👤 Canais e Grupos 🇧🇷](https://telegram.me/grupocanaisegrupos) - Divulgação Limpa

*Grupos de Livros*

[📚 Livros Digitais I 💻](http://telegram.me/joinchat/BG5DYD36sJmTpW44rVYmqQ) - Livros Digitais

[📚 Livros Digitais II 💻](https://telegram.me/livrospdf2) - Livros Digitais

[📕 Livros Aqui ⬇️](https://telegram.me/joinchat/A-TeLT0O7mCOM6qJErICVQ) - Grupo do canal Livros em Pdf

[📌Clube do livro 📚](telegram.me/clubedolivro) - Clube do Livro

[📚〰✿т̲̅є̲̅я̲̅т̲̅ú̲̅l̲̅i̲̅α̲̅ ̲̅C̲̅l̲̅υ̲̅b̲̅є̲̅ ̲̅d̲̅σ̲̅ ̲̅L̲̅i̲̅v̲̅я̲̅σ̲̅〰✿📚](https://telegram.me/tertuliaclubedolivro) - Tertúlialia

]]
    api.sendMessage(msg.chat.id, message, true)

end

--################################# GRUPOS MISTOS #######################################################
    if blocks[1] == 'mistos' then
     if not(msg.chat.type == 'private') then return end
    local message = [[
*lol Listão do Red lol*
[😍❤️ ƤΔŘ Ƥ€Ř₣€ƗŦØ ❤️😍](http://telegram.me/parperfeito13) - Quem sabe vc não encontra o seu par perfeito por aqui 😏
              
[👥 Fã Clube do Red 🤖](https://telegram.me/gruporedlol) - Tema livre 
               
[🎶 Mundo da Música 🎶](https://telegram.me/GrupoMundoDaMusica) - Mais de 50 Mil Músicas 
               
[📢 Rede Telezap 🚀](https://telegram.me/redetelezap) - Divulgações 
               
[👥 Dicas Chat 💬](https://telegram.me/DicasChat) - Para Iniciantes
               
[👥 Grupo Telegram BR 🇧🇷](https://telegram.me/GrupoTelegramBR)  - Para Iniciantes
               
[👥 Livros em PDF Oficial II 📚](https://telegram.me/livrospdf2) - Livros Digitais
               
[🏇 Os Nordestinos 🌵](https://telegram.me/joinchat/BGSHAT5oHYKeCIZy0XZGjg) - Amizades Regionais
               
[📢 Canais e grupos 🇧🇷](https://telegram.me/grupocanaisegrupos) - Divulgação
              
[🛠 Dicas sobre Apis de Bots 🤖](https://telegram.me/DesenvolvimentoDeRobos) - Lego Bots 
 
[🛠 Desenvolvimento de bots 🤖](https://telegram.me/DesenvolvimentoDeRobos) - Oficina dos bots 
               
[🔴Nação Rubro Negra🔴](https://telegram.me/FlamengoNacao) - Flamengo
]]

    api.sendMessage(msg.chat.id, message, true)

end
--################################# GRUPOS MUSICAIS #######################################################
    if blocks[1] == 'gruposmusicais' then
     if not(msg.chat.type == 'private') then return end
    local message = [[
*Grupo de Musicas:*

#GruposMusicais

[🌎 Բãʂ ɗѳ ʀѳɔҡ 🌎](https://telegram.me/TheRockers) - Para amantes de Rock 🤘🏼

[🌍 Mundo Da Musica 🎵](https://telegram.me/GrupoMundoDaMusica) - 90 Mil Musicas nas mídias compartilhadas. 💁🏻

[👥 Grupo do canal Up 🎶](https://telegram.me/joinchat/CciBLkCVmLRA_3sWPUXoog) - Grupo Oficial do Canal do Up 🔝

[🤘🏼EDMusic Chat 🎵](telegram.me/edmusicchat) - EDMusic Chat (🇺🇸ENG) 🎶

[🎺 Tutti all'Opera! 🎷](https://telegram.me/opera_lovers) - Musicas Classicas 🎻

[👥 @eletronica 🎶](telegram.me/eletronica) - Para quem ama musicas Eletrônicas 🎵

[👥 @nosamamosraulseixas 🎶 ](telegram.me/nosamamosraulseixas) - Super Grupo Para Fãs Do Mestre Do Rock Nacional Raul Seixas 🎶 

[👥 @raulseixasomito 🎶](telegram.me/raulseixasomito) - Super Grupo Para Fãs Do Mestre Do Rock Nacional Raul Seixas 🎶

[👥 @Worldkpoppers 🎶](telegram.me/Worldkpoppers) - Grupo de Kpoppers! Vc que ama K-pop venha para o nosso grupo! 🎶

[👥 @musicsgroup 🎶 ](telegram.me/musicsgroup) - Tendo como idiomas padrões EN/PT-BR

[🎵 Brega 🎵](telegram.me/brega) - Musicas Paraense 🎵

🌐 *Para mais dicas*  📢 @telezap  🚀

]]

    api.sendMessage(msg.chat.id, message, true)

end

--#################################

--################################# GRUPOS DE AMIZADES #######################################################
    if blocks[1] == 'amizades' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
[😍❤️ ƤΔŘ Ƥ€Ř₣€ƗŦØ ❤️😍](http://telegram.me/parperfeito13) - Quem sabe vc não encontra o seu par perfeito por aqui 😏

[☢ Dangerous Element ☣](https://telegram.me/joinchat/B9Bazz92MPp61COjnU8lsg) - Amizades

[💢 Fã Clube do Red 🤖 ](https://telegram.me/GrupoRedLol) - Zueira com o Red

[👫 Amizades lindas e verdadeiras 💕](https://telegram.me/amizasdelindaseverdadeiras) - Amizades lindas e verdadeiras

[👸🏼 SUAVE 💭](http://telegram.me/joinchat/Cz5zpj9COOxifsCjizy2dQ) - Amizades, msg etc

[👫 Amigos a parte 😊](https://telegram.me/amoresimo) - Amizades
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################# #######################################################

--####################################### Lista nova
if blocks[1] == 'lisamista' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
[💏 Alagoas Encontro E Namoro 😏](http://telegram.me/joinchat/DbxHsgcSH0Y4aABGPW2uUQ) - Grupo Regional

[👊🏼 Liga da Justiça 👨🏾](http://telegram.me/joinchat/C73vyD8tlT_x6TGpuwqL0g) - Amizades entre amigos do Brasil e no mundo 

[ 💏NAMORO OU  LIBERDADE 🏂😜](http://telegram.me/joinchat/BW97LTwBt3hTdgAQOXFe_w) - Namoro e liberdade

[😉👐Minha Bahia o Melhor Lugar do Mundo😋👌](http://telegram.me/joinchat/Ayxa2j6J72sDt0eNdMYUBA) - Grupo Regional

[✅ Aʑαrαçãσ🎃τσταℓ](http://telegram.me/joinchat/CndscD517e4nRncseNzXXA) - Azaração
]]
api.sendMessage(msg.chat.id, message, true)

end
--######################################
--####################################### AQUI COMEÇA OS MENUS DE CANAIS #################################################

--####################################### CANAIS DE MUSICAS #################################################
if blocks[1] == 'canaisdemusicas' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Musicas*

[🎶 Musicas Tops 📌](https://telegram.me/musicastops) - Discografias organizadas por tags

[🎶Music's Library 🎶](https://telegram.me/musicslibrary) - Rock & EDM feat. MPB

[UP™](https://telegram.me/CanalUPoficial) - 🇧🇷 Canal de entretenimento mais eclético do Telegram!

[Long Live Rock 'n' Roll](https://telegram.me/longliverock) -  posts de discos, clipes e news sobre Rock!! 

[🎶 Mundo da Musica 🎶](https://telegram.me/MUNDODAMUSICA) - Músicas de todos os gêneros

[Anos 80 90](https://telegram.me/Recordar) - Quem ama recorda

]]
api.sendMessage(msg.chat.id, message, true)

end

--################################ CANAIS PESSOAIS ########################################################
if blocks[1] == 'canaispessoais' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais Pessoais*

[📃 God's Eyes 📃](https://telegram.me/Godseyes)  - Canal Pessoal do @OlhodeDeus

[Durov's Channel](https://telegram.me/durov) - Canal de Pavel Durov sobre suas viagens e experiências

[🇧🇷 MK Channel 🇧🇷](https://telegram.me/Murkiriel) - Tudo sobre os bots do @mkriel
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS EDUCATIVOS ########################################################
if blocks[1] == 'canaiseducativos' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais Educativos* 

[☕️ Café com Letras ☕️](https://telegram.me/cafecomletras) - Canal de Língua Portuguesa

[📝 Língua Portuguesa 🇧🇷](https://telegram.me/Antiburrice) - (🇧🇷 Melhor canal de gramática e ortografia do Telegram. 🇧🇷

[✏️ Só Português 🇧🇷](https://telegram.me/soportugues) - Definitivamente, este é o canal que fala a sua  língua!

[🇧🇷 Aprendendo Inglês 🇬🇧](https://telegram.me/APRENDENDOINGLES) - Dicas de Inglês

[📊 Tudo com Excel 📊](https://telegram.me/tudocomexcel) - Aulas e dicas de Excel diariamente no seu celular! 

[🗿 Conhecimento Contemporâneo 🗿](https://telegram.me/conhecimento) - Você encontrará aqui uma dose diária de conhecimento em diversas áreas

[🔭 Cosmos 🔭](https://telegram.me/cosmosastronomia) - Notícias, curiosidades, planetas, universo e muito mais

[Canal do Designer](https://telegram.me/CanalDoDesigner) - Para todos que gostam de design

[🐾 Arte passo a passo 🎨](https://telegram.me/passoapasso) - Dicas de Artesanato

[💪🏼 Saúde em Dia 💪🏼](https://telegram.me/SAUDEEMDIA) - Dicas de Saúde
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE LIVROS ########################################################
if blocks[1] == 'canaisdelivros' then
    if not(msg.chat.type == 'private') then return end
    local message = [[ [📚 Livros em PDF 📚](https://telegram.me/LivrosEmPdf) - Livros Digitais 

[📚 Concursos em PDF 📝](https://telegram.me/concursosempdf) - Dicas para concursos
          
[📚 Concursos no Brasil 🇧🇷](https://telegram.me/concursosnobrasil) - Dicas para concursos

[📓 QdC - Questões de concurso 📝](https://telegram.me/questoes_de_concurso) - Dicas para concursos
          
[📚 Livros & Canções 🎶](https://telegram.me/joinchat/Che7Oj5fZwJsyY-vrHYX6w) - Livros e canções
       
[👭 Divas do Homo 👬](telegram.me/divasdohomo) - Canal dedicado a livros de romance homo

[💋 Divas Dark 👠](telegram.me/divasdark) - Divas dos Livros

[📖 Leitora Livre 📖](telegram.me/leitoralivre) - Viver sem ler, seria como viver sem viver

[💝 Mente Literária📚](telegram.me/literaria) - Canal de literatura em geral

[📚 O Literário 📚](https://telegram.me/Oliterario) - Informações e curiosidades sobre o mundo da literatura

[😋 Papa Livros 📚](https://telegram.me/papalivros) - Canal de Livros Nacionais, Internacional, Imagens, Musica

[📚 Balaio Literário💃🏻](https://telegram.me/BalaioLiterario) - Postagens de trilogias literárias

[👥 Clube Do Livro 📚](http://telegram.me/canalclubedolivro) - Baixe seus livros favoritos aqui

[💅🏼 Diva Concurseira 📝](https://telegram.me/divaconcurseira) - Pdfs direcionados a concursos, ENEM e áreas técnicas e didáticas diversas

[📱 Reading Ebooks 💻](http://telegram.me/readingebook) - Arquivos em mobi, para aqueles que lêem no Kindle e querem a facilidade de encontrar tudo em só lugar

[📚 Romances e todo Amor 📚](telegram.me/livrosamados) - Leitura para todos os gostos e amores

[📚 Audio Livros 🔊](https://telegram.me/audiolivros) - Levar a cultura e a fantasia mesmo para aqueles que não podem ler, como deficientes visual, etc
]]
api.sendMessage(msg.chat.id, message, true)

end

--################################ CANAIS DE GIBS/HQS/MANGÁS ########################################################
if blocks[1] == 'canaisdegibshqsmangas' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Gibs/Hqs/Mangás*

[🗯 GibisHQs 🗯](https://telegram.me/gibishqs) - Scans de histórias em quadrinhos e incentivo à leitura

[HQs-Mangás-etc](https://telegram.me/hqsmangasetc) - Hqs, Mangás etc

[🈯️AnimsOtaku🈯️](https://telegram.me/animsotaku) - Mangás, animes, musicas, amv etc.

]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE FILMES E SERIES  ########################################################
if blocks[1] == 'canaisdefilmeseseries' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Filmes e Series* 

[🎞 TeleMovies 🎞](https://telegram.me/TeleMoviess) - Os melhores filmes

[🎥 Portal Filmes ™](https://telegram.me/PortalFilmes)- Seu canal de entrada para os melhores filmes

[📽 Vídeos Engraçados 📽](https://telegram.me/CanalDosVideos) - Vídeos engraçados para baixar, rir e enviar no Telegram

[🎞 Moviegram 📽](https://telegram.me/Moviegram) - Os melhores filmes, documentários, concertos, na melhor qualidade possível, só aqui o canal "Moviegram"!

[📢 Portal Séries™](https://telegram.me/PortalSeries) - Seu canal de entrada para as melhores séries.

[📽 TeleSeries HD 📽](https://telegram.me/TeleSeriesHD) - As melhores séries em HD você só encontra aqui!.

]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE NOTÍCIAS   ########################################################
if blocks[1] == 'canaisdenoticias' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Notícias*

[ℹ️ Info Line 🔁](telegram.me/infoline) - Noticias sobre o mundo da ciência, tecnologia e outros.

[📱Tec Noticias 📰](https://telegram.me/tecnoticias) - POSTAGENS AUTOMATIZADAS!

[🗞 Brasil 2⃣4⃣7⃣](https://telegram.me/brasil247) - Primeiro jornal de tablets, iPads e smartphones do Brasil, 24 horas por dia, 7 dias por semana, 100% digital, com participação ativa dos leitores.

[🗞 BBC Brasil 🇧🇷](https://telegram.me/bbcbrasil) - BBC Brasil

[📢 Portal do Holanda 📰](https://telegram.me/portaldoholanda) - Canal de notícias em tempo real do Portal do Holanda.

[📰 G1 - Portal de Notícias 📰](https://telegram.me/g1noticias) - eceba as notícias do Portal G1 em tempo real no seu Telegram! 

]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE ESPORTES    ########################################################
if blocks[1] == 'canaisdeesportes' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Esportes*

[📢 Esportes 🏆](https://telegram.me/Esportes) - Canal de esportes com notícias a todo momento!

[🔴 Flamengo 🔴](https://telegram.me/crflamengo) - Canal oficial

[🐷 Palmeiras News 💚](https://telegram.me/PalmeirasNews) - Canal dedicado à Sociedade Esportiva Palmeiras!

[😎Mitos do Cartola 🎩](https://telegram.me/cartolamitos) - Análises de jogos

[📰 News Brasileirão  ⚽️](https://telegram.me/newsbrasileirao) - Todas as noticias exclusivas do Futebol Brasileiro e do Mundo

[😏 Zoeira F.C. 😂](https://telegram.me/ZoeiraFC) - ''Lugar onde a zoeira faz que nem eu, só marca gol de placa!!''

[FUTGIF ⚽️📢](https://telegram.me/futgif) - Melhores gifs de futebol do telegram!!

[Kampa](https://telegram.me/BlogKampa) - Dicas de acampamentos, trilhas, montanhas e vida outdoor

[🚴🏼 Rodas da Paz 🕊](https://telegram.me/rodasdapaz) - A pauta da bicicleta em Brasília
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE STICKERS   ########################################################
if blocks[1] == 'canaisdestickers' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Stickers*

[📌 Stickers 📌](https://telegram.me/stickerstops) - Os melhores Stickers

[📌 Stickers Do Olho De Deus 📌](https://t.me/joinchat/AAAAAD-yczQnrlVM_CHCFA) - Stickers feito pelo @Olhodedeus

[🃏 Sticker's Brasil 🇧🇷](https://telegram.me/StickersBrasil) - Stickers Brasil

[Telegram Stickers HQ](https://telegram.me/StickersHQ) - Stickers

[📌 Telegram Stickers 😼](https://telegram.me/addstickers) - O canal oficial Stickergram.ru em Telegram

[📢 Stickers Channel 😎](https://telegram.me/StickersChannel) - Um dos maiores canais de Stickers do Telegram

[🚹 Stickers Collection 😌 ](https://telegram.me/stickers_collection) - Stickers de todos os gêneros

[🇪🇸 STICKERIA 👻 ](https://telegram.me/Stickeria) - Os melhores e mais divertidos Stickers para Telegram

[📢 Telegram Stickers Channel 📌](https://telegram.me/telestickers) - Este é o canal oficial da Telegram Stickers Library: telegramhub.net/stickers

[📌 Channel of broken Sticker links 📌](https://telegram.me/brokenstickers) - Stickers Diversos

[📝 Stickers ✂️](https://telegram.me/StickersMM) - Stickers autorais

[😎 Osmer Stickers Channel 😎](https://telegram.me/osmeromarhn) - Os melhores Stickers aqui

[💕 EmmaHaneys Stickers Collection 💕](https://telegram.me/emmastickers) - Stickers fofos

[🛐 Stickers City!🛐 ](https://telegram.me/stickerscity) - Stickers com linguagens Orientais
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE GIFS    ########################################################
if blocks[1] == 'canaisdegifs' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Gifs*

[🆒 Canal do Gif 🆒](https://telegram.me/canaldogif) - Os melhores gifs do Telegram

[Gif Collection](https://telegram.me/gifcollection) - Coleções de Gif

[FUTGIF ⚽️📢](https://telegram.me/futgif) - Melhores gifs de futebol do telegram!!
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DIVERSOS     ########################################################
if blocks[1] == 'canaisdiversos' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais Diversos*

[👶🏼 Canal Infantil 👶🏼](https://telegram.me/Canalinfantil) - Conteúdo Infantil

[💃🏻 Uma Mulher Pode 💃🏻](https://telegram.me/umamulherpode) - Tudo sobre a mente e o coração da mulher

[🚘 AutoMobileFX 🚘](https://telegram.me/AutoMobileFX) -  Curiosidades e GIFs sobre Carros e Motos

[🎁 Promogram💲](https://telegram.me/PromoGram) - Compras

[📋 Guia de Canais 📋](https://telegram.me/guiadecanais) - Seleção de canais

[👸🏼 GAROTA DO TUMBLR 🌸](https://telegram.me/GarotaDoTumblr) - De tudo um pouco
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE TECNOLOGIA   ########################################################
if blocks[1] == 'canaisdetecnologia' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Tecnologia*
[Info Line](telegram.me/infoline) - Noticias sobre o mundo da ciência, tecnologia e outros

[🤖 Android S.O 🇧🇷](telegram.me/androidso) - Fique por dentro de tudo sobre o sistema Android

[🌎 Mundo Tech 💻](https://telegram.me/MundoTech) - Noticias Tecnologicas

[💻 Tec Noticias 📰](https://telegram.me/tecnoticias) - Postagens Automatizadas

[💻 COMPUTERWORLD 🌎](https://telegram.me/CWNews) - 🌎 COMPUTERWORLD on Telegram. Unofficial channel.

[📰 Informacao Tech 💻](https://telegram.me/informacaotech) - HD Cast - seu update tecnológico
]]
api.sendMessage(msg.chat.id, message, true)

end
--################################ CANAIS DE IMAGENS    ########################################################
if blocks[1] == 'canaisdeimagens' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Imagens*

[🌍 Mundo Vivo 🐠](telegram.me/gmundovivo) - Belíssimas imagens para os que admiram o mundo animal

[🍄 Triptaworld 🍄](https://telegram.me/triptaworld) - Um combo de gifs e imagens psicodélicas

[🌄 Colecionador de idéias 🌄](https://telegram.me/colecionadordeideias) - Canal focado em personalização

[🐏 Bode Gaiato🐏](https://telegram.me/BODEGAIATO) – Humor

[😂 Piadas Clássics 😂](telegram.me/piadasclassicas) - As melhores piadas aqui

[🌅Academy Of Wallpapers🌅](https://telegram.me/AcademyOfWallpapers) - Wallpapers impressionantes da alta qualidade em uma maneira mais rápida.
]]
api.sendMessage(msg.chat.id, message, true)

end

--################################ CANAIS DE DIVULGAÇÕES  ########################################################
if blocks[1] == 'canaisdedivulgacoes' then
    if not(msg.chat.type == 'private') then return end
    local message = [[
*Canais de Divulgações*

[📢 Telezap 🚀](https://telegram.me/telezap) - Um dos melhores canal de divulgação

[📢  Canais e Grupos Brasil 🇧🇷](https://telegram.me/canaisegrupos) - O maior canal brasileiro de divulgação

[📢  Dicas Gram 🌐](https://telegram.me/dicasgram) - Divulgações

[📢 Portal Telezap 📢](telegram.me/portaltelezap) - canal oficial do site portal telezap

[📋 Guia de Canais 📋](https://telegram.me/guiadecanais) - Seleção de canais
]]
api.sendMessage(msg.chat.id, message, true)

end
end

plugin.triggers = {
	onTextMessage = {
        config.cmd..'(lista)(.*)$',
        config.cmd..'(menudegrupos)(.*)$',
        config.cmd..'(menudecanais)(.*)$',
        config.cmd..'(grupos)(.*)$',
        config.cmd..'(gruposmusicais)(.*)$',
        config.cmd..'(amizades)(.*)$',
        config.cmd..'(mistos)(.*)$',
        config.cmd..'(lisamista)(.*)$',
        config.cmd..'(canaisdemusicas)(.*)$',
        config.cmd..'(canaispessoais)(.*)$',
        config.cmd..'(canaiseducativos)(.*)$',
        config.cmd..'(canaisdelivros)(.*)$',
        config.cmd..'(canaisdegibshqsmangas)(.*)$',
        config.cmd..'(canaisdefilmeseseries)(.*)$',
        config.cmd..'(canaisdenoticias)(.*)$',
        config.cmd..'(canaisdeesportes)(.*)$',
        config.cmd..'(canaisdestickers)(.*)$',
        config.cmd..'(canaisdegifs)(.*)$',
        config.cmd..'(canaisdiversos)(.*)$',
        config.cmd..'(canaisdetecnologia)(.*)$',
        config.cmd..'(canaisdeimagens)(.*)$',
        config.cmd..'(canaisdedivulgacoes)(.*)$'

	}
}

return plugin