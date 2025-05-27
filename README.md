# TecHouse App

Aplicativo móvel simples desenvolvido em Flutter para comunicação rápida e acesso a aplicativos de segurança instalados no dispositivo.

## Descrição

O **TecHouse App** é um projeto Flutter para Android que oferece:

* **Splash Screen** personalizada com logo e tempo de exibição de 3 segundos.
* **Tela principal** com acesso a:

  * WhatsApp (envio de mensagem pré-configurada)
  * Instagram (abre o perfil especificado)
  * Localização (abre um ponto no Google Maps)
  * Quatro aplicativos de segurança instalados: ISIC Lite, WD-MOB V2, AMT Mobile V2 e Active Mobile V4

O app utiliza intenções nativas do Android para lançar outros aplicativos diretamente, sem exibir diálogos de seleção.

## Funcionalidades

1. **Splash Screen**

   * Fundo escuro (`#0A0301`)
   * Logo centralizada
   * Duração de 3 segundos antes de entrar na tela principal

2. **HomeScreen**

   * Logo e nome do aplicativo no topo
   * Botões estilizados para:

     * WhatsApp (uso de URI `whatsapp://send`)
     * Instagram (URL direcional)
     * Localização no Google Maps
     * Apps de segurança via `device_apps.openApp(packageName)`
   * Footer com créditos de desenvolvimento

3. **Visibilidade de Pacotes**

   * Permissão `QUERY_ALL_PACKAGES` declarada
   * `<queries>` listando os pacotes externos usados

## Instalação e execução

1. **Pré-requisitos**

   * Flutter SDK (>= 3.8.0)
   * Android SDK configurado
   * Dispositivo Android ou emulador conectado

2. Clone o repositório:

   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd ita_seg_app
   ```

3. Instale as dependências:

   ```bash
   flutter pub get
   ```

4. Execute em modo debug:

   ```bash
   flutter run
   ```

5. Para gerar o APK de release:

   ```bash
   flutter build apk --release
   ```

## Configurações adicionais

* **Logo e ícones**: use `flutter_launcher_icons` para gerar os launcher icons a partir de `assets/tec_house_logo.png`.
* **Nome do app**: configurado como `TecHouse` em `AndroidManifest.xml` e em `strings.xml`.
* **Assets**: colocar seus SVGs/PNGs em `assets/` e registrá-los no `pubspec.yaml`.

## Contribuição

Pull requests são bem-vindos! Para grandes mudanças, abra uma issue primeiro para discutir sua sugestão.

1. Fork este repositório
2. Crie uma branch de feature (`git checkout -b feature/NovaFuncionalidade`)
3. Commit suas alterações (`git commit -m "Adiciona nova funcionalidade"`)
4. Push para a branch (`git push origin feature/NovaFuncionalidade`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
