   0:# INIT TABLES
   3:# 
   4:# ======= START RUNG 1 =======
   5:LabelRung1:
   6:
   7:set bit '$rung_top'
   9:# start series [
  10:# start parallel [
  11:clear bit '$parOut_0'
  12:let bit '$parThis_0' := '$rung_top'
  13:# ELEM_CONTACTS
  14:if not 'Xb1' {
  15:    clear bit '$parThis_0'
  16:}
  18:if '$parThis_0' {
  19:    set bit '$parOut_0'
  20:}
  21:let bit '$parThis_0' := '$rung_top'
  22:# ELEM_CONTACTS
  23:if not 'Ya5' {
  24:    clear bit '$parThis_0'
  25:}
  27:if '$parThis_0' {
  28:    set bit '$parOut_0'
  29:}
  30:let bit '$rung_top' := '$parOut_0'
  31:# ] finish parallel
  32:# ELEM_CONTACTS
  33:if 'Xb0' {
  34:    clear bit '$rung_top'
  35:}
  37:# ELEM_COIL
  38:let bit 'Ya5' := '$rung_top'
  40:# ] finish series
  41:LabelRung2:
  42:
  43:# Latest INT_OP here
