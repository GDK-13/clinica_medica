@echo off
:: Muda a codificação para UTF-8 para exibir os emojis corretamente no CMD
chcp 65001 > nul

echo ==========================================================
echo 💉 Iniciando a configuracao do sistema Clinica Medica...
echo ==========================================================
echo.

:: 1. Verificações de segurança
echo ⚙️  Verificando dependencias essenciais do sistema...

where ruby >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ ERRO: Ruby nao encontrado! Por favor, instale o Ruby.
    pause
    exit /b 1
)

where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo ❌ ERRO: Node.js e npm nao encontrados! Por favor, instale o Node.
    pause
    exit /b 1
)

where yarn >nul 2>nul
if %errorlevel% neq 0 (
    echo ⚠️  Yarn nao encontrado. Instalando o Yarn globalmente...
    call npm install -g yarn
)
echo ✅ Dependencias base OK!

:: 2. Instalação das Gems (Ruby)
echo.
echo 💎 Instalando o Bundler e as dependencias do Rails (Gems)...
call gem install bundler --no-document
call bundle install

:: 3. Instalação das ferramentas de Front-end (Node/Yarn)
echo.
echo 📦 Instalando pacotes do Yarn...
call yarn install

echo 🎨 Garantindo que os compiladores CSS globais estao instalados...
call npm install -g sass postcss postcss-cli autoprefixer

:: 4. Banco de Dados
echo.
echo 🗄️  Preparando o Banco de Dados (Apagando antigo, criando novo, migrando e populando)...
call ruby bin\rails db:drop db:create db:migrate db:seed

:: 5. Compilação do Layout
echo.
echo 💅 Empacotando o CSS do Twitter Bootstrap...
call ruby bin\rails css:build

echo.
echo ==========================================================
echo ✅ SUCESSO! O projeto foi configurado e esta pronto para uso.
echo ==========================================================
echo Para iniciar o servidor, execute:
echo   ruby bin\rails server
echo.
pause