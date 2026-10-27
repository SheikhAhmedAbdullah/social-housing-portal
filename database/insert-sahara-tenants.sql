-- ══════════════════════════════════════════════════════════════
-- Sahara Housing CIC (c3) — Properties + Tenants
-- Support Worker: Ali Mahmood
-- ══════════════════════════════════════════════════════════════

-- ── Properties ──

INSERT INTO properties (id, addr, post, rooms, type, cic_id)
VALUES ('p-mayfield14', '14 Mayfield Road', 'B11 3PB', 4, 'House', 'c3')
ON CONFLICT (id) DO NOTHING;

INSERT INTO properties (id, addr, post, rooms, type, cic_id)
VALUES ('p-meadway272', '272 Meadway', 'B33 8NN', 3, 'House', 'c3')
ON CONFLICT (id) DO NOTHING;

INSERT INTO properties (id, addr, post, rooms, type, cic_id)
VALUES ('p-fastpitts33', '33 Fast Pitts Road', 'B25 8PB', 3, 'House', 'c3')
ON CONFLICT (id) DO NOTHING;

-- ══════════════════════════════════════════════════════════════
-- 14 Mayfield Road, B11 3PB — 4 tenants
-- ══════════════════════════════════════════════════════════════

-- Room 1: Daniel Tombs
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-dtombs',
  'Mr',
  'Daniel',
  'Tombs',
  '1986-11-18',
  'JM243043D',
  'Male',
  'p-mayfield14',
  'c3',
  '2026-06-14',
  '1',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 2: Arron Knight
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-aknight',
  'Mr',
  'Arron',
  'Knight',
  '1986-04-20',
  'PX824015D',
  'Male',
  'p-mayfield14',
  'c3',
  '2026-06-14',
  '2',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 3: John Paul Carroll
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-jcarroll',
  'Mr',
  'John',
  'Carroll',
  '1981-12-25',
  'JS062677B',
  'Male',
  'p-mayfield14',
  'c3',
  '2026-06-14',
  '3',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 4: Paul Tombs
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-ptombs',
  'Mr',
  'Paul',
  'Tombs',
  '1966-02-23',
  'NX525334C',
  'Male',
  'p-mayfield14',
  'c3',
  '2026-06-14',
  '4',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- ══════════════════════════════════════════════════════════════
-- 272 Meadway, B33 8NN — 3 tenants
-- ══════════════════════════════════════════════════════════════

-- Room 1: Shameel Hessan Bashir
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, reason, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-sbashir',
  'Mr',
  'Shameel',
  'Bashir',
  '1977-04-26',
  'JN057255D',
  'Male',
  'Company downsized, could not afford rent',
  'p-meadway272',
  'c3',
  '2026-09-13',
  '1',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 2: Sajad Karim (no referral form on file — only photo)
INSERT INTO tenants (id, title, fname, sname, gender, prop_id, cic_id, room_no, sw)
VALUES (
  't-skarim',
  'Mr',
  'Sajad',
  'Karim',
  'Male',
  'p-meadway272',
  'c3',
  '2',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 3: Mohammed Murtaza Hussain
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, reason, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-mhussain',
  'Mr',
  'Mohammed',
  'Hussain',
  '1999-04-13',
  'PX277246C',
  'Male',
  'Fired from job, couch surfing, family home overcrowded',
  'p-meadway272',
  'c3',
  '2026-09-13',
  '3',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- ══════════════════════════════════════════════════════════════
-- 33 Fast Pitts Road, B25 8PB — 3 tenants
-- ══════════════════════════════════════════════════════════════

-- Room 1: Daniel Lee Thomas
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prev_addr, reason, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-dthomas',
  'Mr',
  'Daniel',
  'Thomas',
  '1985-04-30',
  'JK173343D',
  'Male',
  '143 Birchfield Road, Birmingham, B19 1LH',
  'Toxic work environment, resigned, on UC',
  'p-fastpitts33',
  'c3',
  '2026-08-30',
  '1',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 2: Reiss Christopher Fry
INSERT INTO tenants (id, title, fname, sname, dob, ni, gender, prev_addr, reason, prop_id, cic_id, move_in, room_no, sw)
VALUES (
  't-rfry',
  'Mr',
  'Reiss',
  'Fry',
  '2001-11-23',
  'PH383983B',
  'Male',
  '25 Fast Pits Road, Birmingham, B25 8PB',
  'College dropout, left job, seeking employment',
  'p-fastpitts33',
  'c3',
  '2026-08-30',
  '2',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;

-- Room 3: Toni Leanne Carter (no forms on file — folder was empty)
INSERT INTO tenants (id, fname, sname, gender, prop_id, cic_id, room_no, sw)
VALUES (
  't-tcarter',
  'Toni',
  'Carter',
  'Female',
  'p-fastpitts33',
  'c3',
  '3',
  'Ali Mahmood'
) ON CONFLICT (id) DO NOTHING;
