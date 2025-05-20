# Todo-Planer Backend

Eine REST-API für die Todo-Planer-Anwendung, entwickelt mit Ruby on Rails und Trailblazer.

## Technologien

- Ruby 2.7.5
- Ruby on Rails 6.0.6.1
- Trailblazer für die Geschäftslogik
- JSON:API für die API-Formatierung
- SQLite als Datenbank

## Funktionen

- Vollständige CRUD-Operationen für Todos und Kategorien
- Filtern von Todos nach Priorität, Kategorie und Datum
- Sortieren von Todos nach verschiedenen Kriterien
- JSON:API-konforme Endpunkte

## Installation

1. Ruby 2.7.5 installieren (empfohlen mit rbenv oder RVM)
2. Repository klonen:
   ```bash
   git clone https://github.com/jvid93/todo-planner-backend.git
   cd todo-planner-backend
   ```

3. Abhängigkeiten installieren:
   ```bash
   bundle install
   ```

4. Datenbank erstellen und migrieren:
   ```bash
   rails db:create db:migrate
   ```

5. Seed-Daten laden (optional):
   ```bash
   rails db:seed
   ```

6. Server starten:
   ```bash
   rails server -p 3000
   ```

## API-Endpunkte

### Todos

- `GET /api/todos` - Alle Todos abrufen
  - Query-Parameter:
    - `priority`: Filtern nach Priorität (Low, Medium, High)
    - `category_id`: Filtern nach Kategorie-ID
    - `due_date`: Filtern nach Fälligkeitsdatum
    - `sort`: Sortieren nach (priority, due_date, category)

- `GET /api/todos/:id` - Ein bestimmtes Todo abrufen
- `POST /api/todos` - Neues Todo erstellen
- `PUT /api/todos/:id` - Todo aktualisieren
- `DELETE /api/todos/:id` - Todo löschen

### Kategorien

- `GET /api/categories` - Alle Kategorien abrufen
- `GET /api/categories/:id` - Eine bestimmte Kategorie abrufen
- `POST /api/categories` - Neue Kategorie erstellen
- `PUT /api/categories/:id` - Kategorie aktualisieren
- `DELETE /api/categories/:id` - Kategorie löschen

## Datenmodelle

### Todo

- `title`: String (Pflichtfeld)
- `description`: Text (optional)
- `due_date`: Datum (optional)
- `priority`: String (Low, Medium, High)
- `completed`: Boolean
- `category_id`: Fremdschlüssel zu Kategorie (optional)

### Kategorie

- `name`: String (Pflichtfeld, eindeutig)

## Trailblazer-Struktur

Die Anwendung verwendet Trailblazer für die Geschäftslogik:

- `app/concepts/todo/contract/create.rb` - Validierungen für Todos
- `app/concepts/category/contract/create.rb` - Validierungen für Kategorien
- `app/concepts/todo/operation/` - Operationen für Todos (Index, Create, Show, Update, Destroy)
- `app/concepts/category/operation/` - Operationen für Kategorien (Index, Create, Show, Update, Destroy)

## Entwicklung

Die Anwendung ist so konfiguriert, dass sie mit dem EmberJS-Frontend kommunizieren kann. CORS ist aktiviert, um Cross-Origin-Anfragen zu ermöglichen.
