<div align="center">
  <img src="https://lithiumhammer.wordpress.com/wp-content/uploads/2018/10/tumblr_p4q6s0bdmv1si01xjo1_500.gif">
</div>

<h1 align=center>Проекты с курса "Hacking With Swift"</h1>
<p align="center">Приветик! В этом репозитории хранятся все мои проекты, созданные на бесплатном курсе <a href="https://www.hackingwithswift.com/100">Hacking With Swift - 100 days of Swift</a>. Можете черплать отсюда вдохновение, смотреть, как я сделала дополтнительные задания или, возможно, вовсе попробовала иной подход!</p>

<h2 align="center">Установка и локальный запуск</h2>
<p align="center">
  Откройте терминал и склонируйте репозиторий:
</p>

  ```bash
  git clone https://github.com/t-anastasiia/Hacking-With-Swift.git
  ```
<p align="center">
  Перейдите в папку со скопированным репозиторием и интересующем вас проекта, например для Project1 это будет выглядеть так:
</p>

  ```bash
  cd Hacking-With-Swift/Project1
  ```
<p align="center">
  Запустите приложение:
</p>

  ```bash
  open Project1.xcodeproj
  ```

<h2 align="center"><a href=https://github.com/t-anastasiia/Hacking-With-Swift/tree/main/Project1>Проект №1</a></h2>
<p align="center">Первое приложение представляет собой TableViewController, в котором можно просматривать фото котиков (изначально в курсе был Storm Viewer, но мне показалось это сликшом скучным).</p>

<h2 align="center">Работа приложения</h2>
<ol type="1" align="left">
  <li>При запуске приложения появляется окно загрузки, где на белом экране написано finding cutest cats(скриншот 1)</li>
  <li>Когда приложение полностью прогружается, появляется начальный экран, состоящий из TableViewController, где можно выбрать изображение, хранящееся в папке "Сontents"(скриншот 2, 3)</li>
  <li>При нажатии на какую-либо опцию, открывается окно с прикрепленной к данной ячейке картинкой котика. При нажатии на экран, пропадает кнопка выхода и название изображения (реализовано с помощью navigationController?.hidesBarsOnTap)(скриншот 4-6)</li>
</ol>

<h2 align="center">Скриншоты</h2>
<div align="center">
  <img src="https://github.com/t-anastasiia/Hacking-With-Swift/assets/121961781/c3ffa3cc-6869-4248-bf40-61af116c51f8" width="118" height="255">
  <img src="https://github.com/t-anastasiia/Hacking-With-Swift/assets/121961781/27d3844c-cb99-449e-9077-46ffb795a4f1" width="118" height="255">
  <img src="https://github.com/t-anastasiia/Hacking-With-Swift/assets/121961781/37219cb2-3bc8-4869-bf16-af947f699d75" width="118" height="255">
  <img src="https://github.com/t-anastasiia/Hacking-With-Swift/assets/121961781/d1d390bb-9a0e-44a5-abc1-150bf5ed1967" width="118" height="255">
  <img src="https://github.com/t-anastasiia/Hacking-With-Swift/assets/121961781/bc15bc97-165f-4f56-964f-d22c56a4321e" width="118" height="255">
  <img src="https://github.com/t-anastasiia/Hacking-With-Swift/assets/121961781/d7cdcaf4-1832-40da-bee0-3ce03b214fdd" width="118" height="255">
</div>
  
<p align="center">изображения котиков взяты с <a href="https://www.freepik.com/">Freep!k</a> и <a href="https://unsplash.com/images/animals/cat">Unsplash</a></p>
