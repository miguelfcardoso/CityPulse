# 🎨 Guia Visual de Cores e Estilos - City Pulse Premium

## 🌓 Light & Dark Mode Support

A aplicação agora suporta **Light Mode** e **Dark Mode** com paletas de cores cuidadosamente selecionadas para cada tema!

---

## Paleta de Cores - Light Mode

```
┌─────────────────────────────────────────┐
│  PRIMARY INDIGO       #6366F1  ████████ │
│  SECONDARY PINK       #EC4899  ████████ │
│  TERTIARY PURPLE      #8B5CF6  ████████ │
│  SUCCESS GREEN        #10B981  ████████ │
│  WARNING AMBER        #F59E0B  ████████ │
└─────────────────────────────────────────┘
```

## Paleta de Cores - Dark Mode

```
┌─────────────────────────────────────────┐
│  PRIMARY INDIGO       #818CF8  ████████ │
│  SECONDARY PINK       #F472B6  ████████ │
│  TERTIARY PURPLE      #A78BFA  ████████ │
│  SUCCESS GREEN        #10B981  ████████ │
│  WARNING AMBER        #F59E0B  ████████ │
└─────────────────────────────────────────┘
```

## Cores de Texto - Light Mode

```
┌─────────────────────────────────────────┐
│  HEADING DARK         #0F172A  ████████ │
│  BODY DARK            #1E293B  ████████ │
│  BODY MEDIUM          #475569  ████████ │
│  BODY LIGHT           #64748B  ████████ │
│  CAPTION              #94A3B8  ████████ │
└─────────────────────────────────────────┘
```

## Cores de Texto - Dark Mode

```
┌─────────────────────────────────────────┐
│  HEADING LIGHT        #F8FAFC  ████████ │
│  BODY LIGHT           #F8FAFC  ████████ │
│  BODY MEDIUM          #CBD5E1  ████████ │
│  BODY DIM             #94A3B8  ████████ │
│  CAPTION              #64748B  ████████ │
└─────────────────────────────────────────┘
```

## Cores de Background - Light Mode

```
┌─────────────────────────────────────────┐
│  APP BACKGROUND       #F8FAFC  ████████ │
│  CARD BACKGROUND      #FFFFFF  ████████ │
│  SURFACE              #FFFFFF  ████████ │
└─────────────────────────────────────────┘
```

## Cores de Background - Dark Mode

```
┌─────────────────────────────────────────┐
│  APP BACKGROUND       #0F172A  ████████ │
│  CARD BACKGROUND      #1E293B  ████████ │
│  SURFACE              #1E293B  ████████ │
└─────────────────────────────────────────┘
```

## Categorias com Cores Únicas

```
🏛️  MONUMENTOS      #6366F1  ████████  Indigo
🏛️  MUSEUS          #8B5CF6  ████████  Purple  
🍽️  GASTRONOMIA     #EC4899  ████████  Pink
🌳  PARQUES         #10B981  ████████  Green
🎭  CULTURA         #F59E0B  ████████  Amber
```

---

## 📏 Sistema de Espaçamento

```dart
// Padding & Margin
Extra Small:  4px
Small:        8px
Medium:      12px
Default:     16px
Large:       20px
Extra Large: 24px
XXL:         32px
Hero:        48px
```

---

## 🔘 Border Radius

```dart
// Arredondamento de cantos
Small buttons:   12px
Medium buttons:  16px
Large buttons:   30px
Small cards:     16px
Medium cards:    20px
Large cards:     24px
Pills:           999px (full rounded)
Circular:        50% (shape: circle)
```

---

## 🎭 Elevação e Sombras

### Shadow Levels

```dart
// Level 1 - Subtle (Cards)
color: Colors.black.withAlpha(0.08)
blurRadius: 20
offset: Offset(0, 8)

// Level 2 - Medium (Floating buttons)
color: Colors.black.withAlpha(0.15)
blurRadius: 15
offset: Offset(0, 5)

// Level 3 - Strong (Colored shadows)
color: PrimaryColor.withAlpha(0.4-0.5)
blurRadius: 20
offset: Offset(0, 10)
```

---

## ✍️ Tipografia

### Display (Títulos Principais)
```
Font Size: 56px
Weight: 800 (ExtraBold)
Letter Spacing: -1
Line Height: 1.1
Usage: Home screen title
```

### Headline Large
```
Font Size: 32px
Weight: 700 (Bold)
Letter Spacing: -0.5
Usage: Section headers
```

### Headline Medium
```
Font Size: 24px
Weight: 600 (SemiBold)
Letter Spacing: 0
Usage: Card titles
```

### Title Large
```
Font Size: 20px
Weight: 600 (SemiBold)
Letter Spacing: 0.15
Usage: AppBar titles
```

### Title Medium
```
Font Size: 16px
Weight: 600 (SemiBold)
Letter Spacing: 0
Usage: Subtitle, labels
```

### Body Large
```
Font Size: 16px
Weight: 400 (Regular)
Line Height: 1.6
Usage: Descriptions, paragraphs
```

