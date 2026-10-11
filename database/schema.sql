-- ══════════════════════════════════════════════════════════════
-- Aram Housing Portal — Supabase Schema
-- ══════════════════════════════════════════════════════════════

-- Enable UUID generation
create extension if not exists "uuid-ossp";

-- ── CICs ──
create table cics (
  id text primary key,
  name text not null,
  contact text,
  phone text,
  reg text,
  addr text,
  created_at timestamptz default now()
);

-- ── Properties ──
create table properties (
  id text primary key default ('p' || substr(uuid_generate_v4()::text, 1, 8)),
  addr text not null,
  post text,
  council text,
  rooms integer default 1,
  type text default 'House',
  ls date,
  le date,
  assembly text,
  cic_id text references cics(id),
  rent numeric(10,2) default 0,
  elec numeric(10,2) default 0,
  water numeric(10,2) default 0,
  gas numeric(10,2) default 0,
  inet numeric(10,2) default 0,
  misc numeric(10,2) default 0,
  created_at timestamptz default now()
);

-- ── Tenants ──
create table tenants (
  id text primary key default ('t' || substr(uuid_generate_v4()::text, 1, 8)),
  title text,
  fname text not null,
  sname text not null,
  dob date,
  ni text,
  uc text,
  phone text,
  email text,
  prev_addr text,
  reason text,
  gender text,
  ethnicity text,
  prop_id text references properties(id),
  cic_id text references cics(id),
  move_in date,
  room_no text,
  sw text,
  sig text,
  pic text,
  created_at timestamptz default now()
);

-- ── Forms (filled form records) ──
create table forms (
  id text primary key default ('f' || substr(uuid_generate_v4()::text, 1, 8)),
  tenant_id text references tenants(id),
  prop_id text references properties(id),
  cic_id text references cics(id),
  tmpl text not null,
  type text not null default 'tenant',
  status text not null default 'Draft',
  created date default current_date,
  session_date date,
  data jsonb default '{}',
  created_at timestamptz default now()
);

-- ── Staff users ──
create table staff (
  id uuid primary key references auth.users(id),
  name text not null,
  email text not null unique,
  role text not null default 'worker' check (role in ('admin', 'worker')),
  created_at timestamptz default now()
);

-- ── Signatures (stored separately for size) ──
create table signatures (
  id text primary key default ('sig' || substr(uuid_generate_v4()::text, 1, 8)),
  form_id text references forms(id) on delete cascade,
  tenant_id text references tenants(id),
  type text default 'resident',
  data text,
  created_at timestamptz default now()
);

-- ── Tenant photos ──
create table photos (
  id text primary key default ('pic' || substr(uuid_generate_v4()::text, 1, 8)),
  tenant_id text references tenants(id) on delete cascade unique,
  data text,
  created_at timestamptz default now()
);

-- ── Payments tracking ──
create table payments (
  id text primary key default ('pay' || substr(uuid_generate_v4()::text, 1, 8)),
  tenant_id text references tenants(id),
  prop_id text references properties(id),
  amount numeric(10,2) not null,
  method text,
  week_commencing date,
  collected_by text,
  collected_date date,
  notes text,
  created_at timestamptz default now()
);

-- ── Documents (file references) ──
create table documents (
  id text primary key default ('doc' || substr(uuid_generate_v4()::text, 1, 8)),
  tenant_id text references tenants(id),
  prop_id text references properties(id),
  name text not null,
  type text,
  url text,
  created_at timestamptz default now()
);

-- ══════════════════════════════════════════════════════════════
-- ROW LEVEL SECURITY
-- ══════════════════════════════════════════════════════════════

alter table cics enable row level security;
alter table properties enable row level security;
alter table tenants enable row level security;
alter table forms enable row level security;
alter table staff enable row level security;
alter table signatures enable row level security;
alter table photos enable row level security;
alter table payments enable row level security;
alter table documents enable row level security;

