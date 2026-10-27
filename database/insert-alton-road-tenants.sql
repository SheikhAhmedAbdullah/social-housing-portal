-- ══════════════════════════════════════════════════════════════
-- 85 Alton Road, Selly Oak — Property + Tenants
-- Sahara CIC (c3), Support Worker: Ali Mahmood
-- ══════════════════════════════════════════════════════════════

-- ── Property ──
INSERT INTO properties (id, addr, post, rooms, type, cic_id)
VALUES ('p-alton85', '85 Alton Road', 'B29 7DX', 4, 'House', 'c3')
ON CONFLICT (id) DO NOTHING;

-- ── Tenants ──

-- 1. Jodie Beth Bisseker
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, reason, prop_id, cic_id, move_in, sw)
VALUES (
  't-jbisseker',
  'Miss',
  'Jodie',
  'Bisseker',
  '1980-06-10',
  'PW317163D',
  'Female',
  'Depression, could not hold down a job, spent savings',
  'p-alton85',
  'c3',
  '2026-09-06',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- 2. Daniel Michael Chatwin (prev addr: 61 Alton Road, B29 7DX)
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prev_addr, reason, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-dchatwin',
  'Mr',
  'Daniel',
  'Chatwin',
  '1988-09-19',
  'JK296236A',
  'Male',
  '61 Alton Road, Selly Oak, B29 7DX',
  'Lost waiter job when restaurant closed, used up savings',
  'p-alton85',
  'c3',
  '2026-10-18',
  '1',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- 3. Steeve Marvyn Eloi Dyaboa
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prev_addr, reason, prop_id, cic_id, move_in, sw)
VALUES (
  't-sdyaboa',
  'Mr',
  'Steeve',
  'Dyaboa',
  '1990-11-12',
  'ST286972A',
  'Male',
  '51 Hollie Lucas, B13 0QH',
  'Felt unsafe in home, dangerous area, moved to improve conditions',
  'p-alton85',
  'c3',
  '2026-10-11',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- 4. Ricky Irving
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prev_addr, reason, prop_id, cic_id, move_in, sw)
VALUES (
  't-rirving',
  'Mr',
  'Ricky',
  'Irving',
  '1980-12-29',
  'JH711653B',
  'Male',
  '51 Hollie Lucas Road, B13 0QH',
  'Felt unsafe, dangerous area, moving between supported accommodation',
  'p-alton85',
  'c3',
  '2026-10-01',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;