### Body Medium
```
Font Size: 14px
Weight: 400 (Regular)
Line Height: 1.5
Usage: Secondary text
```

### Caption
```
Font Size: 12-13px
Weight: 500 (Medium)
Usage: Metadata, hints
```

---

## 🎨 Glassmorphism Effect

```dart
Container(
  decoration: BoxDecoration(
    // Semi-transparent gradient
    gradient: LinearGradient(
      colors: [
        Colors.white.withAlpha(0.25),
        Colors.white.withAlpha(0.15),
      ],
    ),
    // Rounded corners
    borderRadius: BorderRadius.circular(24),
    // Light border
    border: Border.all(
      color: Colors.white.withAlpha(0.3),
      width: 1.5,
    ),
    // Soft shadow
    boxShadow: [
      BoxShadow(
        color: Colors.black.withAlpha(0.1),
        blurRadius: 20,
        offset: Offset(0, 10),
      ),
    ],
  ),
)
```

---

## 🎭 Gradientes

### Primary Button Gradient
```dart
LinearGradient(
  colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

### Category Card Gradient
```dart
LinearGradient(
  colors: [
    categoryColor.withAlpha(0.9),
    categoryColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
)
```

### Image Overlay Gradient
```dart
LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Colors.black.withAlpha(0.6),
    Colors.black.withAlpha(0.4),
    Colors.black.withAlpha(0.7),
  ],
  stops: [0.0, 0.5, 1.0],
)
```

---

## ⚡ Animações

### Durations
```dart
Fast:     100-200ms  (Buttons, micro-interactions)
Normal:   300-400ms  (Page transitions, fades)
Slow:     600-800ms  (Hero animations)
Entrance: 1200ms     (Initial screen load)
```

### Curves
```dart
easeOut:        Quick start, slow end
easeOutCubic:   Smooth deceleration
easeInOut:      Smooth both ends
linear:         Constant speed
```

### Common Patterns
```dart
// Fade In
Tween<double>(begin: 0.0, end: 1.0)
Duration: 300-600ms
Curve: easeOut

// Slide Up
Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero)
Duration: 400-1000ms
Curve: easeOutCubic

// Scale Press
AnimatedScale(scale: _isPressed ? 0.95 : 1.0)
Duration: 100ms
```

---

## 🎯 Ícones

### Sizes
```dart
Small:   16px  (Inline with text)
Medium:  20px  (Buttons)
Large:   24px  (Navigation)
XLarge:  28px  (CTAs)
Hero:    48px  (Empty states)
Emoji:   40-64px (Category icons)
```

### Style
```dart
Preferência: Rounded variants
Exemplos: 
- Icons.arrow_back_ios_new_rounded
- Icons.favorite_rounded
- Icons.location_on_rounded
- Icons.explore_rounded
```

---

## 🎨 Componentes Específicos

### Premium Button
```dart
Padding: 40px horizontal, 18px vertical
Border Radius: 30px
Gradient: Primary → Tertiary
Shadow: Colored (primary + 0.5 alpha)
Text: 16px, weight 600, white
Icon: 24px, white
```

### Category Card
```dart
Padding: 20px all around
Border Radius: 24px
Gradient: Color-specific
Shadow: Matching color + 0.4 alpha
Icon Container: Circular, white 0.2 alpha
Text: 16px, weight 600, white
```

### Point Card
```dart
Border Radius: 20px
Shadow: Black 0.08, blur 20, offset (0,8)
Image Ratio: 16:10
Content Padding: 16px
Title: 18px, weight 700
Description: 14px, weight 400
Location Badge: 8px radius, indigo 0.1 background
```

### Weather Widget
```dart
Padding: 24px
Border Radius: 24px
Glassmorphism: Yes
Icon Circle: Gradient background
Temperature: 48px, weight 700
Condition: 16px, weight 500
Details Container: 16px radius, white 0.15
```

---

## 📱 Responsive Breakpoints

```dart
// Portrait Mode
Grid Columns: 2
Card Spacing: 16px
Side Padding: 16px

// Landscape Mode  
Grid Columns: 3
Card Spacing: 16px
Side Padding: 24px
```

---

## ✨ Estados Interativos

### Hover (Web/Desktop)
```dart
Scale: 1.02
Shadow: Increase blur +5
Duration: 200ms
```

### Pressed
```dart
Scale: 0.95
Duration: 100ms
Opacity: 0.9
```

### Disabled
```dart
Opacity: 0.5
Color: Grey[400]
Cursor: not-allowed
```

### Loading
```dart
Indicator: CircularProgressIndicator
Stroke Width: 2-3px
Color: Primary or White
```

---

## 🎨 Acessibilidade

### Contraste Mínimo
```
Normal Text: 4.5:1
Large Text: 3:1
Icons: 3:1
```

### Touch Targets
```
Minimum: 44x44 dp
Recommended: 48x48 dp
Spacing: 8dp between targets
```

---

**Use este guia como referência para manter consistência visual em toda a aplicação!** 🎨✨