-- Authenticated users can read all data
create policy "Authenticated read" on cics for select to authenticated using (true);
create policy "Authenticated read" on properties for select to authenticated using (true);
create policy "Authenticated read" on tenants for select to authenticated using (true);
create policy "Authenticated read" on forms for select to authenticated using (true);
create policy "Authenticated read" on staff for select to authenticated using (true);
create policy "Authenticated read" on signatures for select to authenticated using (true);
create policy "Authenticated read" on photos for select to authenticated using (true);
create policy "Authenticated read" on payments for select to authenticated using (true);
create policy "Authenticated read" on documents for select to authenticated using (true);

-- Authenticated users can insert/update/delete
create policy "Authenticated write" on cics for all to authenticated using (true) with check (true);
create policy "Authenticated write" on properties for all to authenticated using (true) with check (true);
create policy "Authenticated write" on tenants for all to authenticated using (true) with check (true);
create policy "Authenticated write" on forms for all to authenticated using (true) with check (true);
create policy "Authenticated write" on staff for all to authenticated using (true) with check (true);
create policy "Authenticated write" on signatures for all to authenticated using (true) with check (true);
create policy "Authenticated write" on photos for all to authenticated using (true) with check (true);
create policy "Authenticated write" on payments for all to authenticated using (true) with check (true);
create policy "Authenticated write" on documents for all to authenticated using (true) with check (true);

-- ══════════════════════════════════════════════════════════════
-- SEED DATA
-- ══════════════════════════════════════════════════════════════

-- CICs
insert into cics (id, name, contact, phone, reg, addr) values
  ('c1', 'Windrush Alliance UK CIC', 'customerservice@windrushhousing.com', '03303110837', '4761', '10 Brindley Place, Birmingham, B1 2JB'),
  ('c2', 'Reliance Social Housing CIC', 'info@reliancesocialhousing.co.uk', '0121 000 0000', 'RSH-2023', 'Birmingham, West Midlands'),
  ('c3', 'Sahara Housing CIC', 'enquiries@saharacic.com', '0121 752 7887', '13006825', '146 Hagley Road, Edgbaston, Birmingham B16 9NX');

-- Properties
insert into properties (id, addr, post, council, rooms, type, ls, le, assembly, cic_id, rent, elec, water, gas, inet, misc) values
  ('p1', '14 Maple Street, Salford, M7 4AB', 'M7 4AB', 'Salford City Council', 3, 'House', '2024-03-01', '2025-02-28', 'Car park, north side', 'c1', 850.00, 65.00, 30.00, 45.00, 25.00, 10.00),
  ('p2', '7 Crown Road, Bolton, BL1 2QP', 'BL1 2QP', 'Bolton Metropolitan Council', 2, 'Flat', '2024-01-10', '2025-01-09', 'Front street, main entrance', 'c1', 620.00, 50.00, 25.00, 35.00, 22.00, 5.00),
  ('p3', '5 Bridge Road, Manchester, M14 6TT', 'M14 6TT', 'Manchester City Council', 1, 'Bedsit', '2024-06-01', '2025-05-31', 'Garden area, rear of building', 'c1', 450.00, 40.00, 20.00, 28.00, 20.00, 0.00),
  ('p4', '22 Ladypool Road, Birmingham, B12 8JU', 'B12 8JU', 'Birmingham City Council', 4, 'HMO', '2024-05-01', '2025-04-30', 'Front car park, Ladypool Road entrance', 'c2', 1200.00, 95.00, 40.00, 60.00, 30.00, 15.00),
  ('p5', '9 Birchfield Road, Birmingham, B20 3JE', 'B20 3JE', 'Birmingham City Council', 3, 'House', '2024-07-01', '2025-06-30', 'Side alley, Birchfield Road', 'c2', 780.00, 58.00, 28.00, 42.00, 25.00, 8.00);

