# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([
  {
    name: "近藤太一",
    user_id: "taichi_kondo",
    email: "a@example.com",
    phone_number: "090-1234-1234",
    password: "password.",
    avatar: Rails.root.join('app/assets/images/avatar/youngman_25.png').open
  },
  {
    name: "田中俊介",
    user_id: "shun.tanaka",
    email: "b@example.com",
    phone_number: "090-7980-7887",
    password: "password.",
    avatar: Rails.root.join('app/assets/images/avatar/golf_jou_man_edit.jpeg').open
  },
  {
    name: "佐藤はな",
    user_id: "flower_sato",
    email: "c@example.com",
    phone_number: "090-6789-6789",
    password: "password."
  },
  {
    name: "小林幸子", 
    user_id: "sachiko_ko", 
    email: "d@example.com", 
    phone_number: "090-1122-2211", 
    password: "password.",
    avatar: Rails.root.join('app/assets/images/avatar/sports_golf_woman.png').open
  },
  {
    name: "山本大輔", 
    user_id: "dai_dai", 
    email: "e@example.com", 
    phone_number: "090-2232-2344", 
    password: "password.",
    avatar: Rails.root.join('app/assets/images/avatar/yaruki_moeru_man.png').open
  },
  {
    name: "小島太郎", 
    user_id: "kojima_dayo", 
    email: "f@example.com", 
    phone_number: "090-3343-4454", 
    password: "password."
  }
])

Relationship.create!([
  {user_id: 1, follower_id: 2}, {user_id: 1, follower_id: 3}, {user_id: 1, follower_id: 4}, {user_id: 1, follower_id: 5}, {user_id: 1, follower_id: 6},
  {user_id: 2, follower_id: 1}, {user_id: 2, follower_id: 4}, {user_id: 2, follower_id: 5}, {user_id: 2, follower_id: 6},
  {user_id: 3, follower_id: 2}, {user_id: 3, follower_id: 4}, {user_id: 3, follower_id: 5}, {user_id: 3, follower_id: 6},
  {user_id: 4, follower_id: 1}, {user_id: 4, follower_id: 2}, {user_id: 4, follower_id: 3}, {user_id: 4, follower_id: 6},
  {user_id: 5, follower_id: 1}, {user_id: 5, follower_id: 2}, {user_id: 5, follower_id: 3},
  {user_id: 6, follower_id: 2}, {user_id: 6, follower_id: 3}, {user_id: 6, follower_id:4}
])


Post.create!([
  {
    content: "examle post1",
    image: Rails.root.join('app/assets/images/post/IMG_1164_2.jpeg').open,
    user_id: 1
  },
  {
    content: "example post2",
    image: Rails.root.join('app/assets/images/post/IMG_2190.jpeg').open,
    user_id: 2
  },
  {
    content: "250ydくらいで広めの練習場だった。崖の上まで届くと300yd！\n待合室は冷房が効いていて快適。",
    image: Rails.root.join('app/assets/images/post/IMG_2139.jpg').open,
    user_id: 1
  },
  {
    content: "example post4",
    user_id: 3,
  },
  {
    content: "example post5",
    user_id: 3
  },
  {
    content: "examle post 6",
    user_id: 2
  }
])

