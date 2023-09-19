   0:# INIT TABLES
   7:# 
   8:# ======= START RUNG 1 =======
   9:LabelRung1:
  10:
  11:set bit '$rung_top'
  13:# start series [
  14:# ELEM_READ_ADC
  15:if '$rung_top' {
  16:    read adc 'AAN0', refs is '0'
  17:}
  19:# ] finish series
  20:# 
  21:# ======= START RUNG 2 =======
  22:LabelRung2:
  23:
  24:set bit '$rung_top'
  26:# start series [
  27:# ELEM_PIECEWISE_LINEAR
  28:if '$rung_top' {
  29:    # PWL 2
  30:    clear bit '$scratch'
  31:    if 'AAN2' < '381' {
  32:        set bit '$scratch'
  33:    }
  34:    if '$scratch' {
  35:        let var 'Temp' := 'AAN2' - '190'
  36:        let var 'Temp' := 'Temp' * '75'
  37:        let var 'Temp' := 'Temp' / '190'
  38:        let var 'Temp' := 'Temp' + '75'
  39:    }
  40:    # PWL 1
  41:    clear bit '$scratch'
  42:    if 'AAN2' < '191' {
  43:        set bit '$scratch'
  44:    }
  45:    if '$scratch' {
  46:        let var 'Temp' := 'AAN2' - '0'
  47:        let var 'Temp' := 'Temp' * '75'
  48:        let var 'Temp' := 'Temp' / '190'
  49:        let var 'Temp' := 'Temp' + '0'
  50:    }
  51:}
  53:# ] finish series
  54:# 
  55:# ======= START RUNG 3 =======
  56:LabelRung3:
  57:
  58:set bit '$rung_top'
  60:# start series [
  61:# ELEM_CONTACTS
  62:if not 'Xb3' {
  63:    clear bit '$rung_top'
  64:}
  66:# start parallel [
  67:let bit '$parThis_0' := '$rung_top'
  68:# ELEM_COIL
  69:if '$parThis_0' {
  70:    set bit 'Yc0'
  71:}
  73:let bit '$parThis_0' := '$rung_top'
  74:# ELEM_COIL
  75:if '$parThis_0' {
  76:    clear bit 'Ye2'
  77:}
  79:# ] finish parallel
  80:# ] finish series
  81:# 
  82:# ======= START RUNG 4 =======
  83:LabelRung4:
  84:
  85:set bit '$rung_top'
  87:# start series [
  88:# ELEM_CONTACTS
  89:if not 'Xb0' {
  90:    clear bit '$rung_top'
  91:}
  93:# start parallel [
  94:let bit '$parThis_1' := '$rung_top'
  95:# ELEM_COIL
  96:if '$parThis_1' {
  97:    clear bit 'Yc0'
  98:}
 100:let bit '$parThis_1' := '$rung_top'
 101:# ELEM_COIL
 102:if '$parThis_1' {
 103:    set bit 'Ye2'
 104:}
 106:# ] finish parallel
 107:# ] finish series
 108:# 
 109:# ======= START RUNG 5 =======
 110:LabelRung5:
 111:
 112:set bit '$rung_top'
 114:# start series [
 115:# ELEM_CONTACTS
 116:if not 'Xb1' {
 117:    clear bit '$rung_top'
 118:}
 120:# ELEM_COIL
 121:if '$rung_top' {
 122:    set bit 'Yc2'
 123:}
 125:# ] finish series
 126:LabelRung6:
 127:
 128:# Latest INT_OP here
