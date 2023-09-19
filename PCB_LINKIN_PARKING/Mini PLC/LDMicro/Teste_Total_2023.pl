   0:# INIT TABLES
   1:INIT TABLE signed 1 byte char7seg[129] := {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113, 191, 134, 219, 207, 230, 237, 253, 135, 255, 239, 247, 252, 185, 222, 249, 241, 0, 176, 34, 78, 109, 210, 218, 32, 57, 15, 114, 112, 12, 64, 128, 82, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 9, 13, 97, 65, 67, 211, 159, 119, 124, 57, 94, 121, 113, 61, 116, 48, 30, 117, 56, 85, 84, 92, 115, 103, 51, 109, 120, 62, 28, 106, 118, 110, 91, 57, 100, 15, 35, 8, 32, 95, 124, 88, 94, 123, 113, 111, 116, 16, 14, 117, 24, 85, 84, 92, 115, 103, 80, 109, 120, 62, 28, 106, 118, 110, 91, 57, 48, 15, 1, 0, 99}
   2:# INIT TABLE: signed 0 bit char7seg[129] see above
  17:# 
  18:# ======= START RUNG 1 =======
  19:LabelRung1:
  20:
  21:set bit '$rung_top'
  23:# start series [
  24:# ELEM_MOVE
  25:if '$rung_top' {
  26:    let var '#TRISD' := 0
  27:}
  29:# ] finish series
  30:# 
  31:# ======= START RUNG 2 =======
  32:LabelRung2:
  33:
  34:set bit '$rung_top'
  36:# start series [
  37:# ELEM_MOVE
  38:if '$rung_top' {
  39:    let var '#TRISE' := 0
  40:}
  42:# ] finish series
  43:# 
  44:# ======= START RUNG 3 =======
  45:LabelRung3:
  46:
  47:set bit '$rung_top'
  49:# start series [
  50:# ELEM_MOVE
  51:if '$rung_top' {
  52:    let var 'NUMER' := 0
  53:}
  55:# ] finish series
  56:# 
  57:# ======= START RUNG 4 =======
  58:LabelRung4:
  59:
  60:set bit '$rung_top'
  62:# start series [
  63:# ELEM_CONTACTS
  64:if not 'Xb0' {
  65:    clear bit '$rung_top'
  66:}
  68:# ELEM_COIL
  69:let bit 'Ye2' := '$rung_top'
  71:# ] finish series
  72:# 
  73:# ======= START RUNG 5 =======
  74:LabelRung5:
  75:
  76:set bit '$rung_top'
  78:# start series [
  79:# ELEM_CONTACTS
  80:if not 'Xb1' {
  81:    clear bit '$rung_top'
  82:}
  84:# ELEM_COIL
  85:let bit 'Ye2' := '$rung_top'
  87:# ] finish series
  88:# 
  89:# ======= START RUNG 6 =======
  90:LabelRung6:
  91:
  92:set bit '$rung_top'
  94:# start series [
  95:# ELEM_CONTACTS
  96:if not 'Xb2' {
  97:    clear bit '$rung_top'
  98:}
 100:# ELEM_COIL
 101:let bit 'Ye2' := '$rung_top'
 103:# ] finish series
 104:# 
 105:# ======= START RUNG 7 =======
 106:LabelRung7:
 107:
 108:set bit '$rung_top'
 110:# start series [
 111:# ELEM_CONTACTS
 112:if not 'Xb3' {
 113:    clear bit '$rung_top'
 114:}
 116:# ELEM_COIL
 117:let bit 'Ye2' := '$rung_top'
 119:# ] finish series
 120:# 
 121:# ======= START RUNG 8 =======
 122:LabelRung8:
 123:
 124:set bit '$rung_top'
 126:# start series [
 127:# ELEM_CONTACTS
 128:if not 'Xb4' {
 129:    clear bit '$rung_top'
 130:}
 132:# ELEM_COIL
 133:let bit 'Ye2' := '$rung_top'
 135:# ] finish series
 136:# 
 137:# ======= START RUNG 9 =======
 138:LabelRung9:
 139:
 140:set bit '$rung_top'
 142:# start series [
 143:# ELEM_CONTACTS
 144:if not 'Xb5' {
 145:    clear bit '$rung_top'
 146:}
 148:# ELEM_COIL
 149:let bit 'Ye2' := '$rung_top'
 151:# ] finish series
 152:# 
 153:# ======= START RUNG 10 =======
 154:LabelRung10:
 155:
 156:set bit '$rung_top'
 158:# start series [
 159:# ELEM_TCY T10m 10000
 160:if '$rung_top' {
 161:    if 'T10m' < '10' {
 162:        increment 'T10m'
 163:    } else {
 164:        let var 'T10m' := 0
 165:        if not '$once_0_TCY_T10m' {
 166:            set bit '$once_0_TCY_T10m'
 167:        } else {
 168:            clear bit '$once_0_TCY_T10m'
 169:        }
 170:    }
 171:    if not '$once_0_TCY_T10m' {
 172:        clear bit '$rung_top'
 173:    }
 174:} else {
 175:    let var 'T10m' := 0
 176:}
 178:# ELEM_COIL
 179:let bit 'R10m' := '$rung_top'
 181:# ] finish series
 182:# 
 183:# ======= START RUNG 11 =======
 184:LabelRung11:
 185:
 186:set bit '$rung_top'
 188:# start series [
 189:# ELEM_CONTACTS
 190:if 'R10m' {
 191:    clear bit '$rung_top'
 192:}
 194:# ELEM_7SEG
 195:if '$rung_top' {
 196:    let var '$scratch' := 176
 197:    if 'NUMER' == '$scratch' {
 198:        let var 'NUMER' := 128
 199:    } else {
 200:        if 'NUMER' < '0' {
 201:            let var 'NUMER' := 32
 202:        } else {
 203:            if 'NUMER' < '129' {
 204:            } else {
 205:                let var 'NUMER' := 32
 206:            }
 207:        }
 208:    }
 209:    let var '$scratch' := 'char7seg[NUMER]'
 210:    let var '$scratch' := ~ '$scratch'
 211:    let var '#PORTD' := '$scratch'
 212:}
 214:# start parallel [
 215:let bit '$parThis_0' := '$rung_top'
 216:# ELEM_COIL
 217:if '$parThis_0' {
 218:    clear bit 'Ye0'
 219:} else {
 220:    set bit 'Ye0'
 221:}
 223:let bit '$parThis_0' := '$rung_top'
 224:# ELEM_COIL
 225:let bit 'Ye0' := '$parThis_0'
 227:# ] finish parallel
 228:# ] finish series
 229:# 
 230:# ======= START RUNG 12 =======
 231:LabelRung12:
 232:
 233:set bit '$rung_top'
 235:# start series [
 236:# ELEM_CONTACTS
 237:if not 'R10m' {
 238:    clear bit '$rung_top'
 239:}
 241:# ELEM_7SEG
 242:if '$rung_top' {
 243:    let var '$scratch' := 176
 244:    if 'NUMER' == '$scratch' {
 245:        let var 'NUMER' := 128
 246:    } else {
 247:        if 'NUMER' < '0' {
 248:            let var 'NUMER' := 32
 249:        } else {
 250:            if 'NUMER' < '129' {
 251:            } else {
 252:                let var 'NUMER' := 32
 253:            }
 254:        }
 255:    }
 256:    let var '$scratch' := 'char7seg[NUMER]'
 257:    let var '$scratch' := ~ '$scratch'
 258:    let var '#PORTD' := '$scratch'
 259:}
 261:# start parallel [
 262:let bit '$parThis_1' := '$rung_top'
 263:# ELEM_COIL
 264:let bit 'Ye1' := '$parThis_1'
 266:let bit '$parThis_1' := '$rung_top'
 267:# ELEM_COIL
 268:let bit 'Ye1' := '$parThis_1'
 270:# ] finish parallel
 271:# ] finish series
 272:# 
 273:# ======= START RUNG 13 =======
 274:LabelRung13:
 275:
 276:set bit '$rung_top'
 278:# start series [
 279:# ELEM_TCY T1s 1000000
 280:if '$rung_top' {
 281:    if 'T1s' < '1000' {
 282:        increment 'T1s'
 283:    } else {
 284:        let var 'T1s' := 0
 285:        if not '$once_1_TCY_T1s' {
 286:            set bit '$once_1_TCY_T1s'
 287:        } else {
 288:            clear bit '$once_1_TCY_T1s'
 289:        }
 290:    }
 291:    if not '$once_1_TCY_T1s' {
 292:        clear bit '$rung_top'
 293:    }
 294:} else {
 295:    let var 'T1s' := 0
 296:}
 298:# ELEM_COIL
 299:let bit 'Yc0' := '$rung_top'
 301:# ] finish series
 302:LabelRung14:
 303:
 304:# Latest INT_OP here
