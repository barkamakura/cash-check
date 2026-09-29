-- Bar KAMAKURA 釣り銭確認アプリ用テーブル作成SQL
-- Supabaseダッシュボード → 左メニュー「SQL Editor」→ 新しいクエリに貼り付けて実行してください
-- すでに他のアプリでこのテーブルを作成済みの場合は、何も変わらず安全に実行できます(if not exists)。

create table if not exists app_state (
  key text primary key,
  value jsonb,
  updated_at timestamptz default now()
);

alter table app_state enable row level security;

create policy "app_state_select_anon" on app_state for select to anon using (true);
create policy "app_state_insert_anon" on app_state for insert to anon with check (true);
create policy "app_state_update_anon" on app_state for update to anon using (true) with check (true);
