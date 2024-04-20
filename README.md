# ワスレナクエスト

### サービス概要
`ワスレナクエスト`は、お出かけ前の持ち物を忘れないようサポートするエンジョイアプリです。  
冒険に出発する前の気分で、RPG感覚で忘れ物チェックを楽しめます。  
時には仲間と励まし合い、目標達成の喜びを味わいながら、忘れ物を撲滅していくのが目的です。  

### このサービスへの思い・作りたい理由
「忘れたくて忘れてるんじゃない」  
「肝心な時に肝心なものを忘れてしまう…」  
「リマインドが永遠にリマインドされない」  
私は忘れ物・ことがとても多いです。特に出かける前の持ち物をよく忘れます。  
買い物に行くのに財布を忘れ、車に乗るのに鍵を忘れ、コンサートに行くのにチケットを忘れ(!)  
世の中に数多の素晴らしい忘れ防止サービス・アプリがあるのは知っていますが  
なかなか続かない、、、ソシャゲを毎日するのは忘れないのに、、、  
それならゲームと組み合わせて、楽しく忘れ物チェックができる  
アプリを作りたいな、と思ったのが理由です。  

### ユーザー層について
・忘れ物が多い方：忘れ物を撲滅するための手段として役立てます。  
・ゲーム好きな方：ソーシャルゲーム感覚で良い習慣作りにチャレンジしていただけます。  
・日々の自分に達成感が欲しい方：「ちゃんと確認する!」という習慣を  
毎日することで小さくても確実な達成感を獲得できます。  
これらのニーズに沿って本アプリを設計します。

### サービスの利用イメージ
毎日やることは「出かける前の持ち物・確認ごとチェック」だけ  
毎日やればステージがレベルアップし、目標達成すれば予め決めておいた「自分だけのご褒美」も！  
小さな積み重ねで楽しく忘れ物をなくし、ご褒美までゲットできるようなじぶんになれる！  

- 達成のご褒美として、`たからばこのなかみ`を期間ごとに設定します
- `たからばこのなかみ`
  - 3日達成：好きなコンビニスイーツを買おう/ ちょっと高いお酒を買おう etc
  - 3週間：ちょっと良いレストランに行こう/気になる場所に行ってみよう etc
  - 3ヶ月：プチ旅行に行こう・新しいガジェットを買おう etc
  - いくつかの選択肢から３つ選択します(自分で設定することも可能にします)
- 毎日のチェックリストを`ぼうけんのしょ`として作成します。
- `ぼうけんのしょ`の項目
   - 期間(3日・3週間・3ヶ月)
   - 忘れ物チェックリスト(財布・鍵・etc..「部屋の電気を消す」「本を少し読む」などの「行動」でもOK)
- あとは毎日おでかけ前にアプリを開いて、`ぼうけんのしょ`を開き忘れ物をチェックします。
- チェック完了したらやることはもうなし！ぼうけんに出かけましょう！
- 指定した期間連続でチェックを達成すると、`たからばこ`を発見して開くことができます
  - `たからばこのなかみ`はあらかじめ選択or設定した３つのうち一つからランダムとなります。
- 達成済みの`ぼうけんのしょ`は`ぼうけんのきろく`として保管されていきます。

### ユーザーの獲得について
・サインアップなし・ゲストユーザでの体験(期間：3日設定のみ)

### サービスの差別化ポイント・推しポイント
リマインダー・タスク管理アプリは各種ありますが、  
そちらと本アプリの差別化要素は「可能な限りシンプルかつ楽しく」です。  
忘れ物が多い方にとって忘れ物をなくす・きちんとチェックすることは  
非常にハードルが高いことで、当たり前の週間ではありません。  
シンプルなチェックを達成して、たからばこのなかみ＝自分だけのご褒美をしてOKとすることで、  
楽しく続けやすい設計にします。

### 機能候補
＜MVPリリース＞
- 認証ログイン機能
- アワード設定機能
- チェックリスト作成機能
- チェック記録機能
- 達成記録保存機能

＜本リリース＞
- ゲストユーザー機能
- LINE通知機能(プッシュ通知)
- 気象情報機能
  
 ### 機能の実装方針予定
- バックエンド : Ruby / Rails
- フロントエンド :  JavaScript
- CSSフレームワーク: Tailwind CSS 
- インフラ : Heroku
- 環境構築 : Docker
- 認証ログイン機能：Deveise
- LINE通知機能(プッシュ通知)：LINE Developers/Messaging API
- 気象情報機能：OpenWeatherMap API

### 画面遷移図
Figma：https://www.figma.com/file/VvqYp0yWVUoXyeB0GvZdfy/DontForgetQuest-%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?type=design&node-id=30%3A21&mode=design&t=zJcHfA1GkchU00QK-1

### ER図
Figma:https://www.figma.com/file/G7tRTYqodpw6rnCm7YVaTy/DontForgetQuest-ER%E5%9B%B3?type=design&node-id=0%3A1&mode=design&t=goe8vVhypCldXWjj-1