AdminRange.create!([
  { name: "神戸ゴルフ練習場", email: "a@example.com", password: "password." },
  { name: "明石ゴルフ倶楽部", email: "b@example.com", password: "password." },
  { name: "姫路ゴルフ練習場", email: "c@example.com", password: "password." },
  { name: "相生ゴルフ練習場", email: "d@example.com", password: "password." },
  { name: "書写グリーン倶楽部", email: "e@example.com", password: "password." },
  { name: "大塩ゴルフリンクス", email: "f@example.com", password: "password." },
  { name: "相生水上ゴルフセンター", email: "g@example.com", password: "password." },
  { name: "サンランド武庫川ゴルフセンター", email: "h@example.com", password: "password." },
  { name: "網干ゴルフセンター", email: "i@example.com", password: "password." },
  { name: "アスカゴルフ練習場", email: "j@example.com", password: "password." },
  { name: "菊水ゴルフクラブ", email: "k@example.com", password: "password." },
  { name: "グリーンアリーナ神崎", email: "l@example.com", password: "password." },
  { name: "ゴルフクラブ松井", email: "m@example.com", password: "password." },
  { name: "ザ・リンクスゴルフクラブ", email: "n@example.com", password: "password." },
  { name: "チボリゴルフセンター", email: "o@example.com", password: "password." },
  { name: "樫山ゴルフランド", email: "p@example.com", password: "password." },
  { name: "多田ハイグリーンゴルフ", email: "q@example.com", password: "password." },
  { name: "尼崎テクノランド", email: "r@example.com", password: "password." },
  { name: "２号線ゴルフセンター", email: "s@example.com", password: "password." },
  { name: "マスターズゴルフガーデン三木", email: "t@example.com", password: "password." },
  { name: "ニッケゴルフ倶楽部土山センター", email: "u@example.com", password: "password." },
  { name: "高松ゴルフプラザ", email: "v@example.com", password: "password." },
  { name: "市川ゴルフクラブ", email: "w@example.com", password: "password." },
  { name: "アコーディア・ガーデン甲子園浜", email: "x@example.com", password: "password." },
  { name: "タイヨウゴルフインヤシロ", email: "y@example.com", password: "password." },
  { name: "加古川レークセンター", email: "z@example.com", password: "password." },
  { name: "ゴルフクラブ桜池", email: "aa@example.com", password: "password." },
  { name: "但馬ゴルフセンター", email: "bb@example.com", password: "password." },
  { name: "龍野水上ゴルフセンター", email: "cc@example.com", password: "password." },
  { name: "マスターズゴルフガーデン多田院", email: "dd@example.com", password: "password." },
  { name: "才加ゴルフ練習場", email: "ee@example.com", password: "password." },
  { name: "アコーディア・ガーデン加古川", email: "ff@example.com", password: "password." },
  { name: "アコーディア・ガーデン西神", email: "gg@example.com", password: "password." },
  { name: "日高ゴルフ練習場", email: "hh@example.com", password: "password." },
  { name: "南武庫之荘ゴルフセンター", email: "ii@example.com", password: "password." },
  { name: "アーバンゴルフプラザ", email: "jj@example.com", password: "password." },
  { name: "リバレゴルフヴィレッジ", email: "kk@example.com", password: "password." },
])

