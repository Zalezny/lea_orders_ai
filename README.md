# LEA Orders AI

Aplikacja mobilna Flutter, która:
- pobiera i wyświetla listę produktów z DummyJSON,
- pozwala wkleić „mail z zamówieniem” i analizuje go przez AI (OpenAI Responses API),
- dopasowuje rozpoznane pozycje do produktów i liczy sumy pozycji + sumę całkowitą,
- prezentuje wynik w czytelnej tabeli i umożliwia eksport wyników do pliku JSON.

---

## Spis treści
- Opis i architektura
- Struktura projektu
- Dlaczego layer-first (a nie feature-first)
- Konfiguracja klucza AI (OpenAI)
- Format pliku konfiguracyjnego
- Uruchomienie projektu (Android/iOS)
- Obsługa i funkcje (analiza, dopasowanie, eksport)
- „Similarity-based matching” (opis algorytmu) + alternatywa „search-backed”
- Testy i generatory kodu
- Co można jeszcze doimplementować
- FAQ / Troubleshooting

---

## Opis i architektura

- Język/Framework: Flutter (Dart)
- Architektura: Clean Architecture + BLoC (flutter_bloc)
- Warstwy:
	- data: API (Dio + Retrofit), DTO, repozytoria
	- domain: encje, interfejsy repozytoriów, use-case’y
	- presentation: Cubity + widoki
- DI: get_it + injectable (pliki generowane: `lib/settings/injection.config.dart`)
- Generatory: freezed (modele), json_serializable (serializacja), retrofit_generator (klienci API), injectable_generator (DI)
- Inne: intl (formatowanie walut), path_provider (eksport do pliku), string_similarity (dopasowywanie nazw)

---

## Struktura projektu

Najważniejsze katalogi i pliki (warstwowo):

```
lib/
	main.dart                         # Bootstrap aplikacji
	settings/
		injection.dart                  # get_it + injectable konfiguracja DI
		injection.config.dart           # PLIK GENEROWANY (nie edytować ręcznie)
		app_module.dart                 # Moduły DI
	presentation/                     # UI (BLoC/Cubit + widoki)
		navigation/                     # Nawigacja / scaffolding
		pages/
		common/                         # Wspólne elementy UI (jeśli są)
		cubits/                         # Cubity + stany
	domain/                           # Logika domenowa
		entities/                       # Encje domenowe (np. MatchedOrderItem)
		repositories/                   # Interfejsy repozytoriów
		usecases/                       # Use-case’y
		core/                           # Wspólny kod domeny (np. błędy)
	data/                             # Implementacja dostępu do danych
		datasources/                    # Zewn. źródła danych (API itp.)
		models/                         # DTO (freezed + json_serializable)
		network/                        # Klienci HTTP (Dio + Retrofit)
		repositories/                   # Implementacje repozytoriów
	services/                         # Usługi niezwiązane z przechowywaniem
		config_service.dart             # Odczyt configu z assets/config

assets/
	config/
		app_config.example.json         # Przykładowy config (skopiuj jako app_config.json)

test/
	domain/                           # Testy use-case’ów
```

---

## Dlaczego układ layer-first (a nie feature-first)?

W tym repo użyłem układu warstwowego (layer-first: `data/`, `domain/`, `presentation/`) zamiast podziału per funkcjonalność (feature-first), ponieważ:

- to mały projekt rekrutacyjny z dwiema głównymi funkcjami (Produkty, Zamówienie),
- większość modeli/use-case’ów jest współdzielona (np. dopasowanie, formaty DTO), więc naturalnie lądują w odpowiednich warstwach,
- prostsza nawigacja po kodzie dla recenzenta: wiadomo „gdzie szukać” rzeczy domenowych, repozytoriów czy widoków,
- mniej narzutu na strukturę katalogów i konfigurację generatorów przy tak małej skali.

Kiedy wybrałbym feature-first?

- przy większej skali lub wielu niezależnych modułach (np. katalog, koszyk, checkout, profil),
- gdy zespoły pracują równolegle nad oddzielnymi obszarami domeny i chcę maksymalnie izolować zależności,
- aby łatwiej wdrażać granice modułów (testy, ownership, release’y) i skalować repo.

Przykład projektu w układzie feature-first: [SimpleShop](https://github.com/Zalezny/SimpleShop) 

---

## Konfiguracja klucza AI (OpenAI)

Aplikacja korzysta z OpenAI Responses API. Klucz nie może być commitowany – należy dodać go lokalnie do pliku konfiguracyjnego.

1) Załóż konto w OpenAI (jeśli nie masz):
	 - https://platform.openai.com/  → zaloguj się i utwórz klucz API (API keys).
2) Skompletuj plik konfiguracyjny:
	 - w repo znajdziesz wzór: `assets/config/app_config.example.json`
	 - skopiuj go do: `assets/config/app_config.json`
	 - uzupełnij pole `openai_api_key` swoim kluczem.

Uwaga: jeśli klucz jest pusty/niepoprawny, aplikacja pokaże wyraźny komunikat i nie uruchomi analizy.

---

## Format pliku konfiguracyjnego

Ścieżka: `assets/config/app_config.json`

Minimalny przykładowy format (z repo jest dostępny plik `app_config.example.json`):

```json
{
	"openai_api_key": "PASTE_YOUR_KEY_HERE",
	"ai": {
		"model": "gpt-4.1-mini",
		"input_prompt": "Zwróć tablicę JSON z polami name/quantity (lub nazwa/ilosc)",
		"store": false,
		"top_p": 1.0
	},
	"matching": {
		"threshold": 0.5
	}
}
```

