# City Pulse - Guia Turístico de Coimbra

## 📱 Descrição do Projeto

City Pulse é uma aplicação Flutter que serve como guia turístico da cidade de Coimbra, Portugal. A aplicação oferece informações sobre pontos de interesse, informações meteorológicas em tempo real e funcionalidade de favoritos com persistência local.

## ✨ Funcionalidades Implementadas

### 1. Ecrã Inicial (Home)
- ✅ Nome da cidade (Coimbra)
- ✅ Imagem de fundo representativa
- ✅ Informação meteorológica atual obtida via Open Meteo API
  - Temperatura atual
  - Condição climática
  - Ícone correspondente ao clima
- ✅ Botão para aceder às categorias turísticas
- ✅ Funcionalidade de refresh para atualizar o tempo

### 2. Categorias Turísticas
- ✅ Lista de categorias implementadas:
  - Monumentos
  - Museus
  - Gastronomia
  - Parques
  - Cultura
- ✅ Navegação para lista de pontos por categoria
- ✅ Bottom Navigation Bar para alternar entre Categorias e Favoritos

### 3. Pontos de Interesse
- ✅ Dados carregados de ficheiro JSON local (`assets/data/points_of_interest.json`)
- ✅ 12 pontos de interesse incluídos:
  - Universidade de Coimbra
  - Sé Velha de Coimbra
  - Mosteiro de Santa Cruz
  - Museu Nacional Machado de Castro
  - Museu da Ciência
  - Quinta das Lágrimas
  - Jardim Botânico
  - Tasca do Zé Manel
  - Pastelaria Briosa
  - Teatro Académico de Gil Vicente
  - Fado ao Centro
  - Portugal dos Pequenitos
- ✅ Cada ponto contém:
  - ID único
  - Nome
  - Descrição curta e completa
  - Imagem (URL)
  - Horário de funcionamento
  - Preço médio
  - Localização
  - Categoria

### 4. Ecrã de Detalhe
- ✅ Imagem em destaque com SliverAppBar expansível
- ✅ Descrição completa do ponto
- ✅ Cards informativos com:
  - Horário de funcionamento
  - Preço médio
  - Localização
  - Categoria
- ✅ Botão flutuante para adicionar/remover dos favoritos

### 5. Favoritos
- ✅ Persistência local usando `shared_preferences`
- ✅ Lista de favoritos com visualização própria
- ✅ Adicionar/remover favoritos
- ✅ Sincronização entre ecrãs
- ✅ Pull-to-refresh para atualizar lista

### 6. Navegação
- ✅ Navigator para navegação entre ecrãs
- ✅ BottomNavigationBar para alternar entre Categorias e Favoritos
- ✅ Rotas funcionais:
  - Home → Categorias
  - Categorias → Pontos por Categoria
  - Pontos → Detalhe
  - Bottom Nav → Favoritos

### 7. Orientação Portrait e Landscape
- ✅ `OrientationBuilder` implementado em todos os ecrãs
- ✅ Layouts adaptáveis:
  - Grid de categorias ajusta número de colunas (2 portrait, 3 landscape)
  - SliverAppBar ajusta altura expandida
  - Imagens com `AspectRatio` e `BoxFit` adequado

### 8. Qualidade de Código
- ✅ Organização modular por funcionalidade:
  - `/models` - Modelos de dados
  - `/services` - Lógica de negócio e APIs
  - `/screens` - Ecrãs da aplicação
  - `/widgets` - Widgets reutilizáveis
  - `/config` - Configurações
- ✅ Tratamento de erros:
  - Try-catch em todas as operações assíncronas
  - Estados de loading
  - Mensagens de erro amigáveis
  - Botões de retry
- ✅ Null safety completo
- ✅ Comentários e documentação
- ✅ Widgets reutilizáveis (PointCard, CategoryCard, WeatherWidget)

## 🏗️ Arquitetura

```
lib/
├── config/
│   └── app_config.dart          # Configurações da aplicação
├── models/
│   ├── category.dart            # Enum de categorias
│   ├── point_of_interest.dart   # Modelo de POI
│   └── weather.dart             # Modelo de dados meteorológicos
├── services/
│   ├── json_data_service.dart   # Carregamento de dados JSON
│   ├── weather_service.dart     # API Open Meteo
│   └── favorites_service.dart   # Persistência de favoritos
├── screens/
│   ├── home_screen.dart         # Ecrã inicial
│   ├── categories_screen.dart   # Lista de categorias
│   ├── points_list_screen.dart  # Lista de pontos por categoria
│   ├── detail_screen.dart       # Detalhe do ponto
│   └── favorites_screen.dart    # Lista de favoritos
├── widgets/
│   ├── point_card.dart          # Card de ponto de interesse
│   ├── category_card.dart       # Card de categoria
│   └── weather_widget.dart      # Widget de informação meteorológica
└── main.dart                    # Ponto de entrada da aplicação
```

