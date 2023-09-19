   0:# INIT TABLES
   1:INIT TABLE signed 1 byte char7seg[129] := {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113, 191, 134, 219, 207, 230, 237, 253, 135, 255, 239, 247, 252, 185, 222, 249, 241, 0, 176, 34, 78, 109, 210, 218, 32, 57, 15, 114, 112, 12, 64, 128, 82, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 9, 13, 97, 65, 67, 211, 159, 119, 124, 57, 94, 121, 113, 61, 116, 48, 30, 117, 56, 85, 84, 92, 115, 103, 51, 109, 120, 62, 28, 106, 118, 110, 91, 57, 100, 15, 35, 8, 32, 95, 124, 88, 94, 123, 113, 111, 116, 16, 14, 117, 24, 85, 84, 92, 115, 103, 80, 109, 120, 62, 28, 106, 118, 110, 91, 57, 48, 15, 1, 0, 99}
   2:# INIT TABLE: signed 0 bit char7seg[129] see above
  16:# 
  17:# ======= START RUNG 1 =======
  18:LabelRung1:
  19:
  20:set bit '$rung_top'
  22:# start series [
  23:# start parallel [
  24:# ELEM_MOVE
  25:if '$rung_top' {
  26:    let var '#TRISD' := 0
  27:}
  29:# ELEM_MOVE
  30:if '$rung_top' {
  31:    let var '#TRISE' := 0
  32:}
  34:# ] finish parallel
  35:# ] finish series
  36:# 
  37:# ======= START RUNG 2 =======
  38:LabelRung2:
  39:
  40:set bit '$rung_top'
  42:# start series [
  43:# ELEM_TCY T5m 5000
  44:if '$rung_top' {
  45:    if 'T5m' < '1' {
  46:        increment 'T5m'
  47:    } else {
  48:        let var 'T5m' := 0
  49:        if not '$once_0_TCY_T5m' {
  50:            set bit '$once_0_TCY_T5m'
  51:        } else {
  52:            clear bit '$once_0_TCY_T5m'
  53:        }
  54:    }
  55:    if not '$once_0_TCY_T5m' {
  56:        clear bit '$rung_top'
  57:    }
  58:} else {
  59:    let var 'T5m' := 0
  60:}
  62:# ELEM_COIL
  63:let bit 'RDigito' := '$rung_top'
  65:# ] finish series
  66:# 
  67:# ======= START RUNG 3 =======
  68:LabelRung3:
  69:
  70:set bit '$rung_top'
  72:# start series [
  73:# ELEM_TCY T1s 3000000
  74:if '$rung_top' {
  75:    if 'T1s' < '600' {
  76:        increment 'T1s'
  77:    } else {
  78:        let var 'T1s' := 0
  79:        if not '$once_1_TCY_T1s' {
  80:            set bit '$once_1_TCY_T1s'
  81:        } else {
  82:            clear bit '$once_1_TCY_T1s'
  83:        }
  84:    }
  85:    if not '$once_1_TCY_T1s' {
  86:        clear bit '$rung_top'
  87:    }
  88:} else {
  89:    let var 'T1s' := 0
  90:}
  92:# start parallel [
  93:# ELEM_READ_ADC
  94:if '$rung_top' {
  95:    read adc 'AAN0', refs is '0'
  96:}
  98:let bit '$parThis_0' := '$rung_top'
  99:# ELEM_COIL
 100:let bit 'R3s' := '$parThis_0'
 102:# ] finish parallel
 103:# ] finish series
 104:# 
 105:# ======= START RUNG 4 =======
 106:LabelRung4:
 107:
 108:set bit '$rung_top'
 110:# start series [
 111:# ELEM_PIECEWISE_LINEAR
 112:if '$rung_top' {
 113:    # PWL 2
 114:    clear bit '$scratch'
 115:    if 'AAN0' < '1024' {
 116:        set bit '$scratch'
 117:    }
 118:    if '$scratch' {
 119:        let var 'Valor' := 'AAN0' - '511'
 120:        let var 'Valor' := 'Valor' * '25'
 121:        let var 'Valor' := 'Valor' / '512'
 122:        let var 'Valor' := 'Valor' + '25'
 123:    }
 124:    # PWL 1
 125:    clear bit '$scratch'
 126:    if 'AAN0' < '512' {
 127:        set bit '$scratch'
 128:    }
 129:    if '$scratch' {
 130:        let var 'Valor' := 'AAN0' - '0'
 131:        let var 'Valor' := 'Valor' * '25'
 132:        let var 'Valor' := 'Valor' / '511'
 133:        let var 'Valor' := 'Valor' + '0'
 134:    }
 135:}
 137:# ] finish series
 138:# 
 139:# ======= START RUNG 5 =======
 140:LabelRung5:
 141:
 142:set bit '$rung_top'
 144:# start series [
 145:# ELEM_DIV
 146:if '$rung_top' {
 147:    let var '$scratch2' := 10
 148:    let var 'Dezena' := 'Valor' / '$scratch2'
 149:}
 151:# ] finish series
 152:# 
 153:# ======= START RUNG 6 =======
 154:LabelRung6:
 155:
 156:set bit '$rung_top'
 158:# start series [
 159:# ELEM_MOD
 160:if '$rung_top' {
 161:    let var '$scratch2' := 10
 162:    let var 'Unidade' := 'Valor' % '$scratch2'
 163:}
 165:# ] finish series
 166:# 
 167:# ======= START RUNG 7 =======
 168:LabelRung7:
 169:
 170:set bit '$rung_top'
 172:# start series [
 173:# ELEM_CONTACTS
 174:if 'RDigito' {
 175:    clear bit '$rung_top'
 176:}
 178:# ELEM_7SEG
 179:if '$rung_top' {
 180:    let var '$scratch' := 176
 181:    if 'Dezena' == '$scratch' {
 182:        let var 'Dezena' := 128
 183:    } else {
 184:        if 'Dezena' < '0' {
 185:            let var 'Dezena' := 32
 186:        } else {
 187:            if 'Dezena' < '129' {
 188:            } else {
 189:                let var 'Dezena' := 32
 190:            }
 191:        }
 192:    }
 193:    let var '$scratch' := 'char7seg[Dezena]'
 194:    let var '$scratch' := ~ '$scratch'
 195:    let var '#PORTD' := '$scratch'
 196:}
 198:# start parallel [
 199:let bit '$parThis_1' := '$rung_top'
 200:# ELEM_COIL
 201:if '$parThis_1' {
 202:    clear bit 'Ye0'
 203:} else {
 204:    set bit 'Ye0'
 205:}
 207:let bit '$parThis_1' := '$rung_top'
 208:# ELEM_COIL
 209:if '$parThis_1' {
 210:    clear bit 'Yd7'
 211:} else {
 212:    set bit 'Yd7'
 213:}
 215:let bit '$parThis_1' := '$rung_top'
 216:# ELEM_COIL
 217:let bit 'Ye0' := '$parThis_1'
 219:# ] finish parallel
 220:# ] finish series
 221:# 
 222:# ======= START RUNG 8 =======
 223:LabelRung8:
 224:
 225:set bit '$rung_top'
 227:# start series [
 228:# ELEM_CONTACTS
 229:if not 'RDigito' {
 230:    clear bit '$rung_top'
 231:}
 233:# ELEM_7SEG
 234:if '$rung_top' {
 235:    let var '$scratch' := 176
 236:    if 'Unidade' == '$scratch' {
 237:        let var 'Unidade' := 128
 238:    } else {
 239:        if 'Unidade' < '0' {
 240:            let var 'Unidade' := 32
 241:        } else {
 242:            if 'Unidade' < '129' {
 243:            } else {
 244:                let var 'Unidade' := 32
 245:            }
 246:        }
 247:    }
 248:    let var '$scratch' := 'char7seg[Unidade]'
 249:    let var '$scratch' := ~ '$scratch'
 250:    let var '#PORTD' := '$scratch'
 251:}
 253:# start parallel [
 254:let bit '$parThis_2' := '$rung_top'
 255:# ELEM_COIL
 256:if '$parThis_2' {
 257:    clear bit 'Ye1'
 258:} else {
 259:    set bit 'Ye1'
 260:}
 262:let bit '$parThis_2' := '$rung_top'
 263:# ELEM_COIL
 264:let bit 'Ye1' := '$parThis_2'
 266:# ] finish parallel
 267:# ] finish series
 268:# 
 269:# ======= START RUNG 9 =======
 270:LabelRung9:
 271:
 272:set bit '$rung_top'
 274:# start series [
 275:# ELEM_UART_RECV_AVAIL
 276:if '$rung_top' {
 277:    '$rung_top' = is uart receive data available ?
 278:}
 280:# start parallel [
 281:clear bit '$parOut_0'
 282:let bit '$parThis_3' := '$rung_top'
 283:# ELEM_UART_RECV
 284:if '$parThis_3' {
 285:    '$parThis_3' = is uart receive data available ?
 286:    if '$parThis_3' {
 287:        let var 'char' := 0
 288:        uart recv into 'char[+0]'
 289:    }
 290:}
 292:if '$parThis_3' {
 293:    set bit '$parOut_0'
 294:}
 295:let bit '$parThis_3' := '$rung_top'
 296:# ELEM_FORMATTED_STRING
 297:if '$parThis_3' {
 298:    if not '$once_2_FMTD_STR' {
 299:        set bit '$once_2_FMTD_STR'
 300:        let var '$fmtd_0_seq' := 0
 301:        set bit '$fmtd_3_doSend'
 302:    }
 303:} else {
 304:    clear bit '$once_2_FMTD_STR'
 305:}
 306:let var '$seqScratch' := '$fmtd_0_seq'
 307:if '$fmtd_0_seq' < '12' {
 308:} else {
 309:    let var '$seqScratch' := -1
 310:}
 311:if '$fmtd_3_doSend' {
 312:    clear bit '$scratch'
 313:    '$scratch' = is uart ready to send ?
 314:    if not '$scratch' {
 315:        let var '$seqScratch' := -1
 316:    }
 317:}
 318:let var '$scratch' := 0
 319:if '$scratch' == '$seqScratch' {
 320:    let var '$charToUart' := 118
 321:}
 322:let var '$scratch' := 1
 323:if '$scratch' == '$seqScratch' {
 324:    let var '$charToUart' := 97
 325:}
 326:let var '$scratch' := 2
 327:if '$scratch' == '$seqScratch' {
 328:    let var '$charToUart' := 108
 329:}
 330:let var '$scratch' := 3
 331:if '$scratch' == '$seqScratch' {
 332:    let var '$charToUart' := 117
 333:}
 334:let var '$scratch' := 4
 335:if '$scratch' == '$seqScratch' {
 336:    let var '$charToUart' := 101
 337:}
 338:let var '$scratch' := 5
 339:if '$scratch' == '$seqScratch' {
 340:    let var '$charToUart' := 58
 341:}
 342:let var '$scratch' := 6
 343:if '$scratch' == '$seqScratch' {
 344:    let var '$charToUart' := 32
 345:}
 346:let var '$scratch' := 7
 347:clear bit '$scratch'
 348:if '$scratch' == '$seqScratch' {
 349:    set bit '$scratch'
 350:}
 351:if '$scratch' {
 352:    let var '$fmtd_1_convertState' := 'var'
 353:    set bit '$fmtd_2_isLeadingZero'
 354:    let var '$scratch' := 100
 355:    let var '$charToUart' := '$fmtd_1_convertState' / '$scratch'
 356:    let var '$scratch' := '$scratch' * '$charToUart'
 357:    let var '$fmtd_1_convertState' := '$fmtd_1_convertState' - '$scratch'
 358:    let var '$scratch' := 48
 359:    let var '$charToUart' := '$charToUart' + '$scratch'
 360:    if '$scratch' == '$charToUart' {
 361:        if '$fmtd_2_isLeadingZero' {
 362:            let var '$charToUart' := 32
 363:        }
 364:    } else {
 365:        clear bit '$fmtd_2_isLeadingZero'
 366:    }
 367:}
 368:let var '$scratch' := 8
 369:clear bit '$scratch'
 370:if '$scratch' == '$seqScratch' {
 371:    set bit '$scratch'
 372:}
 373:if '$scratch' {
 374:    let var '$scratch' := 10
 375:    let var '$charToUart' := '$fmtd_1_convertState' / '$scratch'
 376:    let var '$scratch' := '$scratch' * '$charToUart'
 377:    let var '$fmtd_1_convertState' := '$fmtd_1_convertState' - '$scratch'
 378:    let var '$scratch' := 48
 379:    let var '$charToUart' := '$charToUart' + '$scratch'
 380:    if '$scratch' == '$charToUart' {
 381:        if '$fmtd_2_isLeadingZero' {
 382:            let var '$charToUart' := 32
 383:        }
 384:    } else {
 385:        clear bit '$fmtd_2_isLeadingZero'
 386:    }
 387:}
 388:let var '$scratch' := 9
 389:clear bit '$scratch'
 390:if '$scratch' == '$seqScratch' {
 391:    set bit '$scratch'
 392:}
 393:if '$scratch' {
 394:    let var '$scratch' := 1
 395:    let var '$charToUart' := '$fmtd_1_convertState' / '$scratch'
 396:    let var '$scratch' := '$scratch' * '$charToUart'
 397:    let var '$fmtd_1_convertState' := '$fmtd_1_convertState' - '$scratch'
 398:    let var '$scratch' := 48
 399:    let var '$charToUart' := '$charToUart' + '$scratch'
 400:}
 401:let var '$scratch' := 10
 402:if '$scratch' == '$seqScratch' {
 403:    let var '$charToUart' := 13
 404:}
 405:let var '$scratch' := 11
 406:if '$scratch' == '$seqScratch' {
 407:    let var '$charToUart' := 10
 408:}
 409:if '$seqScratch' < '0' {
 410:} else {
 411:    if '$fmtd_3_doSend' {
 412:        uart send from '$charToUart[+0]'
 413:        increment '$fmtd_0_seq'
 414:    }
 415:}
 416:clear bit '$parThis_3'
 417:if '$fmtd_0_seq' < '12' {
 418:    if '$fmtd_3_doSend' {
 419:        set bit '$parThis_3'
 420:    }
 421:} else {
 422:    clear bit '$fmtd_3_doSend'
 423:}
 425:if '$parThis_3' {
 426:    set bit '$parOut_0'
 427:}
 428:let bit '$rung_top' := '$parOut_0'
 429:# ] finish parallel
 430:# ] finish series
 431:# 
 432:# ======= START RUNG 10 =======
 433:LabelRung10:
 434:
 435:set bit '$rung_top'
 437:# start series [
 438:# start parallel [
 439:clear bit '$parOut_1'
 440:let bit '$parThis_4' := '$rung_top'
 441:# ELEM_CONTACTS
 442:if not 'R3s' {
 443:    clear bit '$parThis_4'
 444:}
 446:if '$parThis_4' {
 447:    set bit '$parOut_1'
 448:}
 449:let bit '$parThis_4' := '$rung_top'
 450:# ELEM_SHORT
 452:if '$parThis_4' {
 453:    set bit '$parOut_1'
 454:}
 455:let bit '$rung_top' := '$parOut_1'
 456:# ] finish parallel
 457:# start parallel [
 458:clear bit '$parOut_2'
 459:let bit '$parThis_5' := '$rung_top'
 460:# start series [
 461:# ELEM_LEQ
 462:if '$parThis_5' {
 463:    if 'Valor' > '9' {
 464:        clear bit '$parThis_5'
 465:    }
 466:}
 468:# ELEM_FORMATTED_STRING
 469:if '$parThis_5' {
 470:    if not '$once_3_FMTD_STR' {
 471:        set bit '$once_3_FMTD_STR'
 472:        let var '$fmtd_4_seq' := 0
 473:        set bit '$fmtd_7_doSend'
 474:    }
 475:} else {
 476:    clear bit '$once_3_FMTD_STR'
 477:}
 478:let var '$seqScratch' := '$fmtd_4_seq'
 479:if '$fmtd_4_seq' < '11' {
 480:} else {
 481:    let var '$seqScratch' := -1
 482:}
 483:if '$fmtd_7_doSend' {
 484:    clear bit '$scratch'
 485:    '$scratch' = is uart ready to send ?
 486:    if not '$scratch' {
 487:        let var '$seqScratch' := -1
 488:    }
 489:}
 490:let var '$scratch' := 0
 491:if '$scratch' == '$seqScratch' {
 492:    let var '$charToUart' := 110
 493:}
 494:let var '$scratch' := 1
 495:if '$scratch' == '$seqScratch' {
 496:    let var '$charToUart' := 48
 497:}
 498:let var '$scratch' := 2
 499:if '$scratch' == '$seqScratch' {
 500:    let var '$charToUart' := 46
 501:}
 502:let var '$scratch' := 3
 503:if '$scratch' == '$seqScratch' {
 504:    let var '$charToUart' := 118
 505:}
 506:let var '$scratch' := 4
 507:if '$scratch' == '$seqScratch' {
 508:    let var '$charToUart' := 97
 509:}
 510:let var '$scratch' := 5
 511:if '$scratch' == '$seqScratch' {
 512:    let var '$charToUart' := 108
 513:}
 514:let var '$scratch' := 6
 515:if '$scratch' == '$seqScratch' {
 516:    let var '$charToUart' := 61
 517:}
 518:let var '$scratch' := 7
 519:clear bit '$scratch'
 520:if '$scratch' == '$seqScratch' {
 521:    set bit '$scratch'
 522:}
 523:if '$scratch' {
 524:    let var '$fmtd_5_convertState' := 'Valor'
 525:    set bit '$fmtd_6_isLeadingZero'
 526:    let var '$scratch' := 1
 527:    let var '$charToUart' := '$fmtd_5_convertState' / '$scratch'
 528:    let var '$scratch' := '$scratch' * '$charToUart'
 529:    let var '$fmtd_5_convertState' := '$fmtd_5_convertState' - '$scratch'
 530:    let var '$scratch' := 48
 531:    let var '$charToUart' := '$charToUart' + '$scratch'
 532:}
 533:let var '$scratch' := 8
 534:if '$scratch' == '$seqScratch' {
 535:    let var '$charToUart' := 255
 536:}
 537:let var '$scratch' := 9
 538:if '$scratch' == '$seqScratch' {
 539:    let var '$charToUart' := 255
 540:}
 541:let var '$scratch' := 10
 542:if '$scratch' == '$seqScratch' {
 543:    let var '$charToUart' := 255
 544:}
 545:if '$seqScratch' < '0' {
 546:} else {
 547:    if '$fmtd_7_doSend' {
 548:        uart send from '$charToUart[+0]'
 549:        increment '$fmtd_4_seq'
 550:    }
 551:}
 552:clear bit '$parThis_5'
 553:if '$fmtd_4_seq' < '11' {
 554:    if '$fmtd_7_doSend' {
 555:        set bit '$parThis_5'
 556:    }
 557:} else {
 558:    clear bit '$fmtd_7_doSend'
 559:}
 561:# ] finish series
 562:if '$parThis_5' {
 563:    set bit '$parOut_2'
 564:}
 565:let bit '$parThis_5' := '$rung_top'
 566:# start series [
 567:# ELEM_GEQ
 568:if '$parThis_5' {
 569:    if 'Valor' < '10' {
 570:        clear bit '$parThis_5'
 571:    }
 572:}
 574:# ELEM_FORMATTED_STRING
 575:if '$parThis_5' {
 576:    if not '$once_4_FMTD_STR' {
 577:        set bit '$once_4_FMTD_STR'
 578:        let var '$fmtd_8_seq' := 0
 579:        set bit '$fmtd_b_doSend'
 580:    }
 581:} else {
 582:    clear bit '$once_4_FMTD_STR'
 583:}
 584:let var '$seqScratch' := '$fmtd_8_seq'
 585:if '$fmtd_8_seq' < '12' {
 586:} else {
 587:    let var '$seqScratch' := -1
 588:}
 589:if '$fmtd_b_doSend' {
 590:    clear bit '$scratch'
 591:    '$scratch' = is uart ready to send ?
 592:    if not '$scratch' {
 593:        let var '$seqScratch' := -1
 594:    }
 595:}
 596:let var '$scratch' := 0
 597:if '$scratch' == '$seqScratch' {
 598:    let var '$charToUart' := 110
 599:}
 600:let var '$scratch' := 1
 601:if '$scratch' == '$seqScratch' {
 602:    let var '$charToUart' := 48
 603:}
 604:let var '$scratch' := 2
 605:if '$scratch' == '$seqScratch' {
 606:    let var '$charToUart' := 46
 607:}
 608:let var '$scratch' := 3
 609:if '$scratch' == '$seqScratch' {
 610:    let var '$charToUart' := 118
 611:}
 612:let var '$scratch' := 4
 613:if '$scratch' == '$seqScratch' {
 614:    let var '$charToUart' := 97
 615:}
 616:let var '$scratch' := 5
 617:if '$scratch' == '$seqScratch' {
 618:    let var '$charToUart' := 108
 619:}
 620:let var '$scratch' := 6
 621:if '$scratch' == '$seqScratch' {
 622:    let var '$charToUart' := 61
 623:}
 624:let var '$scratch' := 7
 625:clear bit '$scratch'
 626:if '$scratch' == '$seqScratch' {
 627:    set bit '$scratch'
 628:}
 629:if '$scratch' {
 630:    let var '$fmtd_9_convertState' := 'Valor'
 631:    set bit '$fmtd_a_isLeadingZero'
 632:    let var '$scratch' := 10
 633:    let var '$charToUart' := '$fmtd_9_convertState' / '$scratch'
 634:    let var '$scratch' := '$scratch' * '$charToUart'
 635:    let var '$fmtd_9_convertState' := '$fmtd_9_convertState' - '$scratch'
 636:    let var '$scratch' := 48
 637:    let var '$charToUart' := '$charToUart' + '$scratch'
 638:    if '$scratch' == '$charToUart' {
 639:        if '$fmtd_a_isLeadingZero' {
 640:            let var '$charToUart' := 32
 641:        }
 642:    } else {
 643:        clear bit '$fmtd_a_isLeadingZero'
 644:    }
 645:}
 646:let var '$scratch' := 8
 647:clear bit '$scratch'
 648:if '$scratch' == '$seqScratch' {
 649:    set bit '$scratch'
 650:}
 651:if '$scratch' {
 652:    let var '$scratch' := 1
 653:    let var '$charToUart' := '$fmtd_9_convertState' / '$scratch'
 654:    let var '$scratch' := '$scratch' * '$charToUart'
 655:    let var '$fmtd_9_convertState' := '$fmtd_9_convertState' - '$scratch'
 656:    let var '$scratch' := 48
 657:    let var '$charToUart' := '$charToUart' + '$scratch'
 658:}
 659:let var '$scratch' := 9
 660:if '$scratch' == '$seqScratch' {
 661:    let var '$charToUart' := 255
 662:}
 663:let var '$scratch' := 10
 664:if '$scratch' == '$seqScratch' {
 665:    let var '$charToUart' := 255
 666:}
 667:let var '$scratch' := 11
 668:if '$scratch' == '$seqScratch' {
 669:    let var '$charToUart' := 255
 670:}
 671:if '$seqScratch' < '0' {
 672:} else {
 673:    if '$fmtd_b_doSend' {
 674:        uart send from '$charToUart[+0]'
 675:        increment '$fmtd_8_seq'
 676:    }
 677:}
 678:clear bit '$parThis_5'
 679:if '$fmtd_8_seq' < '12' {
 680:    if '$fmtd_b_doSend' {
 681:        set bit '$parThis_5'
 682:    }
 683:} else {
 684:    clear bit '$fmtd_b_doSend'
 685:}
 687:# ] finish series
 688:if '$parThis_5' {
 689:    set bit '$parOut_2'
 690:}
 691:let bit '$rung_top' := '$parOut_2'
 692:# ] finish parallel
 693:# ] finish series
 694:# 
 695:# ======= START RUNG 11 =======
 696:LabelRung11:
 697:
 698:set bit '$rung_top'
 700:# start series [
 701:# ELEM_EQU
 702:if '$rung_top' {
 703:    if 'char' != ''0'' {
 704:        clear bit '$rung_top'
 705:    }
 706:}
 708:# ELEM_COIL
 709:if '$rung_top' {
 710:    set bit 'Yc0'
 711:}
 713:# ] finish series
 714:# 
 715:# ======= START RUNG 12 =======
 716:LabelRung12:
 717:
 718:set bit '$rung_top'
 720:# start series [
 721:# ELEM_EQU
 722:if '$rung_top' {
 723:    if 'char' != ''1'' {
 724:        clear bit '$rung_top'
 725:    }
 726:}
 728:# ELEM_COIL
 729:if '$rung_top' {
 730:    clear bit 'Yc0'
 731:}
 733:# ] finish series
 734:LabelRung13:
 735:
 736:# Latest INT_OP here
