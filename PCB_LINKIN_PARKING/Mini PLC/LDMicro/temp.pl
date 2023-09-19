   0:# INIT TABLES
   9:# 
  10:# ======= START RUNG 1 =======
  11:LabelRung1:
  12:
  13:set bit '$rung_top'
  15:# start series [
  16:# ELEM_CONTACTS
  17:if not 'Xb0' {
  18:    clear bit '$rung_top'
  19:}
  21:# ELEM_COIL
  22:let bit 'Ye2' := '$rung_top'
  24:# ] finish series
  25:# 
  26:# ======= START RUNG 2 =======
  27:LabelRung2:
  28:
  29:set bit '$rung_top'
  31:# start series [
  32:# ELEM_CONTACTS
  33:if not 'Xb1' {
  34:    clear bit '$rung_top'
  35:}
  37:# ELEM_COIL
  38:let bit 'Ye2' := '$rung_top'
  40:# ] finish series
  41:# 
  42:# ======= START RUNG 3 =======
  43:LabelRung3:
  44:
  45:set bit '$rung_top'
  47:# start series [
  48:# ELEM_CONTACTS
  49:if not 'Xb2' {
  50:    clear bit '$rung_top'
  51:}
  53:# ELEM_COIL
  54:let bit 'Ye2' := '$rung_top'
  56:# ] finish series
  57:# 
  58:# ======= START RUNG 4 =======
  59:LabelRung4:
  60:
  61:set bit '$rung_top'
  63:# start series [
  64:# ELEM_CONTACTS
  65:if not 'Xb3' {
  66:    clear bit '$rung_top'
  67:}
  69:# ELEM_COIL
  70:let bit 'Ye2' := '$rung_top'
  72:# ] finish series
  73:# 
  74:# ======= START RUNG 5 =======
  75:LabelRung5:
  76:
  77:set bit '$rung_top'
  79:# start series [
  80:# ELEM_CONTACTS
  81:if not 'Xb4' {
  82:    clear bit '$rung_top'
  83:}
  85:# ELEM_COIL
  86:let bit 'Ye2' := '$rung_top'
  88:# ] finish series
  89:# 
  90:# ======= START RUNG 6 =======
  91:LabelRung6:
  92:
  93:set bit '$rung_top'
  95:# start series [
  96:# ELEM_CONTACTS
  97:if not 'Xb5' {
  98:    clear bit '$rung_top'
  99:}
 101:# ELEM_COIL
 102:let bit 'Ye2' := '$rung_top'
 104:# ] finish series
 105:# 
 106:# ======= START RUNG 7 =======
 107:LabelRung7:
 108:
 109:set bit '$rung_top'
 111:# start series [
 112:# ELEM_TCY T1s 1000000
 113:if '$rung_top' {
 114:    if 'T1s' < '100' {
 115:        increment 'T1s'
 116:    } else {
 117:        let var 'T1s' := 0
 118:        if not '$once_0_TCY_T1s' {
 119:            set bit '$once_0_TCY_T1s'
 120:        } else {
 121:            clear bit '$once_0_TCY_T1s'
 122:        }
 123:    }
 124:    if not '$once_0_TCY_T1s' {
 125:        clear bit '$rung_top'
 126:    }
 127:} else {
 128:    let var 'T1s' := 0
 129:}
 131:# ELEM_COIL
 132:let bit 'Yc0' := '$rung_top'
 134:# ] finish series
 135:LabelRung8:
 136:
 137:# Latest INT_OP here
