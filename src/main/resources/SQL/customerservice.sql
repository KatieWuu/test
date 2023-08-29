-- create schema customerservice;
-- use customerservice;

create table chat (
	chat_id int primary key, -- auto_increment
    mem_id int, -- not null
    host_id int,
    chat_time datetime not null,
    chat_type tinyint default 6 not null comment '0:會員 1:商城 2:景點行程 3:活動 4:論壇 5:揪團 6:其他',
    chat_point tinyint not null comment '0:會員 1:客服',
    chat_con varchar(500)
    -- constraint fk_chat_mem_id
    -- foreign key (mem_id) references members (mem_id)
    -- constraint fk_chat_host_id
    -- foreign key (host_id) references hosts (host_id)
    );

-- select * from chat;

insert into chat(chat_id, mem_id, host_id, chat_time, chat_type, chat_point, chat_con) values
(1,1,null,'2023-07-28 14:22:00',6,1,'歡迎來到我們的客服聊天室！請選擇您要詢問的類別，輸入相應的數字編號：0-會員 1-商城 2-景點行程 3-活動 4-論壇 5-揪團 6-其他，您可以直接回復數字，我們將竭誠為您提供所需的幫助與資訊。將立即為您轉接至客服人員，與您進行連線並提供支援。感謝您使用我們的服務！若不幸是在非客服時間內聯繫我們，請您不要擔心，我們將安排客服人員在營業時間內盡快回覆您的訊息。請您耐心等待，我們會儘快與您取得聯繫。'),
(2,1,null,'2023-07-28 14:22:10',6,0,'2'),
(3,1,1,'2023-07-28 14:22:15',2,1,'您好，這裡是客服人員Jane，很高興能夠為您提供幫助！請問有什麼問題或需要我們協助解決的事情嗎？請隨時告訴我們您的需求，我們會全力以赴為您提供最好的服務。'),
(4,1,1,'2023-07-28 14:24:15',2,0,'你好，我是新會員，我想要在你們的旅遊行程平台上建立一個行程。能告訴我在哪建立行程的流程嗎？'),
(5,1,1,'2023-07-28 14:25:20',2,1,'歡迎加入我們的旅遊行程平台！建立行程很簡單，首先，請在會員中心點選「建立旅遊行程」按鈕。然後，填寫行程的基本資訊，如目的地、日期等。接著，您可以在行程內容中添加景點、活動、餐廳等細節。最後，點選「儲存」即可完成行程建立。'),
(6,1,1,'2023-07-28 14:28:10',2,0,'謝謝指引！在建立行程時，可以自訂行程的名稱嗎？'),
(7,1,1,'2023-07-28 14:29:10',2,1,'當然可以！在填寫行程基本資訊時，有一個欄位是「行程名稱」，您可以在那裡輸入您想要的名稱，讓行程更具個人化。'),
(8,1,1,'2023-07-28 14:30:00',2,0,'如果我想和朋友分享我建立的行程，該怎麼辦？'),
(9,1,1,'2023-07-28 14:35:00',2,1,'您可以在行程詳細頁面上，找到分享按鈕，點選後可以選擇分享到社交媒體或通過郵件分享給朋友。這樣他們就可以看到您的行程安排了。'),
(10,1,1,'2023-07-28 14:36:00',2,0,'好的，謝謝!');


create table qa (
	qa_id int primary key, -- auto_increment
    qa_title varchar(50)  not null,
    qa_con varchar(500)  not null,
    qa_state tinyint default 0 not null comment '0:下架 1:上架',
    qa_created_time datetime not null default current_timestamp,
    qa_last_updated_time datetime null default current_timestamp
    );

-- select * from qa;
drop table qa;
insert into qa(qa_id, qa_title, qa_con, qa_state) values
(1,'如何註冊遊&ME帳戶？','創建遊&ME帳號完全免費，您可透過email註冊：1.進入遊&ME首頁，點選右上方『登入/註冊』，選擇下方『註冊』。2.填寫您的電子信箱以及預設密碼，點選『註冊』。3.至您的電子信箱內查收驗證信件，點選信件中的網址顯示『聯絡信箱驗證成功』。4.至遊&ME點選右上方『登入/註冊』，輸入您的帳號密碼登入後即可建立行程及訂購商品。',1),
(2,'如何重置會員帳號的密碼？','1.忘記密碼:如果您因忘記密碼無法登入遊&ME，請於登入畫面點選『忘記密碼』，輸入您註冊遊&ME帳號時所使用的電子郵件地址，您將收到一封含有重置密碼鏈結，進行密碼修改。2.修改密碼:您可以登入會員後，在【帳號設定】中更改密碼。',1),
(3,'如何更改我在遊&ME使用的電子郵件地址呢？','很抱歉，因遊&ME的登入帳號為您的e-mail ，故無法更改e-mail地址。',1),
(4,'為什麼我沒有收到電子郵件提示或確認郵件？','請先至垃圾信件確認，有時候您的電子信箱有可能將遊&ME的訊息誤判為垃圾信，也建議您為了避免發生這種情況，您可以將我們的郵件從垃圾箱移除，並將遊&ME的MAIL添加至您的通訊錄。',1),
(5,'如何搜索行程？','進入遊&ME後，可以直接選擇您想要旅行的地點，我們將列出所有行程供您參考，同時您也可以利用我們的篩選條件來進行搜尋，您可以按城市、主題、時間長度等來縮小您的搜尋範圍，搜尋結果將同步於清單欄位，以便您找到最適合您的行程。',1),
(6,'如何使用我的景點收藏清單？','請利用我們收藏功能，每個景點都有個收藏符號，當點選時將列入您的收藏清單，您隨時可進入收藏清單查看比較。若要取消收藏，請再次點選收藏符號，即可取消收藏。',1),
(7,'申請成為揪團團主有哪些要求或條件？','作為揪團的團主，通常需要具備一些基本要求，例如年齡限制、完整的個人資料填寫，以及同意遵守相關的使用條款和規範。另外，您的揪團計劃也需要符合我們的揪團平台政策。具體的要求可能因平台而異，建議您在申請前仔細閱讀相關條款和說明。',1),
(8,'我想要發起一個揪團活動，該怎麼做？','在我們的揪團功能中，您可以點選「發起揪團」按鈕，填寫揪團表單，包括個人資料、活動名稱、日期、目的地等，然後點選「確認發起」即可成功進入創建揪團審核，審核完畢會再通知揪團團主。',1),
(9,'如何刪除評論或修改顯示名稱？','請您留意，我們的每則評論都是真確與真實的，當您填寫評論後，您的會員預設照片與您的會員名稱將會顯示在您的評論前方。填寫評論並送出時，評論將立即刊登於遊&ME該商品評論中，一旦填寫後就無法刪除與修改，請您諒解與了解。',0),
(10,'為什麼我選的東西不能結帳？','請您留意下方「須重新確認商品」，若選購商品中有售罄、已過出發日、暫不提供的商品，系統將會提醒您重新確認。',0);