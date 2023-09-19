   0:# INIT TABLES
   4:# 
   5:# ======= START RUNG 1 =======
   6:LabelRung1:
   7:
   8:set bit '$rung_top'
  10:# start series [
  11:# ELEM_CONTACTS
  12:if not 'Xb3' {
  13:    clear bit '$rung_top'
  14:}
  16:# ELEM_SET_PWM
  17:if '$rung_top' {
  18:    set pwm 'duty_cycle' % 1000 Hz out 'PWMoutpin'
  19:    set bit '$PWMoutpin'
  20:}
  22:# ] finish series
  23:# 
  24:# ======= START RUNG 2 =======
  25:LabelRung2:
  26:
  27:set bit '$rung_top'
  29:# start series [
  30:# ELEM_CONTACTS
  31:if 'Xb0' {
  32:    clear bit '$rung_top'
  33:}
  35:# start parallel [
  36:let bit '$parThis_0' := '$rung_top'
  37:# ELEM_COIL
  38:let bit 'Ye2' := '$parThis_0'
  40:let bit '$parThis_0' := '$rung_top'
  41:# ELEM_COIL
  42:let bit 'Yc0' := '$parThis_0'
  44:let bit '$parThis_0' := '$rung_top'
  45:# ELEM_COIL
  46:let bit 'Ya5' := '$parThis_0'
  48:# ] finish parallel
  49:# ] finish series
  50:LabelRung3:
  51:
  52:# Latest INT_OP here
