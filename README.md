<p align="center"><img src="public/icon-192.png" width="96" alt=""></p>

<h1 align="center">Dix Doigts</h1>

<p align="center">Apprends à taper avec tous tes doigts, sans regarder le clavier.</p>

---

Dix Doigts est un site d'entraînement à la dactylographie. Chaque doigt a sa couleur, le clavier et les deux mains à l'écran montrent quel doigt utiliser pour la prochaine touche, et un compteur indique combien de tes dix doigts ont vraiment travaillé.

- 7 leçons progressives : rangée de repos, centre, rangée haute, rangée basse, mots courants, phrases avec majuscules, accents et ponctuation.
- Dispositions AZERTY et QWERTY.
- Une faute bloque le curseur jusqu'à la bonne touche.
- Vitesse en mots par minute, précision, doigt le plus fautif, record par leçon.
- Tout tourne dans le navigateur. Les records restent en local, rien n'est envoyé.

Raccourcis : `Échap` recommence la leçon, `Entrée` passe à la suivante à la fin.

## Structure

C'est un site 100 % statique, sans build ni dépendance.

```
public/
  index.html             toute l'app (HTML, CSS, JS)
  fonts/                 polices embarquées (pas d'appel à Google Fonts)
  _headers               en-têtes HTTP Cloudflare (sécurité, cache)
  manifest.webmanifest   installable comme app depuis le navigateur
  favicon.ico, icon-*.png, apple-touch-icon.png, og.png
wrangler.jsonc           config Cloudflare Workers (dossier public/)
```

## Déployer sur Cloudflare

### Option A : Cloudflare Pages (le plus simple)

1. Tableau de bord Cloudflare → **Workers & Pages** → **Create** → onglet **Pages** → **Connect to Git**.
2. Choisis le dépôt `Tototra/fingertouch`.
3. Réglages de build :
   - Framework preset : **None**
   - Build command : *(laisser vide)*
   - Build output directory : `public`
4. **Save and Deploy**. Chaque push sur `main` redéploie le site.

### Option B : Cloudflare Workers (assets statiques)

1. **Workers & Pages** → **Create** → **Import a repository** → `Tototra/fingertouch`.
2. Laisse la commande de déploiement par défaut (`npx wrangler deploy`). Le fichier `wrangler.jsonc` indique déjà de servir le dossier `public/`.

Ou depuis ton ordinateur :

```bash
npx wrangler login
npx wrangler deploy
```

### Domaine perso

Dans le projet Cloudflare → **Custom domains** → ajoute ton domaine. Une fois l'adresse finale connue, remplace `/og.png` par l'URL complète (`https://ton-domaine/og.png`) dans la balise `og:image` de `public/index.html`, pour que l'aperçu s'affiche bien quand tu partages le lien.

## Tester en local

```bash
cd public
python3 -m http.server 8000
```

Puis ouvre http://localhost:8000.

## Licence

MIT. Les polices Bricolage Grotesque et Martian Mono sont sous SIL Open Font License 1.1 (`public/fonts/OFL.txt`).
