-- SUPABASE / POSTGRESQL
create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  display_name text,
  created_at timestamptz not null default now()
);
create table if not exists public.listings (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  type text not null check (type in ('offer','request')),
  match text not null,
  sector text,
  quantity int not null default 1 check (quantity between 1 and 10),
  story text not null,
  status text not null default 'published' check (status in ('pending','published','removed','expired')),
  created_at timestamptz not null default now()
);
create table if not exists public.reports (
  id uuid primary key default gen_random_uuid(),
  listing_id uuid not null references public.listings(id) on delete cascade,
  reporter_id uuid references auth.users(id) on delete set null,
  reason text not null,
  created_at timestamptz not null default now()
);
alter table public.profiles enable row level security;
alter table public.listings enable row level security;
alter table public.reports enable row level security;
create policy "public profiles read" on public.profiles for select using (true);
create policy "own profile insert" on public.profiles for insert with check (auth.uid()=id);
create policy "own profile update" on public.profiles for update using (auth.uid()=id);
create policy "published listings read" on public.listings for select using (status='published' or auth.uid()=user_id);
create policy "own listings insert" on public.listings for insert with check (auth.uid()=user_id);
create policy "own listings update" on public.listings for update using (auth.uid()=user_id);
create policy "own listings delete" on public.listings for delete using (auth.uid()=user_id);
create policy "reports insert" on public.reports for insert with check (auth.uid()=reporter_id);
create policy "own reports read" on public.reports for select using (auth.uid()=reporter_id);