-- Tenants
insert into tenants (id, title, fname, sname, dob, ni, uc, phone, email, prev_addr, reason, gender, ethnicity, prop_id, cic_id, move_in, room_no, sw) values
  ('t1', 'Mr', 'James', 'Okafor', '1988-04-12', 'NJ 47 28 19 C', 'UC-2024-0481', '07712 334 891', 'james.o@email.com', '23 Brook Lane, Manchester, M4 2QP', 'Lost employment, unable to meet rent', 'Male', 'Black/Black British: African', 'p1', 'c1', '2024-03-08', 'Room 1', 'Sarah Malik'),
  ('t2', 'Ms', 'Fatima', 'Yusuf', '1995-09-22', 'AB 55 66 77 D', 'UC-2024-0392', '07890 112 334', 'fatima.y@email.com', 'Temporary accommodation, Bolton', 'Family breakdown', 'Female', 'Asian/Asian British: Pakistani', 'p2', 'c1', '2024-01-15', 'Room 1', 'Sarah Malik'),
  ('t3', 'Mr', 'Marcus', 'Thompson', '1991-07-18', 'CD 34 56 78 A', 'UC-2024-0712', '07523 441 992', 'marcus.t@email.com', 'Sofa surfing, Handsworth, Birmingham', 'Eviction from previous tenancy due to rent arrears', 'Male', 'Black/Black British: Caribbean', 'p4', 'c2', '2024-05-10', 'Room 2', 'David Osei'),
  ('t4', 'Ms', 'Priya', 'Sharma', '1998-03-05', 'EF 67 89 01 B', 'UC-2024-0834', '07701 228 445', 'priya.s@email.com', 'Parents address, Sparkhill, Birmingham', 'Family breakdown, unable to return home', 'Female', 'Asian/Asian British: Indian', 'p4', 'c2', '2024-06-02', 'Room 3', 'David Osei'),
  ('t5', 'Mr', 'Leon', 'Baptiste', '1987-11-29', 'GH 12 34 56 C', 'UC-2024-0901', '07834 667 112', 'leon.b@email.com', 'Night shelter, Birmingham city centre', 'Rough sleeping, long-term homelessness', 'Male', 'Black/Black British: African', 'p5', 'c2', '2024-07-15', 'Room 1', 'David Osei');

-- Sample forms
insert into forms (id, tenant_id, prop_id, cic_id, tmpl, type, status, created, session_date, data) values
  ('f1', 't1', 'p1', 'c1', 'WR-1', 'tenant', 'Filed', '2024-03-09', null, '{"completedBy":"Sarah Malik","name":"James Okafor","ni":"NJ 47 28 19 C","dob":"1988-04-12","phone":"07712 334 891","benefits":"yes","benefitsDetail":"UC £892/month","mentalHealth":"yes","mentalHealthDetail":"Mild anxiety","gp":"yes","gpDetail":"Dr S. Patel, Salford Health Centre","ethnicOrigin":"Black/Black British: African","religion":"Christian","sexualOrientation":"Heterosexual"}'),
  ('f2', 't1', 'p1', 'c1', 'WR-2', 'tenant', 'Filed', '2024-03-09', null, '{"name":"James Okafor","room":"Room 1","address":"14 Maple Street, Salford, M7 4AB","licenseStart":"2024-03-08","coreRent":"95.00","serviceCharge":"45.00","totalHB":"140.00"}'),
  ('f3', 't1', 'p1', 'c1', 'WR-3', 'property', 'Filed', '2024-03-08', null, '{"residentName":"James Okafor","address":"14 Maple Street, Salford, M7 4AB","date":"2024-03-08"}'),
  ('f4', 't1', 'p1', 'c1', 'WR-13', 'tenant', 'Filed', '2024-03-15', '2024-03-15', '{"residentName":"James Okafor","swName":"Sarah Malik","deliveredBy":"in-person","summary":"Discussed benefit claim and mental health support. Tenant engaged well.","happy":"yes","duration":"60 minutes"}'),
  ('f5', 't1', 'p1', 'c1', 'WR-13', 'tenant', 'Filed', '2024-03-22', '2024-03-22', '{"residentName":"James Okafor","swName":"Sarah Malik","deliveredBy":"in-person","summary":"Accompanied tenant to GP registration. Referral made for CBT.","happy":"yes","duration":"90 minutes"}');
