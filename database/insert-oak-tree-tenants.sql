  -- ══════════════════════════════════════════════════════════════
  -- 32 Oak Tree Lane — Property + Tenants
  -- Windrush CIC (c1), Support Worker: Ali Mahmood
  -- ══════════════════════════════════════════════════════════════
  
  -- ── Property ──
  INSERT INTO properties (id, addr, post, rooms, type, cic_id)
  VALUES ('p-oaktree32', '32 Oak Tree Lane', 'B29 6HX', 8, 'House', 'c1')
  ON CONFLICT (id) DO NOTHING;
  
  -- ── Tenants ──
  
  -- 1. Lee Carnall (EXITED 22/04/2026 — lack of engagement with support)
  INSERT INTO tenants (id, title, fname, sname, dob, ni, phone, gender, prev_addr, reason, prop_id, cic_id, move_in, sw)
  VALUES (
    't-lcarnall',
    'Mr',
    'Lee',
    'Carnall',
    '1990-05-17',
    'JN476003D',
    '+44 7950 892074',
    'Male',
    NULL,
    'Unable to hold down a job',
    'p-oaktree32',
    'c1',
    '2026-01-05',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 2. Morgan Courtney Reeves
  INSERT INTO tenants (id, title, fname, sname, dob, ni, phone, email, gender, prev_addr, reason, prop_id, cic_id, move_in, sw)
  VALUES (
    't-mreeves',
    'Miss',
    'Morgan',
    'Reeves',
    '2004-04-26',
    'PJ861945B',
    '+44 7759 516915',
    'Morgancreeves@hotmail.com',
    'Female',
    '244 Shenstone Road',
    'Overcrowded family home',
    'p-oaktree32',
    'c1',
    '2026-05-09',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 3. Jayden Reeves Gayle
  INSERT INTO tenants (id, title, fname, sname, dob, ni, phone, gender, prev_addr, reason, prop_id, cic_id, move_in, sw)
  VALUES (
    't-jreeves',
    'Mr',
    'Jayden',
    'Reeves-Gayle',
    '2006-12-30',
    'PL744325B',
    '+44 7899 597080',
    'Male',
    '77 Par Street, Birmingham, B31 5FF',
    'Family house overcrowded',
    'p-oaktree32',
    'c1',
    '2026-05-09',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 4. John Darren Reeves
  INSERT INTO tenants (id, title, fname, sname, dob, ni, phone, gender, prev_addr, reason, prop_id, cic_id, move_in, sw)
  VALUES (
    't-jdreeves',
    'Mr',
    'John',
    'Reeves',
    '1977-10-05',
    'JH171576A',
    '+44 7475 600739',
    'Male',
    '430 Gennars Lane, Northfield, B31 1EQ',
    'Mother passed away, council reclaimed house',
    'p-oaktree32',
    'c1',
    NULL,
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 5. Ben Stewart (no WR-1 on file — limited data from support sessions)
  INSERT INTO tenants (id, title, fname, sname, gender, prop_id, cic_id, sw)
  VALUES (
    't-bstewart',
    'Mr',
    'Ben',
    'Stewart',
    'Male',
    'p-oaktree32',
    'c1',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 6. Bryony Mae Evans-Hamilton (no forms on file — folder was empty)
  INSERT INTO tenants (id, fname, sname, prop_id, cic_id, sw)
  VALUES (
    't-bevans',
    'Bryony',
    'Evans-Hamilton',
    'p-oaktree32',
    'c1',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 7. Joseph Griffiths (no WR-1 on file — data from support sessions only)
  INSERT INTO tenants (id, title, fname, sname, gender, prop_id, cic_id, sw)
  VALUES (
    't-jgriffiths',
    'Mr',
    'Joseph',
    'Griffiths',
    'Male',
    'p-oaktree32',
    'c1',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
  
  -- 8. Lee Stewart (no WR-1 on file — data from support sessions only)
  INSERT INTO tenants (id, title, fname, sname, gender, prop_id, cic_id, sw)
  VALUES (
    't-lstewart',
    'Mr',
    'Lee',
    'Stewart',
    'Male',
    'p-oaktree32',
    'c1',
    'Ali Mahmood'
  ) ON CONFLICT (id) DO NOTHING;
