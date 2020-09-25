﻿# Определение персонажей игры.
define s = Character('Санёк', color="#7786A9")
define n = Character('Некита', color="#AC8435")
define b = Character('Бох Чёрных Чирипов', color="#666666")
define r = Character('Рустем', color="#AC3535")
define l = Character('Лёха', color="#2A892A")

# Музыка
define audio.menu = "audio/menu.mp3"

# Определение переменных
define cycle_number = 0
define pockets_checked = False  # Игрок проверил карманы?


# Сплэш перед игрой
label splashscreen:
    show text "SavaOwO" with dissolve
    pause 1
    return
# Игра начинается здесь:
label start:

    scene bg sqiland

    s "Ах!{w=0.1} Моя лодка разбилась!{w=0.1} И что мне делать?{w=0.1} Совершенно не представляю..."
    s "Моя лодка горит...{w=0.5} Горит моя лодка..."
    s "Я плыл по..{w=0.1} на острове..."
    s "Блииииин...{w=0.2} Ну я плыл, в общем, на острове...{w=0.5} Ах. И моя лодка начала гореть!"
    menu:
        s "И я не знаю, что мне делать.{w=0.1} Я попал на какой-то необитаемый остров, тут всё квадратное"
        "Проверить карманы":
            $ pockets_checked = True
            jump check_pockets
        "Осмотреть остров":
            jump inspect_sqiland
    return


label check_pockets:
    s "Надо посмотреть, что же есть у меня в карманах.. Не завалялась ли у меня бутылочка воды? Я же не хочу обезвожиться на этом пустынном острове.."
    s "Какое счастье! Какая удача! У меня есть водица, которую мне дал мой друг, который плыл на острове со мной."
    s "Но где же он? Может, его выкинуло этим ужасным штормом в глубь острова?"
label inspect_sqiland:
    s "Надо осмотреться!"
    call screen book('Ya tiba ishu')
    if not pockets_checked:
        s "У меня есть идея, я позову своего друга..."

    s "Ах! Что это!? Что это там такое!?"

    return
