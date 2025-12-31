# 🚀 Guia Rápido - City Pulse

## Executar a Aplicação

### Opção 1: Via Terminal
```bash
cd C:\Users\migue\AndroidStudioProjects\city_pulse
C:\Users\migue\.sdks\flutter\bin\flutter.bat run
```

### Opção 2: Via Android Studio
1. Abrir o projeto em Android Studio
2. Selecionar um dispositivo/emulador
3. Clicar em "Run" (Shift+F10)

## Testar Funcionalidades

### 1. Ecrã Inicial
- ✓ Verificar que "Coimbra" aparece
- ✓ Verificar temperatura e condição meteorológica
- ✓ Clicar em "Explorar Categorias"

### 2. Categorias
- ✓ Ver 5 categorias no grid
- ✓ Clicar numa categoria (ex: Monumentos)
- ✓ Usar o bottom navigation para ir aos Favoritos

### 3. Lista de Pontos
- ✓ Ver pontos da categoria selecionada
- ✓ Clicar no ícone de coração para favoritar
- ✓ Clicar no card para ver detalhes

### 4. Detalhes
- ✓ Ver imagem grande do ponto
- ✓ Ler descrição completa
- ✓ Ver horário, preço, localização
- ✓ Usar FAB para adicionar/remover favorito

### 5. Favoritos
- ✓ No bottom nav, ir para "Favoritos"
- ✓ Ver lista de pontos favoritados
- ✓ Pull-to-refresh para atualizar
- ✓ Remover favoritos

### 6. Orientação
- ✓ Rodar dispositivo para landscape
- ✓ Verificar que layouts se adaptam
- ✓ Grid de categorias muda para 3 colunas

### 7. Persistência
- ✓ Adicionar favoritos
- ✓ Fechar app completamente
- ✓ Reabrir app
- ✓ Verificar que favoritos continuam lá

## Comandos Úteis

### Análise de código
```bash
C:\Users\migue\.sdks\flutter\bin\flutter.bat analyze
```

### Executar testes
```bash
C:\Users\migue\.sdks\flutter\bin\flutter.bat test
```

### Limpar build
```bash
C:\Users\migue\.sdks\flutter\bin\flutter.bat clean
C:\Users\migue\.sdks\flutter\bin\flutter.bat pub get
```

### Ver dispositivos disponíveis
```bash
C:\Users\migue\.sdks\flutter\bin\flutter.bat devices
```

### Build APK
```bash
C:\Users\migue\.sdks\flutter\bin\flutter.bat build apk
```

## Pontos de Interesse Incluídos

1. **Monumentos**
   - Universidade de Coimbra
   - Sé Velha de Coimbra
   - Mosteiro de Santa Cruz

2. **Museus**
   - Museu Nacional Machado de Castro
   - Museu da Ciência

3. **Parques**
   - Quinta das Lágrimas
   - Jardim Botânico

4. **Gastronomia**
   - Tasca do Zé Manel
   - Pastelaria Briosa

5. **Cultura**
   - Teatro Académico de Gil Vicente
   - Fado ao Centro
   - Portugal dos Pequenitos

## Troubleshooting

### Se não carregar o tempo:
- Verificar conexão internet
- Clicar em "Atualizar Tempo"
- API Open Meteo é gratuita e não requer key

### Se imagens não aparecem:
- Verificar conexão internet
- URLs Unsplash podem mudar
- Imagens têm cache automático

### Se favoritos não persistem:
- Verificar que SharedPreferences está instalado
- Dar permissões de storage (automático no Flutter)

## Estrutura de Navegação

```
Home Screen
    ↓
Categories Screen (Bottom Nav)
    ↓                    ↓
Points List      Favorites Screen
    ↓                    ↓
Detail Screen ←----------┘
```

## API Meteorológica

**Open Meteo** (gratuita, sem API key)
- Endpoint: https://api.open-meteo.com/v1/forecast
- Latitude: 40.2033 (Coimbra)
- Longitude: -8.4103
- Dados: temperatura_2m, humidity, wind_speed, weather_code

## Notas Importantes

1. **Internet necessária** para:
   - Dados meteorológicos
   - Imagens dos pontos (depois ficam em cache)

2. **Funciona offline** (após primeiro uso):
   - Dados dos pontos (JSON local)
   - Favoritos (SharedPreferences)
   - Imagens em cache

3. **Requisitos**:
   - Flutter 3.10.3+
   - Dart 3.0+
   - Android 5.0+ / iOS 12+

## ✅ Checklist de Entrega

- [x] Código implementado
- [x] Dependências instaladas
- [x] Análise sem erros críticos
- [x] README completo
- [x] JSON com 12 pontos
- [x] Todos os requisitos atendidos
- [x] Orientações portrait/landscape
- [x] Tratamento de erros
- [x] Documentação inline

**Status**: ✅ **PRONTO PARA ENTREGA**

