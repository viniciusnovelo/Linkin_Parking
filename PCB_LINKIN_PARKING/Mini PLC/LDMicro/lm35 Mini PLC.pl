   0:# INIT TABLES
   1:INIT TABLE signed 1 byte char7seg[129] := {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113, 191, 134, 219, 207, 230, 237, 253, 135, 255, 239, 247, 252, 185, 222, 249, 241, 0, 176, 34, 78, 109, 210, 218, 32, 57, 15, 114, 112, 12, 64, 128, 82, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 9, 13, 97, 65, 67, 211, 159, 119, 124, 57, 94, 121, 113, 61, 116, 48, 30, 117, 56, 85, 84, 92, 115, 103, 51, 109, 120, 62, 28, 106, 118, 110, 91, 57, 100, 15, 35, 8, 32, 95, 124, 88, 94, 123, 113, 111, 116, 16, 14, 117, 24, 85, 84, 92, 115, 103, 80, 109, 120, 62, 28, 106, 118, 110, 91, 57, 48, 15, 1, 0, 99}
   2:# INIT TABLE: signed 0 bit char7seg[129] see above
   3:# INIT VARS
   4:if not '$once_0_INIT_VARS' {
   5:    set bit '$once_0_INIT_VARS'
   6:    let var 'Ccount3' := 0
   7:}
  24:# 
  25:# ======= START RUNG 1 =======
  26:LabelRung1:
  27:
  28:set bit '$rung_top'
  30:# start series [
  31:# start parallel [
  32:# ELEM_MOVE
  33:if '$rung_top' {
  34:    let var '#TRISD' := 0
  35:}
  37:# ELEM_MOVE
  38:if '$rung_top' {
  39:    let var '#TRISE' := 0
  40:}
  42:# ] finish parallel
  43:# ] finish series
  44:# 
  45:# ======= START RUNG 2 =======
  46:LabelRung2:
  47:
  48:set bit '$rung_top'
  50:# start series [
  51:# ELEM_TCY T5m 5000
  52:if '$rung_top' {
  53:    if 'T5m' < '1' {
  54:        increment 'T5m'
  55:    } else {
  56:        let var 'T5m' := 0
  57:        if not '$once_1_TCY_T5m' {
  58:            set bit '$once_1_TCY_T5m'
  59:        } else {
  60:            clear bit '$once_1_TCY_T5m'
  61:        }
  62:    }
  63:    if not '$once_1_TCY_T5m' {
  64:        clear bit '$rung_top'
  65:    }
  66:} else {
  67:    let var 'T5m' := 0
  68:}
  70:# ELEM_COIL
  71:let bit 'RDigito' := '$rung_top'
  73:# ] finish series
  74:# 
  75:# ======= START RUNG 3 =======
  76:LabelRung3:
  77:
  78:set bit '$rung_top'
  80:# start series [
  81:# ELEM_READ_ADC
  82:if '$rung_top' {
  83:    read adc 'AAN2', refs is '0'
  84:}
  86:# ] finish series
  87:# 
  88:# ======= START RUNG 4 =======
  89:LabelRung4:
  90:
  91:set bit '$rung_top'
  93:# start series [
  94:# ELEM_TCY T1s 1000000
  95:if '$rung_top' {
  96:    if 'T1s' < '200' {
  97:        increment 'T1s'
  98:    } else {
  99:        let var 'T1s' := 0
 100:        if not '$once_2_TCY_T1s' {
 101:            set bit '$once_2_TCY_T1s'
 102:        } else {
 103:            clear bit '$once_2_TCY_T1s'
 104:        }
 105:    }
 106:    if not '$once_2_TCY_T1s' {
 107:        clear bit '$rung_top'
 108:    }
 109:} else {
 110:    let var 'T1s' := 0
 111:}
 113:# ELEM_CTU
 114:if '$rung_top' {
 115:    if not '$once_3_CTU_Ccount3' {
 116:        set bit '$once_3_CTU_Ccount3'
 117:        if 'Ccount3' < '3' {
 118:            increment 'Ccount3'
 119:        }
 120:    }
 121:} else {
 122:    clear bit '$once_3_CTU_Ccount3'
 123:}
 124:if 'Ccount3' < '3' {
 125:    clear bit '$rung_top'
 126:} else {
 127:    set bit '$rung_top'
 128:}
 130:# start parallel [
 131:let bit '$parThis_0' := '$rung_top'
 132:# ELEM_COIL
 133:let bit 'R3s' := '$parThis_0'
 135:# ELEM_RES
 136:if '$rung_top' {
 137:    let var 'Ccount3' := 0
 138:}
 140:# ] finish parallel
 141:# ] finish series
 142:# 
 143:# ======= START RUNG 5 =======
 144:LabelRung5:
 145:
 146:set bit '$rung_top'
 148:# start series [
 149:# ELEM_PIECEWISE_LINEAR
 150:if '$rung_top' {
 151:    # PWL 2
 152:    clear bit '$scratch'
 153:    if 'AAN2' < '381' {
 154:        set bit '$scratch'
 155:    }
 156:    if '$scratch' {
 157:        let var 'Valor' := 'AAN2' - '190'
 158:        let var 'Valor' := 'Valor' * '75'
 159:        let var 'Valor' := 'Valor' / '190'
 160:        let var 'Valor' := 'Valor' + '75'
 161:    }
 162:    # PWL 1
 163:    clear bit '$scratch'
 164:    if 'AAN2' < '191' {
 165:        set bit '$scratch'
 166:    }
 167:    if '$scratch' {
 168:        let var 'Valor' := 'AAN2' - '0'
 169:        let var 'Valor' := 'Valor' * '75'
 170:        let var 'Valor' := 'Valor' / '190'
 171:        let var 'Valor' := 'Valor' + '0'
 172:    }
 173:}
 175:# ] finish series
 176:# 
 177:# ======= START RUNG 6 =======
 178:LabelRung6:
 179:
 180:set bit '$rung_top'
 182:# start series [
 183:# ELEM_CONTACTS
 184:if not 'R3s' {
 185:    clear bit '$rung_top'
 186:}
 188:# ELEM_DIV
 189:if '$rung_top' {
 190:    let var '$scratch2' := 10
 191:    let var 'Dezena' := 'Valor' / '$scratch2'
 192:}
 194:# ] finish series
 195:# 
 196:# ======= START RUNG 7 =======
 197:LabelRung7:
 198:
 199:set bit '$rung_top'
 201:# start series [
 202:# ELEM_CONTACTS
 203:if not 'R3s' {
 204:    clear bit '$rung_top'
 205:}
 207:# ELEM_MOD
 208:if '$rung_top' {
 209:    let var '$scratch2' := 10
 210:    let var 'Unidade' := 'Valor' % '$scratch2'
 211:}
 213:# ] finish series
 214:# 
 215:# ======= START RUNG 8 =======
 216:LabelRung8:
 217:
 218:set bit '$rung_top'
 220:# start series [
 221:# ELEM_CONTACTS
 222:if 'RDigito' {
 223:    clear bit '$rung_top'
 224:}
 226:# ELEM_7SEG
 227:if '$rung_top' {
 228:    let var '$scratch' := 176
 229:    if 'Dezena' == '$scratch' {
 230:        let var 'Dezena' := 128
 231:    } else {
 232:        if 'Dezena' < '0' {
 233:            let var 'Dezena' := 32
 234:        } else {
 235:            if 'Dezena' < '129' {
 236:            } else {
 237:                let var 'Dezena' := 32
 238:            }
 239:        }
 240:    }
 241:    let var '$scratch' := 'char7seg[Dezena]'
 242:    let var '$scratch' := ~ '$scratch'
 243:    let var '#PORTD' := '$scratch'
 244:}
 246:# start parallel [
 247:let bit '$parThis_1' := '$rung_top'
 248:# ELEM_COIL
 249:if '$parThis_1' {
 250:    clear bit 'Ye0'
 251:} else {
 252:    set bit 'Ye0'
 253:}
 255:let bit '$parThis_1' := '$rung_top'
 256:# start series [
 257:# ELEM_OPEN
 258:clear bit '$parThis_1'
 260:# ELEM_COIL
 261:if '$parThis_1' {
 262:    clear bit 'Yd7'
 263:} else {
 264:    set bit 'Yd7'
 265:}
 267:# ] finish series
 268:let bit '$parThis_1' := '$rung_top'
 269:# start series [
 270:# ELEM_OPEN
 271:clear bit '$parThis_1'
 273:# ELEM_COIL
 274:let bit 'Ye0' := '$parThis_1'
 276:# ] finish series
 277:# ] finish parallel
 278:# ] finish series
 279:# 
 280:# ======= START RUNG 9 =======
 281:LabelRung9:
 282:
 283:set bit '$rung_top'
 285:# start series [
 286:# ELEM_CONTACTS
 287:if not 'RDigito' {
 288:    clear bit '$rung_top'
 289:}
 291:# ELEM_7SEG
 292:if '$rung_top' {
 293:    let var '$scratch' := 176
 294:    if 'Unidade' == '$scratch' {
 295:        let var 'Unidade' := 128
 296:    } else {
 297:        if 'Unidade' < '0' {
 298:            let var 'Unidade' := 32
 299:        } else {
 300:            if 'Unidade' < '129' {
 301:            } else {
 302:                let var 'Unidade' := 32
 303:            }
 304:        }
 305:    }
 306:    let var '$scratch' := 'char7seg[Unidade]'
 307:    let var '$scratch' := ~ '$scratch'
 308:    let var '#PORTD' := '$scratch'
 309:}
 311:# start parallel [
 312:let bit '$parThis_2' := '$rung_top'
 313:# ELEM_COIL
 314:if '$parThis_2' {
 315:    clear bit 'Ye1'
 316:} else {
 317:    set bit 'Ye1'
 318:}
 320:let bit '$parThis_2' := '$rung_top'
 321:# start series [
 322:# ELEM_OPEN
 323:clear bit '$parThis_2'
 325:# ELEM_COIL
 326:let bit 'Ye1' := '$parThis_2'
 328:# ] finish series
 329:# ] finish parallel
 330:# ] finish series
 331:# 
 332:# ======= START RUNG 10 =======
 333:LabelRung10:
 334:
 335:set bit '$rung_top'
 337:# start series [
 338:# ELEM_UART_RECV_AVAIL
 339:if '$rung_top' {
 340:    '$rung_top' = is uart receive data available ?
 341:}
 343:# ELEM_UART_RECV
 344:if '$rung_top' {
 345:    '$rung_top' = is uart receive data available ?
 346:    if '$rung_top' {
 347:        let var 'char' := 0
 348:        uart recv into 'char[+0]'
 349:    }
 350:}
 352:# ] finish series
 353:# 
 354:# ======= START RUNG 11 =======
 355:LabelRung11:
 356:
 357:set bit '$rung_top'
 359:# start series [
 360:# ELEM_CONTACTS
 361:if not 'R3s' {
 362:    clear bit '$rung_top'
 363:}
 365:# start parallel [
 366:clear bit '$parOut_0'
 367:let bit '$parThis_3' := '$rung_top'
 368:# start series [
 369:# ELEM_LEQ
 370:if '$parThis_3' {
 371:    if 'Valor' > '9' {
 372:        clear bit '$parThis_3'
 373:    }
 374:}
 376:# ELEM_FORMATTED_STRING
 377:if '$parThis_3' {
 378:    if not '$once_4_FMTD_STR' {
 379:        set bit '$once_4_FMTD_STR'
 380:        let var '$fmtd_0_seq' := 0
 381:        set bit '$fmtd_3_doSend'
 382:    }
 383:} else {
 384:    clear bit '$once_4_FMTD_STR'
 385:}
 386:let var '$seqScratch' := '$fmtd_0_seq'
 387:if '$fmtd_0_seq' < '11' {
 388:} else {
 389:    let var '$seqScratch' := -1
 390:}
 391:if '$fmtd_3_doSend' {
 392:    clear bit '$scratch'
 393:    '$scratch' = is uart ready to send ?
 394:    if not '$scratch' {
 395:        let var '$seqScratch' := -1
 396:    }
 397:}
 398:let var '$scratch' := 0
 399:if '$scratch' == '$seqScratch' {
 400:    let var '$charToUart' := 110
 401:}
 402:let var '$scratch' := 1
 403:if '$scratch' == '$seqScratch' {
 404:    let var '$charToUart' := 48
 405:}
 406:let var '$scratch' := 2
 407:if '$scratch' == '$seqScratch' {
 408:    let var '$charToUart' := 46
 409:}
 410:let var '$scratch' := 3
 411:if '$scratch' == '$seqScratch' {
 412:    let var '$charToUart' := 118
 413:}
 414:let var '$scratch' := 4
 415:if '$scratch' == '$seqScratch' {
 416:    let var '$charToUart' := 97
 417:}
 418:let var '$scratch' := 5
 419:if '$scratch' == '$seqScratch' {
 420:    let var '$charToUart' := 108
 421:}
 422:let var '$scratch' := 6
 423:if '$scratch' == '$seqScratch' {
 424:    let var '$charToUart' := 61
 425:}
 426:let var '$scratch' := 7
 427:clear bit '$scratch'
 428:if '$scratch' == '$seqScratch' {
 429:    set bit '$scratch'
 430:}
 431:if '$scratch' {
 432:    let var '$fmtd_1_convertState' := 'Valor'
 433:    set bit '$fmtd_2_isLeadingZero'
 434:    let var '$scratch' := 1
 435:    let var '$charToUart' := '$fmtd_1_convertState' / '$scratch'
 436:    let var '$scratch' := '$scratch' * '$charToUart'
 437:    let var '$fmtd_1_convertState' := '$fmtd_1_convertState' - '$scratch'
 438:    let var '$scratch' := 48
 439:    let var '$charToUart' := '$charToUart' + '$scratch'
 440:}
 441:let var '$scratch' := 8
 442:if '$scratch' == '$seqScratch' {
 443:    let var '$charToUart' := 255
 444:}
 445:let var '$scratch' := 9
 446:if '$scratch' == '$seqScratch' {
 447:    let var '$charToUart' := 255
 448:}
 449:let var '$scratch' := 10
 450:if '$scratch' == '$seqScratch' {
 451:    let var '$charToUart' := 255
 452:}
 453:if '$seqScratch' < '0' {
 454:} else {
 455:    if '$fmtd_3_doSend' {
 456:        uart send from '$charToUart[+0]'
 457:        increment '$fmtd_0_seq'
 458:    }
 459:}
 460:clear bit '$parThis_3'
 461:if '$fmtd_0_seq' < '11' {
 462:    if '$fmtd_3_doSend' {
 463:        set bit '$parThis_3'
 464:    }
 465:} else {
 466:    clear bit '$fmtd_3_doSend'
 467:}
 469:# ] finish series
 470:if '$parThis_3' {
 471:    set bit '$parOut_0'
 472:}
 473:let bit '$parThis_3' := '$rung_top'
 474:# start series [
 475:# ELEM_GEQ
 476:if '$parThis_3' {
 477:    if 'Valor' < '10' {
 478:        clear bit '$parThis_3'
 479:    }
 480:}
 482:# ELEM_FORMATTED_STRING
 483:if '$parThis_3' {
 484:    if not '$once_5_FMTD_STR' {
 485:        set bit '$once_5_FMTD_STR'
 486:        let var '$fmtd_4_seq' := 0
 487:        set bit '$fmtd_7_doSend'
 488:    }
 489:} else {
 490:    clear bit '$once_5_FMTD_STR'
 491:}
 492:let var '$seqScratch' := '$fmtd_4_seq'
 493:if '$fmtd_4_seq' < '12' {
 494:} else {
 495:    let var '$seqScratch' := -1
 496:}
 497:if '$fmtd_7_doSend' {
 498:    clear bit '$scratch'
 499:    '$scratch' = is uart ready to send ?
 500:    if not '$scratch' {
 501:        let var '$seqScratch' := -1
 502:    }
 503:}
 504:let var '$scratch' := 0
 505:if '$scratch' == '$seqScratch' {
 506:    let var '$charToUart' := 110
 507:}
 508:let var '$scratch' := 1
 509:if '$scratch' == '$seqScratch' {
 510:    let var '$charToUart' := 48
 511:}
 512:let var '$scratch' := 2
 513:if '$scratch' == '$seqScratch' {
 514:    let var '$charToUart' := 46
 515:}
 516:let var '$scratch' := 3
 517:if '$scratch' == '$seqScratch' {
 518:    let var '$charToUart' := 118
 519:}
 520:let var '$scratch' := 4
 521:if '$scratch' == '$seqScratch' {
 522:    let var '$charToUart' := 97
 523:}
 524:let var '$scratch' := 5
 525:if '$scratch' == '$seqScratch' {
 526:    let var '$charToUart' := 108
 527:}
 528:let var '$scratch' := 6
 529:if '$scratch' == '$seqScratch' {
 530:    let var '$charToUart' := 61
 531:}
 532:let var '$scratch' := 7
 533:clear bit '$scratch'
 534:if '$scratch' == '$seqScratch' {
 535:    set bit '$scratch'
 536:}
 537:if '$scratch' {
 538:    let var '$fmtd_5_convertState' := 'Valor'
 539:    set bit '$fmtd_6_isLeadingZero'
 540:    let var '$scratch' := 10
 541:    let var '$charToUart' := '$fmtd_5_convertState' / '$scratch'
 542:    let var '$scratch' := '$scratch' * '$charToUart'
 543:    let var '$fmtd_5_convertState' := '$fmtd_5_convertState' - '$scratch'
 544:    let var '$scratch' := 48
 545:    let var '$charToUart' := '$charToUart' + '$scratch'
 546:    if '$scratch' == '$charToUart' {
 547:        if '$fmtd_6_isLeadingZero' {
 548:            let var '$charToUart' := 32
 549:        }
 550:    } else {
 551:        clear bit '$fmtd_6_isLeadingZero'
 552:    }
 553:}
 554:let var '$scratch' := 8
 555:clear bit '$scratch'
 556:if '$scratch' == '$seqScratch' {
 557:    set bit '$scratch'
 558:}
 559:if '$scratch' {
 560:    let var '$scratch' := 1
 561:    let var '$charToUart' := '$fmtd_5_convertState' / '$scratch'
 562:    let var '$scratch' := '$scratch' * '$charToUart'
 563:    let var '$fmtd_5_convertState' := '$fmtd_5_convertState' - '$scratch'
 564:    let var '$scratch' := 48
 565:    let var '$charToUart' := '$charToUart' + '$scratch'
 566:}
 567:let var '$scratch' := 9
 568:if '$scratch' == '$seqScratch' {
 569:    let var '$charToUart' := 255
 570:}
 571:let var '$scratch' := 10
 572:if '$scratch' == '$seqScratch' {
 573:    let var '$charToUart' := 255
 574:}
 575:let var '$scratch' := 11
 576:if '$scratch' == '$seqScratch' {
 577:    let var '$charToUart' := 255
 578:}
 579:if '$seqScratch' < '0' {
 580:} else {
 581:    if '$fmtd_7_doSend' {
 582:        uart send from '$charToUart[+0]'
 583:        increment '$fmtd_4_seq'
 584:    }
 585:}
 586:clear bit '$parThis_3'
 587:if '$fmtd_4_seq' < '12' {
 588:    if '$fmtd_7_doSend' {
 589:        set bit '$parThis_3'
 590:    }
 591:} else {
 592:    clear bit '$fmtd_7_doSend'
 593:}
 595:# ] finish series
 596:if '$parThis_3' {
 597:    set bit '$parOut_0'
 598:}
 599:let bit '$rung_top' := '$parOut_0'
 600:# ] finish parallel
 601:# ] finish series
 602:# 
 603:# ======= START RUNG 12 =======
 604:LabelRung12:
 605:
 606:set bit '$rung_top'
 608:# start series [
 609:# ELEM_EQU
 610:if '$rung_top' {
 611:    if 'char' != ''0'' {
 612:        clear bit '$rung_top'
 613:    }
 614:}
 616:# ELEM_COIL
 617:if '$rung_top' {
 618:    set bit 'Yc0'
 619:}
 621:# ] finish series
 622:# 
 623:# ======= START RUNG 13 =======
 624:LabelRung13:
 625:
 626:set bit '$rung_top'
 628:# start series [
 629:# ELEM_EQU
 630:if '$rung_top' {
 631:    if 'char' != ''1'' {
 632:        clear bit '$rung_top'
 633:    }
 634:}
 636:# ELEM_COIL
 637:if '$rung_top' {
 638:    clear bit 'Yc0'
 639:}
 641:# ] finish series
 642:# 
 643:# ======= START RUNG 14 =======
 644:LabelRung14:
 645:
 646:set bit '$rung_top'
 648:# start series [
 649:# ELEM_CONTACTS
 650:if not 'Xb2' {
 651:    clear bit '$rung_top'
 652:}
 654:# ELEM_COIL
 655:if '$rung_top' {
 656:    set bit 'Yc2'
 657:}
 659:# ] finish series
 660:# 
 661:# ======= START RUNG 15 =======
 662:LabelRung15:
 663:
 664:set bit '$rung_top'
 666:# start series [
 667:# ELEM_CONTACTS
 668:if not 'Xb0' {
 669:    clear bit '$rung_top'
 670:}
 672:# ELEM_COIL
 673:if '$rung_top' {
 674:    clear bit 'Yc2'
 675:}
 677:# ] finish series
 678:LabelRung16:
 679:
 680:# Latest INT_OP here
