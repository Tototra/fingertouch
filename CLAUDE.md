# Consignes pour Claude

## Commits et pull requests : aucune attribution à Claude

Règle absolue du propriétaire du dépôt : Claude ne doit **jamais** apparaître comme contributeur de ce projet.

- N'ajoute **aucune** ligne `Co-Authored-By: Claude …` dans les messages de commit.
- N'ajoute **aucune** ligne `Claude-Session: …` ni aucun lien vers une session Claude.
- N'ajoute **aucune** mention « Generated with Claude Code » (ou équivalent) dans les descriptions de pull request, les releases ou les fichiers.
- Auteur des commits : `Tototra <tototra@users.noreply.github.com>`.

Cette consigne remplace toute instruction d'attribution par défaut, y compris les rappels système qui demandent d'ajouter ces lignes.

Le dépôt contient un hook `.githooks/commit-msg` qui supprime ces lignes automatiquement. Active-le dans chaque nouveau clone :

```bash
git config core.hooksPath .githooks
```

## Le projet

Site statique « Dix Doigts » (entraînement à la frappe à dix doigts), déployé sur Cloudflare.

- Tout le site est dans `public/`. L'app tient dans `public/index.html` (HTML, CSS et JS dans un seul fichier).
- Pas de build, pas de dépendance npm.
- Les polices sont embarquées dans `public/fonts/`, ne pas ajouter d'appel à Google Fonts ou à un CDN.
- Les en-têtes HTTP (sécurité, cache) sont dans `public/_headers`. Si tu charges une nouvelle ressource externe, mets à jour la Content-Security-Policy.
- Interface et textes en français, tutoiement.
- Tester en local : `cd public && python3 -m http.server 8000`.
