# #ZWOLNIJMIEJSCE — aplikacja V1

## Co już jest
- nowoczesny, mobilny interfejs PWA
- pełna grafika na wejściu
- MAM KOD / SZUKAM KODU
- lista ogłoszeń i filtr
- formularze
- rejestracja/logowanie przez Supabase
- baza ogłoszeń
- RLS (podstawowe zabezpieczenia)
- liczniki przygotowane na backend
- manifest PWA

## Co musisz zrobić
1. Załóż konto na https://supabase.com/
2. Utwórz nowy projekt.
3. W Supabase otwórz SQL Editor i wklej cały plik `supabase.sql`, uruchom.
4. W Supabase: Project Settings → API. Skopiuj:
   - Project URL
   - anon public key
5. Otwórz `app.js` i zamień:
   WKLEJ_TU_URL_PROJEKTU
   WKLEJ_TU_ANON_KEY
   na swoje dane.
6. Wrzuć cały folder na hosting. Na początek może to być darmowy hosting statyczny (np. Cloudflare Pages / Netlify / GitHub Pages).
7. W Supabase Authentication ustaw Site URL na adres aplikacji.
8. Przetestuj rejestrację i dodawanie ogłoszeń.

## Ważne
To jest wersja produkcyjnego fundamentu, ale przed publicznym startem trzeba jeszcze dodać:
- prywatne wiadomości,
- panel administratora i role admin,
- zgłoszenia z moderacją,
- prawdziwe liczniki,
- antyspam/rate limiting,
- politykę prywatności, regulamin i mechanizmy RODO,
- wygasanie ogłoszeń,
- bezpieczny sposób przekazywania kodu.

Nie przechowuj kodów meczowych w publicznych rekordach ogłoszeń.