## 📦 Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8
  http: ^1.2.0                      # Cliente HTTP para API
  shared_preferences: ^2.2.2        # Persistência local
  cached_network_image: ^3.3.1      # Cache de imagens
  intl: ^0.19.0                     # Formatação de datas/números
```

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK 3.10.3 ou superior
- Android Studio / VS Code com extensões Flutter
- Emulador Android ou dispositivo físico

### Passos

1. **Clone ou abra o projeto**
   ```bash
   cd C:\Users\migue\AndroidStudioProjects\city_pulse
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute a aplicação**
   ```bash
   flutter run
   ```

4. **Para análise de código**
   ```bash
   flutter analyze
   ```

5. **Para executar testes**
   ```bash
   flutter test
   ```

## 🌐 APIs Utilizadas

### Open Meteo API
- **Endpoint**: `https://api.open-meteo.com/v1/forecast`
- **Parâmetros**:
  - Latitude: 40.2033 (Coimbra)
  - Longitude: -8.4103 (Coimbra)
  - Dados: temperatura, humidade, velocidade do vento, código meteorológico
- **Documentação**: https://www.open-meteo.com

### Unsplash (Imagens)
- Imagens dos pontos de interesse obtidas via Unsplash
- URLs diretas para evitar necessidade de API key

## 📱 Ecrãs da Aplicação

1. **Home Screen**
   - Background com imagem de Coimbra
   - Card meteorológico semi-transparente
   - Botão de navegação principal

2. **Categories Screen**
   - Grid de categorias (2x3 portrait, 3x2 landscape)
   - Ícones e nomes das categorias
   - Bottom navigation

3. **Points List Screen**
   - Lista vertical de cards
   - Imagem, título, descrição curta
   - Botão de favorito em cada card
   - Localização

4. **Detail Screen**
   - SliverAppBar com imagem expansível
   - Descrição completa
   - Cards informativos
   - FAB para favoritos

5. **Favorites Screen**
   - Lista de favoritos
   - Pull-to-refresh
   - Mensagem quando vazio
   - Remoção rápida de favoritos

## 🔧 Configuração

Para alterar a cidade, edite `lib/config/app_config.dart`:

```dart
class AppConfig {
  static const String cityName = 'Coimbra';
  static const double cityLatitude = 40.2033;
  static const double cityLongitude = -8.4103;
  // ...
}
```

## 📊 Estrutura de Dados JSON

Exemplo de ponto de interesse:

```json
{
  "id": "1",
  "name": "Universidade de Coimbra",
  "short_description": "Uma das universidades mais antigas da Europa",
  "description": "Descrição completa...",
  "image": "https://images.unsplash.com/photo-...",
  "schedule": "Seg-Dom: 09:00-19:00",
  "average_price": "€12.50",
  "location": "Paço das Escolas",
  "category": "monuments"
}
```

## ✅ Requisitos Atendidos

- [x] Ecrã inicial com nome da cidade e informação meteorológica
- [x] Lista de categorias turísticas
- [x] Lista de pontos de interesse carregada de JSON local
- [x] Ecrã de detalhe completo
- [x] Secção de favoritos com shared_preferences
- [x] Navegação consistente entre ecrãs
- [x] Orientação portrait e landscape
- [x] Tratamento de erros e exceções
- [x] Código organizado e documentado

## 🎨 Recursos Visuais

- **Tema**: Material Design 3 com cor primária Deep Purple
- **Imagens**: Cache automático com placeholder e erro
- **Ícones**: Material Icons e emojis para categorias
- **Animações**: Transições suaves entre ecrãs
- **Responsividade**: Adaptação automática a diferentes tamanhos

## 📝 Notas Técnicas

1. **Performance**: 
   - Cache de dados JSON após primeiro carregamento
   - Cache de imagens de rede
   - Lazy loading de listas

2. **Acessibilidade**:
   - Semantics apropriados
   - Contrast ratios adequados
   - Tamanhos de toque adequados

3. **Robustez**:
   - Tratamento de falhas de rede
   - Validação de dados JSON
   - Estados de loading e erro
   - Proteção contra null

## 🐛 Problemas Conhecidos

Nenhum problema conhecido no momento. A aplicação foi testada e está funcional.

## 📖 Relatório Técnico

Este README serve como base para o relatório técnico. Pontos a destacar:

1. **Arquitetura**: Separação clara de responsabilidades (MVC simplificado)
2. **Padrões**: Service layer, Repository pattern para dados
3. **Estado**: StatefulWidgets com gestão local de estado
4. **API**: Integração REST com Open Meteo
5. **Persistência**: SharedPreferences para dados simples
6. **UI/UX**: Material Design 3, responsive, acessível
7. **Qualidade**: Código limpo, documentado, sem erros de análise

## 👨‍💻 Autor

Projeto desenvolvido para a disciplina de Programação Móvel.

## 📄 Licença

Este projeto é académico e destinado a fins educativos.

