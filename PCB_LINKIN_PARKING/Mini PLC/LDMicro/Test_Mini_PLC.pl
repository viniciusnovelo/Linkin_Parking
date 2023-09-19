   0:# INIT TABLES
   1:INIT TABLE signed 1 byte char7seg[129] := {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113, 191, 134, 219, 207, 230, 237, 253, 135, 255, 239, 247, 252, 185, 222, 249, 241, 0, 176, 34, 78, 109, 210, 218, 32, 57, 15, 114, 112, 12, 64, 128, 82, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 9, 13, 97, 65, 67, 211, 159, 119, 124, 57, 94, 121, 113, 61, 116, 48, 30, 117, 56, 85, 84, 92, 115, 103, 51, 109, 120, 62, 28, 106, 118, 110, 91, 57, 100, 15, 35, 8, 32, 95, 124, 88, 94, 123, 113, 111, 116, 16, 14, 117, 24, 85, 84, 92, 115, 103, 80, 109, 120, 62, 28, 106, 118, 110, 91, 57, 48, 15, 1, 0, 99}
   2:# INIT TABLE: signed 0 bit char7seg[129] see above
  14:# 
  15:# ======= START RUNG 1 =======
  16:LabelRung1:
  17:
  18:set bit '$rung_top'
  20:# start series [
  21:# ELEM_TCY T1s 1000000
  22:if '$rung_top' {
  23:    if 'T1s' < '500' {
  24:        increment 'T1s'
  25:    } else {
  26:        let var 'T1s' := 0
  27:        if not '$once_0_TCY_T1s' {
  28:            set bit '$once_0_TCY_T1s'
  29:        } else {
  30:            clear bit '$once_0_TCY_T1s'
  31:        }
  32:    }
  33:    if not '$once_0_TCY_T1s' {
  34:        clear bit '$rung_top'
  35:    }
  36:} else {
  37:    let var 'T1s' := 0
  38:}
  40:# ELEM_OPEN
  41:clear bit '$rung_top'
  43:# start parallel [
  44:let bit '$parThis_0' := '$rung_top'
  45:# ELEM_COIL
  46:let bit 'Yc0' := '$parThis_0'
  48:let bit '$parThis_0' := '$rung_top'
  49:# ELEM_COIL
  50:let bit 'Yc2' := '$parThis_0'
  52:let bit '$parThis_0' := '$rung_top'
  53:# ELEM_COIL
  54:let bit 'Ya5' := '$parThis_0'
  56:let bit '$parThis_0' := '$rung_top'
  57:# ELEM_COIL
  58:let bit 'Ya5' := '$parThis_0'
  60:let bit '$parThis_0' := '$rung_top'
  61:# ELEM_COIL
  62:let bit 'Yc1' := '$parThis_0'
  64:# ] finish parallel
  65:# ] finish series
  66:# 
  67:# ======= START RUNG 2 =======
  68:LabelRung2:
  69:
  70:set bit '$rung_top'
  72:# start series [
  73:# ELEM_TCY T1sa 1000000
  74:if '$rung_top' {
  75:    if 'T1sa' < '500' {
  76:        increment 'T1sa'
  77:    } else {
  78:        let var 'T1sa' := 0
  79:        if not '$once_1_TCY_T1sa' {
  80:            set bit '$once_1_TCY_T1sa'
  81:        } else {
  82:            clear bit '$once_1_TCY_T1sa'
  83:        }
  84:    }
  85:    if not '$once_1_TCY_T1sa' {
  86:        clear bit '$rung_top'
  87:    }
  88:} else {
  89:    let var 'T1sa' := 0
  90:}
  92:# ELEM_OPEN
  93:clear bit '$rung_top'
  95:# start parallel [
  96:let bit '$parThis_1' := '$rung_top'
  97:# ELEM_COIL
  98:let bit 'Yd0' := '$parThis_1'
 100:let bit '$parThis_1' := '$rung_top'
 101:# ELEM_COIL
 102:let bit 'Yd1' := '$parThis_1'
 104:let bit '$parThis_1' := '$rung_top'
 105:# ELEM_COIL
 106:let bit 'Yd2' := '$parThis_1'
 108:let bit '$parThis_1' := '$rung_top'
 109:# ELEM_COIL
 110:let bit 'Yd3' := '$parThis_1'
 112:let bit '$parThis_1' := '$rung_top'
 113:# ELEM_COIL
 114:let bit 'Yd4' := '$parThis_1'
 116:let bit '$parThis_1' := '$rung_top'
 117:# ELEM_COIL
 118:let bit 'Yd5' := '$parThis_1'
 120:let bit '$parThis_1' := '$rung_top'
 121:# ELEM_COIL
 122:let bit 'Yd6' := '$parThis_1'
 124:let bit '$parThis_1' := '$rung_top'
 125:# ELEM_COIL
 126:let bit 'Yd7' := '$parThis_1'
 128:# ] finish parallel
 129:# ] finish series
 130:# 
 131:# ======= START RUNG 3 =======
 132:LabelRung3:
 133:
 134:set bit '$rung_top'
 136:# start series [
 137:# start parallel [
 138:let bit '$parThis_2' := '$rung_top'
 139:# start series [
 140:# ELEM_OPEN
 141:clear bit '$parThis_2'
 143:# ELEM_COIL
 144:let bit 'Ye0' := '$parThis_2'
 146:# ] finish series
 147:let bit '$parThis_2' := '$rung_top'
 148:# start series [
 149:# ELEM_OPEN
 150:clear bit '$parThis_2'
 152:# ELEM_COIL
 153:let bit 'Ye1' := '$parThis_2'
 155:# ] finish series
 156:# ] finish parallel
 157:# ] finish series
 158:# 
 159:# ======= START RUNG 4 =======
 160:LabelRung4:
 161:
 162:set bit '$rung_top'
 164:# start series [
 165:# ELEM_MOVE
 166:if '$rung_top' {
 167:    let var 'uni' := 4
 168:}
 170:# ] finish series
 171:# 
 172:# ======= START RUNG 5 =======
 173:LabelRung5:
 174:
 175:set bit '$rung_top'
 177:# start series [
 178:# ELEM_MOVE
 179:if '$rung_top' {
 180:    let var 'dez' := 5
 181:}
 183:# ] finish series
 184:# 
 185:# ======= START RUNG 6 =======
 186:LabelRung6:
 187:
 188:set bit '$rung_top'
 190:# start series [
 191:# ELEM_MOVE
 192:if '$rung_top' {
 193:    let var '#TRISD' := 0
 194:}
 196:# ] finish series
 197:# 
 198:# ======= START RUNG 7 =======
 199:LabelRung7:
 200:
 201:set bit '$rung_top'
 203:# start series [
 204:# ELEM_CONTACTS
 205:if 'R20m' {
 206:    clear bit '$rung_top'
 207:}
 209:# ELEM_7SEG
 210:if '$rung_top' {
 211:    let var '$scratch' := 176
 212:    if 'uni' == '$scratch' {
 213:        let var 'uni' := 128
 214:    } else {
 215:        if 'uni' < '0' {
 216:            let var 'uni' := 32
 217:        } else {
 218:            if 'uni' < '129' {
 219:            } else {
 220:                let var 'uni' := 32
 221:            }
 222:        }
 223:    }
 224:    let var '$scratch' := 'char7seg[uni]'
 225:    let var '$scratch' := ~ '$scratch'
 226:    let var '#PORTD' := '$scratch'
 227:}
 229:# start parallel [
 230:let bit '$parThis_3' := '$rung_top'
 231:# ELEM_COIL
 232:let bit 'Ye0' := '$parThis_3'
 234:let bit '$parThis_3' := '$rung_top'
 235:# ELEM_COIL
 236:if '$parThis_3' {
 237:    clear bit 'Ye0'
 238:} else {
 239:    set bit 'Ye0'
 240:}
 242:# ] finish parallel
 243:# ] finish series
 244:# 
 245:# ======= START RUNG 8 =======
 246:LabelRung8:
 247:
 248:set bit '$rung_top'
 250:# start series [
 251:# ELEM_CONTACTS
 252:if not 'R20m' {
 253:    clear bit '$rung_top'
 254:}
 256:# ELEM_7SEG
 257:if '$rung_top' {
 258:    let var '$scratch' := 176
 259:    if 'dez' == '$scratch' {
 260:        let var 'dez' := 128
 261:    } else {
 262:        if 'dez' < '0' {
 263:            let var 'dez' := 32
 264:        } else {
 265:            if 'dez' < '129' {
 266:            } else {
 267:                let var 'dez' := 32
 268:            }
 269:        }
 270:    }
 271:    let var '$scratch' := 'char7seg[dez]'
 272:    let var '$scratch' := ~ '$scratch'
 273:    let var '#PORTD' := '$scratch'
 274:}
 276:# start parallel [
 277:let bit '$parThis_4' := '$rung_top'
 278:# ELEM_COIL
 279:let bit 'Ye1' := '$parThis_4'
 281:let bit '$parThis_4' := '$rung_top'
 282:# ELEM_COIL
 283:if '$parThis_4' {
 284:    clear bit 'Ye1'
 285:} else {
 286:    set bit 'Ye1'
 287:}
 289:# ] finish parallel
 290:# ] finish series
 291:# 
 292:# ======= START RUNG 9 =======
 293:LabelRung9:
 294:
 295:set bit '$rung_top'
 297:# start series [
 298:# ELEM_TCY T2m 10000
 299:if '$rung_top' {
 300:    if 'T2m' < '5' {
 301:        increment 'T2m'
 302:    } else {
 303:        let var 'T2m' := 0
 304:        if not '$once_2_TCY_T2m' {
 305:            set bit '$once_2_TCY_T2m'
 306:        } else {
 307:            clear bit '$once_2_TCY_T2m'
 308:        }
 309:    }
 310:    if not '$once_2_TCY_T2m' {
 311:        clear bit '$rung_top'
 312:    }
 313:} else {
 314:    let var 'T2m' := 0
 315:}
 317:# ELEM_COIL
 318:let bit 'R20m' := '$rung_top'
 320:# ] finish series
 321:# 
 322:# ======= START RUNG 10 =======
 323:LabelRung10:
 324:
 325:set bit '$rung_top'
 327:# start series [
 328:# start parallel [
 329:clear bit '$parOut_0'
 330:let bit '$parThis_5' := '$rung_top'
 331:# ELEM_CONTACTS
 332:if not 'Xb1' {
 333:    clear bit '$parThis_5'
 334:}
 336:if '$parThis_5' {
 337:    set bit '$parOut_0'
 338:}
 339:let bit '$parThis_5' := '$rung_top'
 340:# ELEM_CONTACTS
 341:if not 'Ya5' {
 342:    clear bit '$parThis_5'
 343:}
 345:if '$parThis_5' {
 346:    set bit '$parOut_0'
 347:}
 348:let bit '$rung_top' := '$parOut_0'
 349:# ] finish parallel
 350:# ELEM_CONTACTS
 351:if 'Xb0' {
 352:    clear bit '$rung_top'
 353:}
 355:# ELEM_COIL
 356:let bit 'Ya5' := '$rung_top'
 358:# ] finish series
 359:LabelRung11:
 360:
 361:# Latest INT_OP here