RangeOutline.create!([
  { city: "神戸市", name: "神戸ゴルフ練習場", features: "駐車場有", link: "www.example.com", address: "兵庫県神戸市中央区99-99", phone_number: "078-123-1234", distance: "250", booths: "70", admin_range_id: 1 },
  { city: "明石市", name: "明石ゴルフ倶楽部", features: "駐車場有", link: "www.example.com", address: "兵庫県明石市11-2", phone_number: "078-123-1234", distance: "200", booths: "70", admin_range_id: 2 },
  { city: "姫路市", name: "姫路ゴルフ練習場", features: "駐車場有", link: "www.example.com", address: "兵庫県姫路市12-3", phone_number: "079-123-1234", distance: "250", booths: "120", admin_range_id: 3 },
  { city: "相生市", name: "相生ゴルフ練習場", features: "駐車場有", link: "www.example.com", address: "兵庫県相生市中央区99-99", phone_number: "0791-23-1234", distance: "270", booths: "90", admin_range_id: 4 },
  { city: "姫路市", name: "書写グリーン倶楽部", features: "200ヤードのたっぷりとしたドライビングレンジ(イーグルレンジ)では奥に行くほどに狭くなり、実際のコースさながらの緊張感が望めます。\nボールの落とし所にも、天然芝を敷き詰めたり、グリーンやクリークを模したりと様々な工夫が施されています。", link: "https://golf.shoshagc.co.jp/", address: "兵庫県姫路市書写634-13", phone_number: "079-266-0082", distance: "200", booths: "74", admin_range_id: 5 },
  { city: "姫路市", name: "大塩ゴルフリンクス", features: "姫路シーサイドGCが隣接し、海が見える景色です。\n駐車場あり（70台）\n天然芝のアプローチ練習場やパター練習場も完備しております。\n隣接した姫路シーサイドゴルフコースへの前後にもお気軽にお立ち寄り下さい。", link: "https://www.ooshio-golflinks.jp/", address: "兵庫県姫路市大塩町2125", phone_number: "079-254-5755", distance: "200", booths: "60", admin_range_id: 6 },
  { city: "たつの市", name: "相生水上ゴルフセンター", features: "ネットに囲まれていない自然の中の練習場!\n奥行き300Yの豪快なショットが楽しめます。", link: "https://aioi-sgc.com/", address: "兵庫県たつの市揖西町土師", phone_number: "0791-66-1015", distance: "300", booths: "30", admin_range_id: 7 },
  { city: "尼崎市", name: "サンランド武庫川ゴルフセンター", features: "300ヤードへフルショット！\n最新のICカードシステムとフルオートティーアップ機を採用し、お客様のゴルフライフをサポート。早朝から深夜まで打ち放題受付中！", link: "https://www.sunland.co.jp/", address: "兵庫県尼崎市平左衛門町20番地", phone_number: "06-6418-7251", distance: "240", booths: "128", admin_range_id: 8 },
  { city: "姫路市", name: "網干ゴルフセンター", features: "30ヤードの快適ゴルフレンジ。ゆったり広々56打席！\n充実設備、抜群の練習環境！\n皆さまのご来場お待ちしております。", link: "http://www.kitazawanet.co.jp/golf/golf-1.htm", address: "兵庫県姫路市網干区浜田816-1", phone_number: "079-273-5620", distance: "230", booths: "56", admin_range_id: 9 },
  { city: "伊丹市", name: "アスカゴルフ練習場", features: "「ゴルフの楽しさ・醍醐味は・・・基本・マナーの修得から！」をモットーに伊丹で約55年。落ち着いた雰囲気の中で集中して練習にお取組み頂けるよう心掛けております", link: "https://asukagolf.com/", address: "兵庫県伊丹市北本町3-146", phone_number: "072-784-3421", distance: "80", booths: "28", admin_range_id: 10 },
  { city: "神戸市", name: "菊水ゴルフクラブ", features: "JR神戸駅から車で約10分。六甲山系の自然の中にある大型ゴルフ練習場。\n250ヤードの打席練習場（140打席）だけでなく、天然芝からアプローチ練習ができるグリーンを有している。スコアアップに直結する実践的な練習ができると、神戸市以外からも多くの来場がある。", link: "https://kikusui-golf.com/", address: "兵庫県神戸市兵庫区烏原町ヌク谷1番地", phone_number: "078-511-3476", distance: "250", booths: "140", admin_range_id: 11 },
  { city: "尼崎市", name: "グリーンアリーナ神崎", features: "打席はフルオートティーアップ機を導入。\n距離とミート率測定器「飛ばしヤード」も全打席に設置。 \n打ちやすい方向へ違和感なく構えられるように、打席の向きの細かいズレやカーペットの貼り方にもこだわりセッティングしました。", link: "http://www.ga-kanzaki.jp/", address: "兵庫県尼崎市戸ノ内町3-15", phone_number: "06-6498-41886", distance: "170", booths: "104", admin_range_id: 12 },
  { city: "西宮市", name: "ゴルフクラブ松井", features: "500円硬貨1枚で最大50球(平日早朝の場合)。30y、50y、70yアプローチの練習に最適の天然芝。\nゴルフ工房もあり、週3回以上午後より修理スタッフ常駐。", link: "http://cvnweb.bai.ne.jp/~matsuico/gcm/index.html", address: "兵庫県西宮市松山町8", phone_number: "0798-67-2449", distance: "110", booths: "24", admin_range_id: 13},
  { city: "明石市", name: "ザ・リンクスゴルフクラブ", features: "各打席に自動ティーアップとヘッドスピード、飛距離測定機を設置。夏は扇風機、冬はストーブを全打席完備しています。", link: "https://www.the-rinksgolf.com/", address: "兵庫県明石市大久保町字大沢2700-4", phone_number: "078-934-4321", distance: "250", booths: "60", admin_range_id: 14},
  { city: "宝塚市", name: "チボリゴルフセンター", features: "川沿いの解放感溢れるチボリゴルフスクール練習場が2015年に完全リニューアル！！\n広々、ゆったり、３００ヤード。３階建１２３打席。１，２階はオートセッター完備。\n親子で打てる親子打席に、キッズルーム、託児サービス、BBQスペースも新設！", link: "https://k-kmg.jp/", address: "兵庫県宝塚市弥生町358", phone_number: "0797-81-1121", distance: "300", booths: "123", admin_range_id: 15 },
  { city: "小野市", name: "樫山ゴルフランド", features: "美しい緑が広がるフェアウェイの中、気持ち良く練習していただけるよう、常にマットは美しい状態でお待ちしております。\n夏にはミスト・スポットクーラー完備で快適に練習ができます。", link: "https://www.kashiyamagolfland.com/", address: "兵庫県小野市樫山町1489-35", phone_number: "0794-62-7460", distance: "250", booths: "70", admin_range_id: 16 },
  { city: "川西市", name: "多田ハイグリーンゴルフ", features: "300ヤード総天然芝、コース球使用", link: "http://www.hi-green.co.jp/golf/index.html",  address: "兵庫県川西市西畦野南山2", phone_number: "072-793-4522", distance: "300", booths: "121", admin_range_id: 17 },
  { city: "尼崎市", name: "尼崎テクノランド", features: "あまテクは、阪神高速湾岸線尼崎末広ICを降りてわずか60秒のゴルフ練習場です。\n関西最大級の開放感あふれる250ヤードのロング＆ワイドなフェアウェイをはじめ、打席数はなんと180打席！\n２０打席のゴルフスクール専用棟も備え、天然芝でのパッティング、多様なライからのアプローチショットやコースを想定したバンカーショットまでゴルフ場さながらの雰囲気で様々なショットの練習ができます。", link: "https://www.amateku.jp/",  address: "兵庫県尼崎市末広町1-2-1", phone_number: "06-6411-7887", distance: "250", booths: "180", admin_range_id: 18},
  { city: "加古川市", name: "２号線ゴルフセンター", features: "２号線ゴルフセンターは兵庫県加古川市の入場料無料・打席料無料のセルフ式水上ゴルフ練習場です。セルフ式だからこそ安く、気軽に練習できます！\nコロナ対策として、お客様の手が触れる箇所を定期的に消毒しています。\n入口通路にダスキンプッシュ型消毒液を設置しています。", link: "http://2gousengolf.sakura.ne.jp/www/",  address: "兵庫県加古川市平岡町山之上1", phone_number: "079-425-5788", distance: "250", booths: "42", admin_range_id: 19 },
  { city: "小野市", name: "マスターズゴルフガーデン三木", features: "関西最大級のスケールを誇る飛距離は300ヤード！\nまるでコースで打っているかのような豪快なショットを楽しめます。", link: "https://www.nobuta123.co.jp/masters/garden-miki/",  address: "兵庫県小野市山田町1451-46", phone_number: "0794-81-1230", distance: "300", booths: "54", admin_range_id: 20 },
  { city: "明石市", name: "ニッケゴルフ倶楽部土山センター", features: "フェアウェー、アプローチ練習場 すべて天然芝で実践的練習が出来ます。\nまたクラブハウス周りも美化を意識して季節ごとの花でお出迎えしています", link: "https://nk-ls.com/center/tsuchiyama",  address: "兵庫県明石市魚住町清水2744", phone_number: "078-941-1200", distance: "200", booths: "60", admin_range_id: 21 },
  { city: "西脇市", name: "高松ゴルフプラザ", features: "水上練習場ではありながら300Y・80打席を完備、ロケーション最高！！\n池に向かってのショットは気分爽快です", link: "http://www.takamatsu-gp.jp/",  address: "兵庫県西脇市高松町635", phone_number: "0795-22-9595", distance: "300", booths: "80", admin_range_id: 22 },
  { city: "市川町", name: "市川ゴルフ", features: "全長220ヤード総天然芝でレンジボールではなく全てラウンド球を使用しており、より実戦に役立つ練習が可能です", link: "http://www.ichikawa-golf.com/access/",  address: "兵庫県神崎郡市川町西田中589", phone_number: "0790-26-1800", distance: "220", booths: "44", admin_range_id: 23 },
  { city: "西宮市", name: "アコーディア・ガーデン甲子園浜", features: "浜風を感じながら海に向かって打つ、開放感いっぱいのロケーション！スクールとプロショップも充実の大型練習場です。", link: "https://www.accordiagolf.com/practice/koshienhama/",  address: "兵庫県西宮市甲子園浜1-7-2", phone_number: "0798-48-8688", distance: "230", booths: "137", admin_range_id: 24 },
  { city: "加東市", name: "タイヨウゴルフインヤシロ", features: "全打席に夏場はスポットクーラー、冬場は電気ストーブ完備。お得な打ち放題平日3時間1,200円、土・日1,400円。女性は1ドリンクサービスで平日1,100円、土・日1,300円で打ち放題です。", link: "http://ww16.taiyogolf.com/?sub1=20220804-1551-1725-9a79-e485e26d5e13",  address: "兵庫県加東市中古瀬417-1", phone_number: "0795-42-6778", distance: "250", booths: "42", admin_range_id: 25 },
  { city: "加古川市", name: "加古川レークセンター", features: "", link: "http://www.lake-kanko.com/practice/kakogawa/",  address: "兵庫県加古川市神野町石守70-2", phone_number: "079-425-0777", distance: "250", booths: "50", admin_range_id: 26 },
  { city: "福崎町", name: "ゴルフクラブ桜池", features: "", link: "",  address: "兵庫県神崎郡福崎町東田原992-1", phone_number: "0790-23-1599", distance: "330", booths: "60", admin_range_id: 27},
  { city: "豊岡市", name: "但馬ゴルフセンター", features: "", link: "",  address: "兵庫県豊岡市九日市上町２３２", phone_number: "0796-23-2370", distance: "250", booths: "20", admin_range_id: 28 },
  { city: "たつの市", name: "龍野水上ゴルフセンター", features: "", link: "",  address: "兵庫県たつの市神岡町大住寺220-9", phone_number: "0791-65-0080", distance: "300", booths: "40", admin_range_id: 29 },
  { city: "", name: "マスターズゴルフガーデン多田院", features: "各打席は幅2.6m、奥行3.5m、通路4.5mのワイドなスペースを確保しました。\n2Fに1打席、パーテーションで区切られたVIP打席(平日90分3,000円、土日祝90分5,000円※ボール代込)。メンバー制度あり(年会費)", link: "https://www.nobuta123.co.jp/masters/garden-tadain/",  address: "兵庫県川西市多田院字上ケ平1番地", phone_number: "072-792-7770", distance: "200", booths: "87", admin_range_id: 30 },
  { city: "姫路市", name: "才加ゴルフ練習場", features: "アプローチ・バンカー場あり、パターグリーンもあり、打ち放題！", link: "https://zuien.net/saika",  address: "兵庫県姫路市香寺町中村807-2", phone_number: "079-232-5157", distance: "300", booths: "80", admin_range_id: 31 },
  { city: "加古川市", name: "アコーディア・ガーデン加古川", features: "", link: "https://www.accordiagolf.com/practice/kakogawa/",  address: "兵庫県加古川市尾上町池田850-66", phone_number: "079-421-6701", distance: "240", booths: "80", admin_range_id: 32 },
  { city: "神戸市", name: "アコーディア・ガーデン西神", features: "２０１０年１月２２日に新規オープン。２１０ヤード・オープン\nルーフ・全自動ティーアップ機設置の１００打席、充実の打席環境を備えた開放的な練習場です。\nコースレッスンやレベル別カリキュラム、少人数制を導入している「アコーディア・ゴルフアカデミー（ＡＧＡ）」、ゴルフ量販店と同規模の品揃えをほこるプロショップは、一般ゴルファーのみならず、初心者の方にも満足かつ安心してご利用いただけます", link: "https://www.accordiagolf.com/practice/seishin/",  address: "兵庫県神戸市西区井吹台東町7-26", phone_number: "078-990-5665", distance: "210", booths: "100", admin_range_id: 33 },
  { city: "豊岡市", name: "日高ゴルフ練習場", features: "", link: "",  address: "兵庫県豊岡市日高町浅倉５２５", phone_number: "0796-42-1864", distance: "250", booths: "12", admin_range_id: 34 },
  { city: "尼崎市", name: "南武庫之荘ゴルフセンター", features: "", link: "http://golfcenter.sakura.ne.jp/",  address: "兵庫県尼崎市上ノ島町1-14-5", phone_number: "06-6427-7662", distance: "70", booths: "26", admin_range_id: 35 },
  { city: "三田市", name: "アーバンゴルフプラザ", features: "ゆとりの110打席、各打席はゆとりと安全ワイド設計、試合前、試合中多数のツアープロが練習に来られます", link: "http://www.urban-golf.co.jp/",  address: "兵庫県三田市貴志2024", phone_number: "079-565-6233", distance: "250", booths: "110", admin_range_id: 36 },
  { city: "宝塚市", name: "リバレゴルフヴィレッジ", features: "電車でのアクセスも良く、駐車場も広く周りにはスーパー等も充実しています。昔ながらの味、洋食レストランも併設、ゴルフスクールも充実しています。とっても通いやすい練習場です", link: "https://rizvallee.co.jp/",  address: "兵庫県宝塚市中筋8-12-25", phone_number: "0797-89-5700", distance: "60", booths: "38", admin_range_id: 37 },
  # { city: "", name: "", features: "", link: "",  address: "", phone_number: "", distance: "250", booths: "", admin_range_id:  },
])