- `openai_api_key` – Twój klucz OpenAI.
- `ai.model` – nazwa modelu; aplikacja wysyła zapytania na endpoint `/v1/responses`.
- `ai.input_prompt` – prompt opisujący format odpowiedzi (aplikacja oczekuje tablicy JSON).
- `matching.threshold` – próg akceptacji dopasowania produktów (0–1).

---

## Uruchomienie projektu (Android/iOS)

Wymagania: Flutter SDK, Android Studio/Xcode wg standardu Fluttera.

```bash
# 1) Pobierz paczki
flutter pub get

# 2) Wygeneruj kod (freezed/json/injectable/retrofit)
dart run build_runner build --delete-conflicting-outputs

# 3) Uruchom aplikację
flutter run
```

---

## Obsługa i funkcje

- Ekran „Produkty”: lista produktów z DummyJSON (limit 50) – zgodnie z wymaganiami projektu.
- Ekran „Zamówienie”:
	- wklejasz treść maila, klikasz „Analizuj zamówienie” – tekst idzie do AI,
	- aplikacja parsuje listę pozycji (nazwa + ilość), dopasowuje do produktów i liczy sumy,
	- wynik prezentowany jest w tabeli: „Nazwa produktu | Ilość | Cena jednostkowa | Suma”, z „Sumą całkowitą” poniżej.
- Eksport wyników (po dokonanym zamówieniu): przycisk „Eksportuj” zapisuje plik JSON z listą pozycji oraz sumą całkowitą
	- plik trafia do katalogu dokumentów aplikacji (path_provider), nazwa: `order_export_{timestamp}.json`.

Przykładowy tekst zamówienia do wklejenia:
- „Poproszę 2x iPhone 9 oraz 1x Samsung Universe 9. Dodatkowo 3 sztuki Apple AirPods.”
- „Zamawiam: iPhone 9 (qty: 2), AirPods (qty: 3), Universe 9 (1).”

---

## „Similarity-based matching” – jak dopasowywane są produkty

Wdrożone dopasowywanie oparte jest na lekkim algorytmie podobieństwa tekstów:
- Normalizacja: lower-case, usunięcie znaków specjalnych, tokenizacja na słowa.
- Scoring:
	- mocny „boost” za zawieranie się jednego tekstu w drugim (np. „iphone 9” ⊂ „apple iphone 9”),
	- podobieństwo tokenów (zbiór słów) – miara zbliżona do Jaccarda,
	- mały bonus za wspólne tokeny „modelowe”/liczbowe (np. „9”, „S24”, „Pro”).
- Próg akceptacji (`matching.threshold`) kontroluje, kiedy produkt uznajemy za dopasowany; poniżej progu pozycja oznaczona jest jako „Niedopasowane”.

Zalety: działa dobrze dla wariacji nazewnictwa (brand + model), jest szybkie i nie wymaga dodatkowych requestów.
Minus: Pobranie wszystkich produktów (taka metoda jest dobra po stronie backendowej)

### Alternatywa: dopasowanie przez wyszukiwarkę produktów

Prostszy (i również skuteczny oraz optymalniejszy) wariant polega na:
- odpytywaniu DummyJSON `/products/search?q={nazwa}` dla każdej rozpoznanej pozycji,
- braniu zwróconych kandydatów i wybraniu najlepszego (np. po podobieństwie nazw lub prostszych regułach).

Taki wariant bywa trafniejszy, bo zawęża kandydatów do sensownych produktów z API. W kodzie łatwo go dodać jako use-case i wywołać zamiast lub obok local-similarity (fallback).

Minusem jest jednak że produkt musi mieć w 100% prawidłową nazwę by go wyszukało (co wyklucza możliwość wystąpienia literówki użytkownika, której nie wyłapał LLM)

---

## Testy i generatory kodu

Aplikacja testowana na **Androidzie**

Uruchamianie testów:
```bash
flutter test
```

Generowanie kodu (po zmianach w DTO/DI/Retrofit/Freezed):
```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## Co można jeszcze doimplementować

- Filtry produktów na liście (po nazwie, cenie, producencie).
- Debouncing i paginacja.
- Dodatkowe formaty eksportu: CSV i PDF, plus udostępnianie pliku przez systemowy share sheet.
- Lepsze UX stanów ładowania/błędów: animacje, pull-to-refresh, retry z backoffem.
- Wielojęzyczność (EasyLocalization) i zebranie stringów w jednym miejscu: dodanie kolejnych języków i wygenerowanych kluczy, eliminacja hardcodów.
- Testy:
	- pokrycie Cubitów (bloc_test) i repozytoriów (mocktail),
	- testy widgetów dla głównych ekranów,
	- testy integracyjne flow „wklej → analizuj → dopasuj → eksportuj”.
- CI/CD:
	- pipeline (GitHub Actions) uruchamiający testy, codegen i lint,
	- budowanie artefaktów na PR/release.
- Optymalizacje wydajności:
	- ograniczenie liczby rebuildów (select w BlocBuilder),
	- memoizacja wyników podobieństwa dla tych samych fraz.
- Motyw i dostępność: dark mode, większe czcionki, wsparcie screen reader.
- konfiguracja pliku build.yaml pod utworzenie jednego folderu dla plików generowanych

---

## Licencja

Projekt rekrutacyjny – użytek demonstracyjny.
