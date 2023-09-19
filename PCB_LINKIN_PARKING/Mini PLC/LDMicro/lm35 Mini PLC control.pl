   0:# INIT TABLES
   1:INIT TABLE signed 1 byte char7seg[129] := {63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 119, 124, 57, 94, 121, 113, 191, 134, 219, 207, 230, 237, 253, 135, 255, 239, 247, 252, 185, 222, 249, 241, 0, 176, 34, 78, 109, 210, 218, 32, 57, 15, 114, 112, 12, 64, 128, 82, 63, 6, 91, 79, 102, 109, 125, 7, 127, 111, 9, 13, 97, 65, 67, 211, 159, 119, 124, 57, 94, 121, 113, 61, 116, 48, 30, 117, 56, 85, 84, 92, 115, 103, 51, 109, 120, 62, 28, 106, 118, 110, 91, 57, 100, 15, 35, 8, 32, 95, 124, 88, 94, 123, 113, 111, 116, 16, 14, 117, 24, 85, 84, 92, 115, 103, 80, 109, 120, 62, 28, 106, 118, 110, 91, 57, 48, 15, 1, 0, 99}
   2:# INIT TABLE: signed 0 bit char7seg[129] see above
   3:# INIT VARS
   4:if not '$once_0_INIT_VARS' {
   5:    set bit '$once_0_INIT_VARS'
   6:    let var 'Ccount3' := 0
   7:}
  29:# 
  30:# ======= START RUNG 1 =======
  31:LabelRung1:
  32:
  33:set bit '$rung_top'
  35:# start series [
  36:# start parallel [
  37:# ELEM_MOVE
  38:if '$rung_top' {
  39:    let var '#TRISD' := 0
  40:}
  42:# ELEM_MOVE
  43:if '$rung_top' {
  44:    let var '#TRISE' := 0
  45:}
  47:# ] finish parallel
  48:# ] finish series
  49:# 
  50:# ======= START RUNG 2 =======
  51:LabelRung2:
  52:
  53:set bit '$rung_top'
  55:# start series [
  56:# ELEM_TCY T5m 5000
  57:if '$rung_top' {
  58:    if 'T5m' < '1' {
  59:        increment 'T5m'
  60:    } else {
  61:        let var 'T5m' := 0
  62:        if not '$once_1_TCY_T5m' {
  63:            set bit '$once_1_TCY_T5m'
  64:        } else {
  65:            clear bit '$once_1_TCY_T5m'
  66:        }
  67:    }
  68:    if not '$once_1_TCY_T5m' {
  69:        clear bit '$rung_top'
  70:    }
  71:} else {
  72:    let var 'T5m' := 0
  73:}
  75:# ELEM_COIL
  76:let bit 'RDigito' := '$rung_top'
  78:# ] finish series
  79:# 
  80:# ======= START RUNG 3 =======
  81:LabelRung3:
  82:
  83:set bit '$rung_top'
  85:# start series [
  86:# ELEM_READ_ADC
  87:if '$rung_top' {
  88:    read adc 'AAN0', refs is '0'
  89:}
  91:# ] finish series
  92:# 
  93:# ======= START RUNG 4 =======
  94:LabelRung4:
  95:
  96:set bit '$rung_top'
  98:# start series [
  99:# ELEM_READ_ADC
 100:if '$rung_top' {
 101:    read adc 'AAN2', refs is '0'
 102:}
 104:# ] finish series
 105:# 
 106:# ======= START RUNG 5 =======
 107:LabelRung5:
 108:
 109:set bit '$rung_top'
 111:# start series [
 112:# ELEM_TCY T1s 1000000
 113:if '$rung_top' {
 114:    if 'T1s' < '200' {
 115:        increment 'T1s'
 116:    } else {
 117:        let var 'T1s' := 0
 118:        if not '$once_2_TCY_T1s' {
 119:            set bit '$once_2_TCY_T1s'
 120:        } else {
 121:            clear bit '$once_2_TCY_T1s'
 122:        }
 123:    }
 124:    if not '$once_2_TCY_T1s' {
 125:        clear bit '$rung_top'
 126:    }
 127:} else {
 128:    let var 'T1s' := 0
 129:}
 131:# ELEM_CTU
 132:if '$rung_top' {
 133:    if not '$once_3_CTU_Ccount3' {
 134:        set bit '$once_3_CTU_Ccount3'
 135:        if 'Ccount3' < '3' {
 136:            increment 'Ccount3'
 137:        }
 138:    }
 139:} else {
 140:    clear bit '$once_3_CTU_Ccount3'
 141:}
 142:if 'Ccount3' < '3' {
 143:    clear bit '$rung_top'
 144:} else {
 145:    set bit '$rung_top'
 146:}
 148:# start parallel [
 149:let bit '$parThis_0' := '$rung_top'
 150:# ELEM_COIL
 151:let bit 'R3s' := '$parThis_0'
 153:# ELEM_RES
 154:if '$rung_top' {
 155:    let var 'Ccount3' := 0
 156:}
 158:# ] finish parallel
 159:# ] finish series
 160:# 
 161:# ======= START RUNG 6 =======
 162:LabelRung6:
 163:
 164:set bit '$rung_top'
 166:# start series [
 167:# ELEM_PIECEWISE_LINEAR
 168:if '$rung_top' {
 169:    # PWL 2
 170:    clear bit '$scratch'
 171:    if 'AAN2' < '381' {
 172:        set bit '$scratch'
 173:    }
 174:    if '$scratch' {
 175:        let var 'Temp' := 'AAN2' - '190'
 176:        let var 'Temp' := 'Temp' * '75'
 177:        let var 'Temp' := 'Temp' / '190'
 178:        let var 'Temp' := 'Temp' + '75'
 179:    }
 180:    # PWL 1
 181:    clear bit '$scratch'
 182:    if 'AAN2' < '191' {
 183:        set bit '$scratch'
 184:    }
 185:    if '$scratch' {
 186:        let var 'Temp' := 'AAN2' - '0'
 187:        let var 'Temp' := 'Temp' * '75'
 188:        let var 'Temp' := 'Temp' / '190'
 189:        let var 'Temp' := 'Temp' + '0'
 190:    }
 191:}
 193:# ] finish series
 194:# 
 195:# ======= START RUNG 7 =======
 196:LabelRung7:
 197:
 198:set bit '$rung_top'
 200:# start series [
 201:# ELEM_PIECEWISE_LINEAR
 202:if '$rung_top' {
 203:    # PWL 2
 204:    clear bit '$scratch'
 205:    if 'AAN0' < '1024' {
 206:        set bit '$scratch'
 207:    }
 208:    if '$scratch' {
 209:        let var 'Setup' := 'AAN0' - '511'
 210:        let var 'Setup' := 'Setup' * '49'
 211:        let var 'Setup' := 'Setup' / '512'
 212:        let var 'Setup' := 'Setup' + '50'
 213:    }
 214:    # PWL 1
 215:    clear bit '$scratch'
 216:    if 'AAN0' < '512' {
 217:        set bit '$scratch'
 218:    }
 219:    if '$scratch' {
 220:        let var 'Setup' := 'AAN0' - '0'
 221:        let var 'Setup' := 'Setup' * '50'
 222:        let var 'Setup' := 'Setup' / '511'
 223:        let var 'Setup' := 'Setup' + '0'
 224:    }
 225:}
 227:# ] finish series
 228:# 
 229:# ======= START RUNG 8 =======
 230:LabelRung8:
 231:
 232:set bit '$rung_top'
 234:# start series [
 235:# ELEM_CONTACTS
 236:if not 'R3s' {
 237:    clear bit '$rung_top'
 238:}
 240:# ELEM_CONTACTS
 241:if 'Xb4' {
 242:    clear bit '$rung_top'
 243:}
 245:# start parallel [
 246:# ELEM_DIV
 247:if '$rung_top' {
 248:    let var '$scratch2' := 10
 249:    let var 'Dezena' := 'Temp' / '$scratch2'
 250:}
 252:# ELEM_MOD
 253:if '$rung_top' {
 254:    let var '$scratch2' := 10
 255:    let var 'Unidade' := 'Temp' % '$scratch2'
 256:}
 258:# ] finish parallel
 259:# ] finish series
 260:# 
 261:# ======= START RUNG 9 =======
 262:LabelRung9:
 263:
 264:set bit '$rung_top'
 266:# start series [
 267:# ELEM_CONTACTS
 268:if not 'Xb4' {
 269:    clear bit '$rung_top'
 270:}
 272:# start parallel [
 273:# ELEM_DIV
 274:if '$rung_top' {
 275:    let var '$scratch2' := 10
 276:    let var 'Dezena' := 'Setup' / '$scratch2'
 277:}
 279:# ELEM_MOD
 280:if '$rung_top' {
 281:    let var '$scratch2' := 10
 282:    let var 'Unidade' := 'Setup' % '$scratch2'
 283:}
 285:# ] finish parallel
 286:# ] finish series
 287:# 
 288:# ======= START RUNG 10 =======
 289:LabelRung10:
 290:
 291:set bit '$rung_top'
 293:# start series [
 294:# ELEM_CONTACTS
 295:if 'RDigito' {
 296:    clear bit '$rung_top'
 297:}
 299:# ELEM_7SEG
 300:if '$rung_top' {
 301:    let var '$scratch' := 176
 302:    if 'Dezena' == '$scratch' {
 303:        let var 'Dezena' := 128
 304:    } else {
 305:        if 'Dezena' < '0' {
 306:            let var 'Dezena' := 32
 307:        } else {
 308:            if 'Dezena' < '129' {
 309:            } else {
 310:                let var 'Dezena' := 32
 311:            }
 312:        }
 313:    }
 314:    let var '$scratch' := 'char7seg[Dezena]'
 315:    let var '$scratch' := ~ '$scratch'
 316:    let var '#PORTD' := '$scratch'
 317:}
 319:# start parallel [
 320:let bit '$parThis_1' := '$rung_top'
 321:# ELEM_COIL
 322:if '$parThis_1' {
 323:    clear bit 'Ye0'
 324:} else {
 325:    set bit 'Ye0'
 326:}
 328:let bit '$parThis_1' := '$rung_top'
 329:# ELEM_COIL
 330:let bit 'Ye0' := '$parThis_1'
 332:# ] finish parallel
 333:# ] finish series
 334:# 
 335:# ======= START RUNG 11 =======
 336:LabelRung11:
 337:
 338:set bit '$rung_top'
 340:# start series [
 341:# ELEM_CONTACTS
 342:if not 'RDigito' {
 343:    clear bit '$rung_top'
 344:}
 346:# ELEM_7SEG
 347:if '$rung_top' {
 348:    let var '$scratch' := 176
 349:    if 'Unidade' == '$scratch' {
 350:        let var 'Unidade' := 128
 351:    } else {
 352:        if 'Unidade' < '0' {
 353:            let var 'Unidade' := 32
 354:        } else {
 355:            if 'Unidade' < '129' {
 356:            } else {
 357:                let var 'Unidade' := 32
 358:            }
 359:        }
 360:    }
 361:    let var '$scratch' := 'char7seg[Unidade]'
 362:    let var '$scratch' := ~ '$scratch'
 363:    let var '#PORTD' := '$scratch'
 364:}
 366:# start parallel [
 367:let bit '$parThis_2' := '$rung_top'
 368:# ELEM_COIL
 369:if '$parThis_2' {
 370:    clear bit 'Ye1'
 371:} else {
 372:    set bit 'Ye1'
 373:}
 375:let bit '$parThis_2' := '$rung_top'
 376:# ELEM_COIL
 377:let bit 'Ye1' := '$parThis_2'
 379:# ] finish parallel
 380:# ] finish series
 381:# 
 382:# ======= START RUNG 12 =======
 383:LabelRung12:
 384:
 385:set bit '$rung_top'
 387:# start series [
 388:# ELEM_LES
 389:if '$rung_top' {
 390:    if 'Temp' >= 'Setup' {
 391:        clear bit '$rung_top'
 392:    }
 393:}
 395:# ELEM_TON TTon5s1 2000000
 396:if '$rung_top' {
 397:    if 'TTon5s1' < '400' {
 398:        clear bit '$rung_top'
 399:        increment 'TTon5s1'
 400:    }
 401:} else {
 402:    let var 'TTon5s1' := 0
 403:}
 405:# start parallel [
 406:let bit '$parThis_3' := '$rung_top'
 407:# ELEM_COIL
 408:if '$parThis_3' {
 409:    set bit 'Yc0'
 410:}
 412:let bit '$parThis_3' := '$rung_top'
 413:# ELEM_COIL
 414:if '$parThis_3' {
 415:    set bit 'Ye2'
 416:}
 418:let bit '$parThis_3' := '$rung_top'
 419:# ELEM_COIL
 420:if '$parThis_3' {
 421:    set bit 'Ya5'
 422:}
 424:let bit '$parThis_3' := '$rung_top'
 425:# ELEM_COIL
 426:if '$parThis_3' {
 427:    set bit 'Yc2'
 428:}
 430:# ] finish parallel
 431:# ] finish series
 432:# 
 433:# ======= START RUNG 13 =======
 434:LabelRung13:
 435:
 436:set bit '$rung_top'
 438:# start series [
 439:# ELEM_ADD
 440:if '$rung_top' {
 441:    let var 'Control' := 'Temp' + '1'; copy overflow flag to '$overlap'
 442:}
 444:# ] finish series
 445:# 
 446:# ======= START RUNG 14 =======
 447:LabelRung14:
 448:
 449:set bit '$rung_top'
 451:# start series [
 452:# ELEM_GRT
 453:if '$rung_top' {
 454:    if 'Control' <= 'Setup' {
 455:        clear bit '$rung_top'
 456:    }
 457:}
 459:# ELEM_TON TTon5s 2000000
 460:if '$rung_top' {
 461:    if 'TTon5s' < '400' {
 462:        clear bit '$rung_top'
 463:        increment 'TTon5s'
 464:    }
 465:} else {
 466:    let var 'TTon5s' := 0
 467:}
 469:# start parallel [
 470:let bit '$parThis_4' := '$rung_top'
 471:# ELEM_COIL
 472:if '$parThis_4' {
 473:    clear bit 'Yc0'
 474:}
 476:let bit '$parThis_4' := '$rung_top'
 477:# ELEM_COIL
 478:if '$parThis_4' {
 479:    clear bit 'Ye2'
 480:}
 482:let bit '$parThis_4' := '$rung_top'
 483:# ELEM_COIL
 484:if '$parThis_4' {
 485:    clear bit 'Ya5'
 486:}
 488:let bit '$parThis_4' := '$rung_top'
 489:# ELEM_COIL
 490:if '$parThis_4' {
 491:    clear bit 'Yc2'
 492:}
 494:# ] finish parallel
 495:# ] finish series
 496:# 
 497:# ======= START RUNG 15 =======
 498:LabelRung15:
 499:
 500:set bit '$rung_top'
 502:# start series [
 503:# ELEM_UART_RECV_AVAIL
 504:if '$rung_top' {
 505:    '$rung_top' = is uart receive data available ?
 506:}
 508:# ELEM_UART_RECV
 509:if '$rung_top' {
 510:    '$rung_top' = is uart receive data available ?
 511:    if '$rung_top' {
 512:        let var 'char' := 0
 513:        uart recv into 'char[+0]'
 514:    }
 515:}
 517:# ] finish series
 518:# 
 519:# ======= START RUNG 16 =======
 520:LabelRung16:
 521:
 522:set bit '$rung_top'
 524:# start series [
 525:# ELEM_CONTACTS
 526:if not 'R3s' {
 527:    clear bit '$rung_top'
 528:}
 530:# start parallel [
 531:clear bit '$parOut_0'
 532:let bit '$parThis_5' := '$rung_top'
 533:# start series [
 534:# ELEM_LEQ
 535:if '$parThis_5' {
 536:    if 'Temp' > '9' {
 537:        clear bit '$parThis_5'
 538:    }
 539:}
 541:# ELEM_FORMATTED_STRING
 542:if '$parThis_5' {
 543:    if not '$once_4_FMTD_STR' {
 544:        set bit '$once_4_FMTD_STR'
 545:        let var '$fmtd_0_seq' := 0
 546:        set bit '$fmtd_3_doSend'
 547:    }
 548:} else {
 549:    clear bit '$once_4_FMTD_STR'
 550:}
 551:let var '$seqScratch' := '$fmtd_0_seq'
 552:if '$fmtd_0_seq' < '11' {
 553:} else {
 554:    let var '$seqScratch' := -1
 555:}
 556:if '$fmtd_3_doSend' {
 557:    clear bit '$scratch'
 558:    '$scratch' = is uart ready to send ?
 559:    if not '$scratch' {
 560:        let var '$seqScratch' := -1
 561:    }
 562:}
 563:let var '$scratch' := 0
 564:if '$scratch' == '$seqScratch' {
 565:    let var '$charToUart' := 110
 566:}
 567:let var '$scratch' := 1
 568:if '$scratch' == '$seqScratch' {
 569:    let var '$charToUart' := 48
 570:}
 571:let var '$scratch' := 2
 572:if '$scratch' == '$seqScratch' {
 573:    let var '$charToUart' := 46
 574:}
 575:let var '$scratch' := 3
 576:if '$scratch' == '$seqScratch' {
 577:    let var '$charToUart' := 118
 578:}
 579:let var '$scratch' := 4
 580:if '$scratch' == '$seqScratch' {
 581:    let var '$charToUart' := 97
 582:}
 583:let var '$scratch' := 5
 584:if '$scratch' == '$seqScratch' {
 585:    let var '$charToUart' := 108
 586:}
 587:let var '$scratch' := 6
 588:if '$scratch' == '$seqScratch' {
 589:    let var '$charToUart' := 61
 590:}
 591:let var '$scratch' := 7
 592:clear bit '$scratch'
 593:if '$scratch' == '$seqScratch' {
 594:    set bit '$scratch'
 595:}
 596:if '$scratch' {
 597:    let var '$fmtd_1_convertState' := 'Temp'
 598:    set bit '$fmtd_2_isLeadingZero'
 599:    let var '$scratch' := 1
 600:    let var '$charToUart' := '$fmtd_1_convertState' / '$scratch'
 601:    let var '$scratch' := '$scratch' * '$charToUart'
 602:    let var '$fmtd_1_convertState' := '$fmtd_1_convertState' - '$scratch'
 603:    let var '$scratch' := 48
 604:    let var '$charToUart' := '$charToUart' + '$scratch'
 605:}
 606:let var '$scratch' := 8
 607:if '$scratch' == '$seqScratch' {
 608:    let var '$charToUart' := 255
 609:}
 610:let var '$scratch' := 9
 611:if '$scratch' == '$seqScratch' {
 612:    let var '$charToUart' := 255
 613:}
 614:let var '$scratch' := 10
 615:if '$scratch' == '$seqScratch' {
 616:    let var '$charToUart' := 255
 617:}
 618:if '$seqScratch' < '0' {
 619:} else {
 620:    if '$fmtd_3_doSend' {
 621:        uart send from '$charToUart[+0]'
 622:        increment '$fmtd_0_seq'
 623:    }
 624:}
 625:clear bit '$parThis_5'
 626:if '$fmtd_0_seq' < '11' {
 627:    if '$fmtd_3_doSend' {
 628:        set bit '$parThis_5'
 629:    }
 630:} else {
 631:    clear bit '$fmtd_3_doSend'
 632:}
 634:# ] finish series
 635:if '$parThis_5' {
 636:    set bit '$parOut_0'
 637:}
 638:let bit '$parThis_5' := '$rung_top'
 639:# start series [
 640:# ELEM_GEQ
 641:if '$parThis_5' {
 642:    if 'Temp' < '10' {
 643:        clear bit '$parThis_5'
 644:    }
 645:}
 647:# ELEM_FORMATTED_STRING
 648:if '$parThis_5' {
 649:    if not '$once_5_FMTD_STR' {
 650:        set bit '$once_5_FMTD_STR'
 651:        let var '$fmtd_4_seq' := 0
 652:        set bit '$fmtd_7_doSend'
 653:    }
 654:} else {
 655:    clear bit '$once_5_FMTD_STR'
 656:}
 657:let var '$seqScratch' := '$fmtd_4_seq'
 658:if '$fmtd_4_seq' < '12' {
 659:} else {
 660:    let var '$seqScratch' := -1
 661:}
 662:if '$fmtd_7_doSend' {
 663:    clear bit '$scratch'
 664:    '$scratch' = is uart ready to send ?
 665:    if not '$scratch' {
 666:        let var '$seqScratch' := -1
 667:    }
 668:}
 669:let var '$scratch' := 0
 670:if '$scratch' == '$seqScratch' {
 671:    let var '$charToUart' := 110
 672:}
 673:let var '$scratch' := 1
 674:if '$scratch' == '$seqScratch' {
 675:    let var '$charToUart' := 48
 676:}
 677:let var '$scratch' := 2
 678:if '$scratch' == '$seqScratch' {
 679:    let var '$charToUart' := 46
 680:}
 681:let var '$scratch' := 3
 682:if '$scratch' == '$seqScratch' {
 683:    let var '$charToUart' := 118
 684:}
 685:let var '$scratch' := 4
 686:if '$scratch' == '$seqScratch' {
 687:    let var '$charToUart' := 97
 688:}
 689:let var '$scratch' := 5
 690:if '$scratch' == '$seqScratch' {
 691:    let var '$charToUart' := 108
 692:}
 693:let var '$scratch' := 6
 694:if '$scratch' == '$seqScratch' {
 695:    let var '$charToUart' := 61
 696:}
 697:let var '$scratch' := 7
 698:clear bit '$scratch'
 699:if '$scratch' == '$seqScratch' {
 700:    set bit '$scratch'
 701:}
 702:if '$scratch' {
 703:    let var '$fmtd_5_convertState' := 'Temp'
 704:    set bit '$fmtd_6_isLeadingZero'
 705:    let var '$scratch' := 10
 706:    let var '$charToUart' := '$fmtd_5_convertState' / '$scratch'
 707:    let var '$scratch' := '$scratch' * '$charToUart'
 708:    let var '$fmtd_5_convertState' := '$fmtd_5_convertState' - '$scratch'
 709:    let var '$scratch' := 48
 710:    let var '$charToUart' := '$charToUart' + '$scratch'
 711:    if '$scratch' == '$charToUart' {
 712:        if '$fmtd_6_isLeadingZero' {
 713:            let var '$charToUart' := 32
 714:        }
 715:    } else {
 716:        clear bit '$fmtd_6_isLeadingZero'
 717:    }
 718:}
 719:let var '$scratch' := 8
 720:clear bit '$scratch'
 721:if '$scratch' == '$seqScratch' {
 722:    set bit '$scratch'
 723:}
 724:if '$scratch' {
 725:    let var '$scratch' := 1
 726:    let var '$charToUart' := '$fmtd_5_convertState' / '$scratch'
 727:    let var '$scratch' := '$scratch' * '$charToUart'
 728:    let var '$fmtd_5_convertState' := '$fmtd_5_convertState' - '$scratch'
 729:    let var '$scratch' := 48
 730:    let var '$charToUart' := '$charToUart' + '$scratch'
 731:}
 732:let var '$scratch' := 9
 733:if '$scratch' == '$seqScratch' {
 734:    let var '$charToUart' := 255
 735:}
 736:let var '$scratch' := 10
 737:if '$scratch' == '$seqScratch' {
 738:    let var '$charToUart' := 255
 739:}
 740:let var '$scratch' := 11
 741:if '$scratch' == '$seqScratch' {
 742:    let var '$charToUart' := 255
 743:}
 744:if '$seqScratch' < '0' {
 745:} else {
 746:    if '$fmtd_7_doSend' {
 747:        uart send from '$charToUart[+0]'
 748:        increment '$fmtd_4_seq'
 749:    }
 750:}
 751:clear bit '$parThis_5'
 752:if '$fmtd_4_seq' < '12' {
 753:    if '$fmtd_7_doSend' {
 754:        set bit '$parThis_5'
 755:    }
 756:} else {
 757:    clear bit '$fmtd_7_doSend'
 758:}
 760:# ] finish series
 761:if '$parThis_5' {
 762:    set bit '$parOut_0'
 763:}
 764:let bit '$rung_top' := '$parOut_0'
 765:# ] finish parallel
 766:# ] finish series
 767:# 
 768:# ======= START RUNG 17 =======
 769:LabelRung17:
 770:
 771:set bit '$rung_top'
 773:# start series [
 774:# ELEM_EQU
 775:if '$rung_top' {
 776:    if 'char' != ''0'' {
 777:        clear bit '$rung_top'
 778:    }
 779:}
 781:# ELEM_COIL
 782:if '$rung_top' {
 783:    set bit 'Yc0'
 784:}
 786:# ] finish series
 787:# 
 788:# ======= START RUNG 18 =======
 789:LabelRung18:
 790:
 791:set bit '$rung_top'
 793:# start series [
 794:# ELEM_EQU
 795:if '$rung_top' {
 796:    if 'char' != ''1'' {
 797:        clear bit '$rung_top'
 798:    }
 799:}
 801:# ELEM_COIL
 802:if '$rung_top' {
 803:    clear bit 'Yc0'
 804:}
 806:# ] finish series
 807:# 
 808:# ======= START RUNG 19 =======
 809:LabelRung19:
 810:
 811:set bit '$rung_top'
 813:# start series [
 814:# ELEM_CONTACTS
 815:if not 'Xb2' {
 816:    clear bit '$rung_top'
 817:}
 819:# ELEM_COIL
 820:if '$rung_top' {
 821:    set bit 'Yc2'
 822:}
 824:# ] finish series
 825:# 
 826:# ======= START RUNG 20 =======
 827:LabelRung20:
 828:
 829:set bit '$rung_top'
 831:# start series [
 832:# ELEM_CONTACTS
 833:if not 'Xb0' {
 834:    clear bit '$rung_top'
 835:}
 837:# ELEM_COIL
 838:if '$rung_top' {
 839:    clear bit 'Yc2'
 840:}
 842:# ] finish series
 843:LabelRung21:
 844:
 845:# Latest INT_OP here