Equipment.create!([
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: false, restaurant: false, lesson: true, admin_range_id: 1},
  { uchihoudai: false, approach: true, lefty: true, patting: true, bunker: false, shop: false, restaurant: false, lesson: true, admin_range_id: 2 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: false, restaurant: false, lesson: true, admin_range_id: 3 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 4 },
  { uchihoudai: false, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 5 },
  { uchihoudai: false, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 6 },
  { uchihoudai: false, approach: false, lefty: true, patting: false, bunker: false, shop: false, restaurant: false, lesson: false, admin_range_id: 7 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 8 },
  { uchihoudai: false, approach: false, lefty: true, patting: true, bunker: true, shop: false, restaurant: false, lesson: false, admin_range_id: 9 },
  { uchihoudai: false, approach: true, lefty: true, patting: true, bunker: true, shop: false, restaurant: false, lesson: true, admin_range_id: 10 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: false, restaurant: false, lesson: true, admin_range_id: 11 },
  { uchihoudai: false, approach: false, lefty: true, patting: true, bunker: true, shop: false, restaurant: false, lesson: true, admin_range_id: 12 },
  { uchihoudai: false, approach: false, lefty: true, patting: false, bunker: false, shop: true, restaurant: false, lesson: true, admin_range_id: 13 },
  { uchihoudai: false, approach: false, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 14 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: false, shop: true, restaurant: true, lesson: true, admin_range_id: 15 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: false, shop: true, restaurant: false, lesson: true, admin_range_id: 16 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: false, shop: true, restaurant: true, lesson: true, admin_range_id: 17 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 18 },
  { uchihoudai: true, approach: false, lefty: true, patting: false, bunker: false, shop: true, restaurant: false, lesson: false, admin_range_id: 19 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 20 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: false, lesson: true, admin_range_id: 21 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: false, shop: true, restaurant: false, lesson: true, admin_range_id: 22 },
  { uchihoudai: false, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 23 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 24 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: false, shop: true, restaurant: false, lesson: true, admin_range_id: 25 },
  { uchihoudai: true, approach: false, lefty: true, patting: false, bunker: false, shop: false, restaurant: false, lesson: false, admin_range_id: 26 },
  { uchihoudai: false, approach: false, lefty: true, patting: false, bunker: false, shop: false, restaurant: false, lesson: false, admin_range_id: 27 },
  { uchihoudai: false, approach: true, lefty: false, patting: false, bunker: true, shop: false, restaurant: false, lesson: false, admin_range_id: 28 },
  { uchihoudai: true, approach: true, lefty: true, patting: false, bunker: true, shop: false, restaurant: false, lesson: false, admin_range_id: 29 },
  { uchihoudai: false, approach: false, lefty: true, patting: false, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 30 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 31 },
  { uchihoudai: true, approach: false, lefty: true, patting: true, bunker: true, shop: true, restaurant: true, lesson: true, admin_range_id: 32 },
  { uchihoudai: true, approach: true, lefty: true, patting: true, bunker: true, shop: true, restaurant: false, lesson: true, admin_range_id: 33 },
  { uchihoudai: false, approach: true, lefty: true, patting: true, bunker: false, shop: true, restaurant: false, lesson: false, admin_range_id: 34 },
  { uchihoudai: true, approach: false, lefty: true, patting: false, bunker: false, shop: false, restaurant: false, lesson: true, admin_range_id: 35 },
  { uchihoudai: true, approach: false, lefty: true, patting: false, bunker: true, shop: true, restaurant: false, lesson: true, admin_range_id: 36 },
  { uchihoudai: true, approach: false, lefty: true, patting: false, bunker: false, shop: true, restaurant: true, lesson: true, admin_range_id: 37 },
])

Lesson.create!([
  { title: "初心者向けレッスン", coach: "佐藤和雄", content: "初心者におすすめのレッスンです。", admin_range_id: 1, range_outline_id: 1},
  { title: "中級者向けレッスン", coach: "田中花子", content: "100切りを目指したい方におすすめのレッスンです。", admin_range_id: 1, range_outline_id: 1 }
])

Calendar.create!([
  { lesson_time: "60", start_time1: "09:00",  start_time3: "11:00", start_time4: "13:00", start_time5: "15:00", start_time6: "17:00", start_time7: "19:00", tue: "火", wed: "水", lesson_id: 1},
  { lesson_time: "90", start_time1: "10:00", start_time2: "15:00", start_time3: "17:00", start_time4: "19:00", sun: "日", mon: "月", lesson_id: 2}
])

Reservation.create!([
  { lesson_id: 1, user_id: 1, date: "22/01/23(日)10:00"},
  { lesson_id: 1, user_id: 1, date: "22/07/30(土)09:00" }
])