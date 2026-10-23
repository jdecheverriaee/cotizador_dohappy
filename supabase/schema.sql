-- Cotizador doHAPPY · esquema para Supabase
-- Ejecutar en Supabase → SQL Editor → New query → Run

create table if not exists public.cotizaciones (
  id          text primary key,
  data        jsonb not null,
  updated_at  timestamptz not null default now()
);

create table if not exists public.productos (
  id          text primary key,
  data        jsonb not null,
  updated_at  timestamptz not null default now()
);

-- Solo usuarios con sesión iniciada pueden leer y escribir
alter table public.cotizaciones enable row level security;
alter table public.productos    enable row level security;

drop policy if exists "usuarios autenticados" on public.cotizaciones;
create policy "usuarios autenticados" on public.cotizaciones
  for all to authenticated using (true) with check (true);

drop policy if exists "usuarios autenticados" on public.productos;
create policy "usuarios autenticados" on public.productos
  for all to authenticated using (true) with check (true);
