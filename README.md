# Cotizador doHAPPY

Cotizador web de **Comercial Dos Jotas SPA** (doHAPPY). Arma cotizaciones en pesos chilenos,
calcula IVA 19 %, las guarda y las descarga en PDF con la marca.

Es un sitio estático (HTML + JS, sin build). Archivos:

| Archivo | Para qué |
|---|---|
| `index.html` | La aplicación completa |
| `config.js` | Credenciales de Supabase (vacío = modo local) |
| `logo-dohappy.png` | Logo para la cabecera y el ícono de la pestaña |
| `supabase/schema.sql` | Tablas y permisos para Supabase |

## Probarlo en tu computador

Abre `index.html` en el navegador. Con `config.js` vacío funciona en **modo local**:
las cotizaciones quedan guardadas en ese navegador (no se comparten entre equipos).

## 1. Subir a GitHub

1. Crea un repositorio nuevo (puede ser privado), por ejemplo `cotizador-dohappy`.
2. Sube estos archivos (botón *Add file → Upload files*, o con git):
   ```bash
   git init && git add . && git commit -m "Cotizador doHAPPY"
   git branch -M main
   git remote add origin https://github.com/TU-USUARIO/cotizador-dohappy.git
   git push -u origin main
   ```

## 2. Crear la base de datos en Supabase

1. En [supabase.com](https://supabase.com) crea un proyecto (región São Paulo es la más cercana).
2. **SQL Editor → New query**: pega el contenido de `supabase/schema.sql` y presiona *Run*.
3. **Authentication → Users → Add user → Create new user**: crea tu usuario con email y contraseña
   (marca *Auto Confirm User*). Repite para cada persona que vaya a cotizar.
4. **Authentication → Sign In / Providers → Email**: desactiva *Allow new users to sign up*,
   así nadie más puede crearse una cuenta.
5. **Project Settings → API**: copia *Project URL* y la clave *anon public*, y pégalas en `config.js`.
6. Haz commit y push del cambio en `config.js`.

Desde ese momento el cotizador pide iniciar sesión y todas las cotizaciones y productos
quedan en Supabase, visibles desde cualquier equipo.

> Las cotizaciones que hayas hecho en modo local no se pasan solas a Supabase.

## 3. Publicar con Vercel

1. En [vercel.com](https://vercel.com) → *Add New → Project* → importa el repositorio de GitHub.
2. Framework preset: **Other**. Sin build command ni output directory. *Deploy*.
3. Cada `git push` a `main` vuelve a publicar automáticamente.

## 4. Conectar tu dominio

1. En Vercel: *Project → Settings → Domains → Add*, escribe por ejemplo `cotizador.dohappy.cl`.
2. Vercel te indica el registro DNS a crear (para un subdominio, un **CNAME** a `cname.vercel-dns.com`).
   Créalo donde administras el dominio (NIC Chile, Cloudflare, etc.).
3. En Supabase → *Authentication → URL Configuration*, pon tu dominio en *Site URL*.

## Cómo se calcula

- **Precios netos + IVA**: Neto = suma de líneas − descuento; IVA = 19 % del neto; Total = Neto + IVA.
- **Precios con IVA incluido**: Total = suma de líneas − descuento; Neto = Total ÷ 1,19; IVA = Total − Neto.
- **Sin IVA** (desmarcando la opción): el total se muestra como monto exento.
- Todos los montos se redondean a pesos enteros.

## Cambiar los datos de la empresa

Están al inicio del `<script>` en `index.html`, en la constante `EMP`.
