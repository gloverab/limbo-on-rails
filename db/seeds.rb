User.create!([
  {email: "god@godmail.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 4, current_sign_in_at: "2017-04-21 21:19:30", last_sign_in_at: "2017-04-21 16:23:42", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "God", last_name: "The Father", username: "God", avatar_id: nil, provider: nil, uid: nil, age: 1000000, image_path: "https://pi.tedcdn.com/r/pf.tedcdn.com/images/playlists/are_you_there_god.jpg?quality=89&w=500"},
  {email: "nextto@godmail.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2017-04-21 16:13:17", last_sign_in_at: "2017-04-21 15:47:33", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Mr.", last_name: "Clean", username: "cleanliness", avatar_id: nil, provider: nil, uid: nil, age: 59, image_path: "https://pbs.twimg.com/profile_images/462229452479401984/hu7HTUH7.jpeg"},
  {email: "alexander.glover10@houghton.edu", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2017-04-21 17:23:37", last_sign_in_at: "2017-04-21 17:00:24", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Alex", last_name: "Glover", username: "abg1788", avatar_id: nil, provider: "facebook", uid: "10154538687785794", age: 29, image_path: "http://graph.facebook.com/10154538687785794/picture?type=large"},
  {email: "cartman@gmail.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-21 16:19:29", last_sign_in_at: "2017-04-21 16:19:29", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Eric", last_name: "Cartman", username: "ecartman1", avatar_id: nil, provider: nil, uid: nil, age: 10, image_path: "https://scontent.fbed1-2.fna.fbcdn.net/v/t1.0-9/14718814_1113415578694453_3152207264253269798_n.jpg?oh=1ac373d60cd279b0b27a8ee10c93641a&oe=59790966"},
  {email: "thomyorke@gmail.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-21 16:36:00", last_sign_in_at: "2017-04-21 16:36:00", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Thom", last_name: "Yorke", username: "thomyorke", avatar_id: nil, provider: nil, uid: nil, age: 48, image_path: "http://static.stereogum.com/uploads/2015/01/Thom-Yorke.jpg"},
  {email: "exgf@yahoo.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-21 16:55:07", last_sign_in_at: "2017-04-21 16:55:07", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Crazy", last_name: "Ex", username: "exgf", avatar_id: nil, provider: nil, uid: nil, age: 21, image_path: "http://terrificparenting.com/wp-content/uploads/2010/12/angry_crying_girl1-300x268.jpg"},
  {email: "jdepp@gmail.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-21 20:58:56", last_sign_in_at: "2017-04-21 20:58:56", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Johnny", last_name: "Depp", username: "jdepp", avatar_id: nil, provider: nil, uid: nil, age: 53, image_path: "https://pbs.twimg.com/profile_images/461110955082924033/syKzaNQA.png"},
  {email: "einstein@gmail.com", password: "testtest123", password_confirmation: "testtest123", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2017-04-21 21:26:17", last_sign_in_at: "2017-04-21 21:26:17", current_sign_in_ip: "::1", last_sign_in_ip: "::1", first_name: "Albert", last_name: "Einstein", username: "einstein", avatar_id: nil, provider: nil, uid: nil, age: 100, image_path: "http://eatourbrains.com/EoB/wp-content/uploads/2007/01/albert_einstein_by_yousuf_karsh.jpg"}
])


Discussion.create!([
  {user_id: nil, title: nil, content: nil, reason: "I'd like to hear what you all think.", author_id: 1},
  {user_id: nil, title: nil, content: nil, reason: "I'd like to hear peoples' reasons for why they like me so much!", author_id: 7},
  {user_id: nil, title: nil, content: nil, reason: "Here's the deal. You can vote \"I love Creep\" or \"I hate Creep\" but I'm looking for cold hard discussion and reasons as to why in bloody hell people love this song so much!!", author_id: 5},
  {user_id: nil, title: nil, content: nil, reason: "I'd like to get some input. If this is something you think you'll use, that's awesome! Why do you think you can see yourself using it? If not, what's wrong with it?", author_id: 3},
  {user_id: nil, title: nil, content: nil, reason: "Hey all -- This felt bigger than a simple either/or question. I'm having trouble figuring out why everyone says me-ness is next to Godliness. I'm just a guy who appreciates solid hygiene. Sometimes it's hard for me to live up to my creator, but I'm next in line so I guess that's kinda cool (?). Anyways, let me know what you think is so special/great about me and maybe we can take it from there!", author_id: 2}
])

Decision.create!([
  {title: "Should I create Earth?", content: "Hi, it's the beginning. And it's just me here. I know there's no one else around to answer my questions but sometimes writing things out helps me to think through them (lol!).\r\n\r\nAnyways, I know for certain that I'd like to create the heavens, but should I create the Earth? Most of my Godly instinct says no, but something about spawning a sea of thankless idiots seems appealing to me. So what if they completely disacknowledge my existence in a couple millennia? I'm God! The motherf$#kn' creator of the heavens and Earth!! Oh, wait a second, I guess not Earth yet. Still gotta add that to the resume. Well, here goes nothing.", user_id: nil, deadline: "-3979-04-15 15:45:38", hours: -52560000, minutes: nil, option_1: "Yes, create Earth.", option_2: "No, don't create Earth.", author_id: 1, discussion_id: nil},
  {title: "Why am I so great?", content: "Mr. Clean here, just trying to figure out why me-ness is next to Godliness.", user_id: nil, deadline: "2017-04-21 17:58:46", hours: 2, minutes: nil, option_1: "You're not special at all.", option_2: "A variety of things make you special!", author_id: 2, discussion_id: 1},
  {title: "Was this a massive waste of time?", content: "I spent a week of my life designing and creating this site for a project. Now I'm feeling insecure and just wondering if it was worth it.", user_id: nil, deadline: "2017-04-22 16:05:44", hours: 20, minutes: nil, option_1: "No, it's totally worth it!", option_2: "Yes, this site blows.", author_id: 3, discussion_id: 2},
  {title: "How should I kill Scott Tenorman's parents??", content: "I'm out here bustin' my ass over some chili. Wondering if I should cook Scott's parents into the chili and feed them to Scott or just get the local farmer to shoot them by \"mistake.\"", user_id: nil, deadline: "2017-04-21 18:22:09", hours: 2, minutes: nil, option_1: "Cook them into chili", option_2: "Have the farmer shoot them", author_id: 4, discussion_id: nil},
  {title: "Hey you guys! What totally awesome snack do you like better??", content: "I love cheesy poofs AND chocolate cake. Can't decide which one I should have my mom pick me up from the store.", user_id: nil, deadline: "2017-04-21 18:28:54", hours: 2, minutes: nil, option_1: "Cheesy Poofs!!", option_2: "Chocolate cake", author_id: 4, discussion_id: nil},
  {title: "Why is \"Creep\" such a well-liked song??", content: "I hate it. People love it. What's up with that??", user_id: nil, deadline: "2017-06-02 08:38:55", hours: 1000, minutes: nil, option_1: "It's just a great song!", option_2: "I never liked it much myself.", author_id: 5, discussion_id: 3},
  {title: "Why did he break up with me?????", content: "I swear all I do everyday is tell him I love him and all i want to do is squeeze and hold him and love him forever but 4 some reason that wasn't good enougH?? I came over every night of the week and made myself a copy of his keys. WTF did I do wrong to deserve this???", user_id: nil, deadline: "2017-04-21 20:58:29", hours: 4, minutes: nil, option_1: "Shouldn't have made those copied keys", option_2: "He's a jerk and you're better than him", author_id: 6, discussion_id: nil},
  {title: "What is my next move here?", content: "I need to do a couple more things before handing this site in as a project. Should I focus on creating an 'edit' button? Or should I focus on the discussion index??", user_id: nil, deadline: "2017-04-21 17:33:18", hours: 0, minutes: 2, option_1: "Edit Button", option_2: "Discussion Index", author_id: 3, discussion_id: nil},
  {title: "Should I do another Pirates of the Caribbean movie?", content: "One part of me says it's getting old. The other part of me is my manager and he says I'll get paid.", user_id: nil, deadline: "2017-04-22 09:02:17", hours: 12, minutes: nil, option_1: "Yes - of course", option_2: "No - they're boring", author_id: 7, discussion_id: nil},
  {title: "What's your favorite role of mine and why?", content: "I narrowed it down to two roles. But I really can't pick between the two!", user_id: nil, deadline: "2017-04-22 00:03:21", hours: 3, minutes: nil, option_1: "Willy Wonka", option_2: "Captain Jack Sparrow", author_id: 7, discussion_id: 4},
  {title: "What is the meaning of life?", content: "I already know the meaning of life - I created it. There are two options here but I think the conversation extends beyond them. Perhaps by arguing about it on the internet you can all come to an honest conclusion together.", user_id: nil, deadline: "2017-04-21 23:22:53", hours: 2, minutes: nil, option_1: "There isn't any.", option_2: "Love is the answer", author_id: 1, discussion_id: 5},
  {title: "Do you think I'm correct?", content: "Trick question, I'm always correct.", user_id: nil, deadline: "2017-04-22 17:33:14", hours: 20, minutes: 5, option_1: "Yes.", option_2: "yes.", author_id: 8, discussion_id: nil}
])

Vote.create!([
  {user_id: nil, decision_id: 1, option_id: nil, voter_id: 2, persuasion: 1},
  {user_id: nil, decision_id: 2, option_id: nil, voter_id: 3, persuasion: 1},
  {user_id: nil, decision_id: 1, option_id: nil, voter_id: 3, persuasion: 2},
  {user_id: nil, decision_id: 3, option_id: nil, voter_id: 1, persuasion: 1},
  {user_id: nil, decision_id: 3, option_id: nil, voter_id: 2, persuasion: 1},
  {user_id: nil, decision_id: 3, option_id: nil, voter_id: 4, persuasion: 2},
  {user_id: nil, decision_id: 2, option_id: nil, voter_id: 4, persuasion: 1},
  {user_id: nil, decision_id: 1, option_id: nil, voter_id: 4, persuasion: 1},
  {user_id: nil, decision_id: 2, option_id: nil, voter_id: 1, persuasion: 1},
  {user_id: nil, decision_id: 5, option_id: nil, voter_id: 1, persuasion: 1},
  {user_id: nil, decision_id: 6, option_id: nil, voter_id: 1, persuasion: 1},
  {user_id: nil, decision_id: 5, option_id: nil, voter_id: 5, persuasion: 1},
  {user_id: nil, decision_id: 4, option_id: nil, voter_id: 5, persuasion: 1},
  {user_id: nil, decision_id: 3, option_id: nil, voter_id: 5, persuasion: 1},
  {user_id: nil, decision_id: 2, option_id: nil, voter_id: 5, persuasion: 1},
  {user_id: nil, decision_id: 7, option_id: nil, voter_id: 3, persuasion: 2},
  {user_id: nil, decision_id: 6, option_id: nil, voter_id: 3, persuasion: 2},
  {user_id: nil, decision_id: 5, option_id: nil, voter_id: 3, persuasion: 1},
  {user_id: nil, decision_id: 3, option_id: nil, voter_id: 7, persuasion: 1},
  {user_id: nil, decision_id: 1, option_id: nil, voter_id: 7, persuasion: 1},
  {user_id: nil, decision_id: 9, option_id: nil, voter_id: 1, persuasion: 2},
  {user_id: nil, decision_id: 10, option_id: nil, voter_id: 1, persuasion: 2}
])

Reply.create!([
  {content: "My dear son. Why would you only put two choices for this? You have much better roles, yet continue to rehash the two of these. Everyone is sick of it. Believe me. Everyone.", discussion_id: 4, author_id: 1},
  {content: "I rarely (if ever) stay clean. That's why I keep choosing roles where my teeth are supposed to be crooked.", discussion_id: 1, author_id: 7},
  {content: "I dunno I always kinda liked it a lot!", discussion_id: 3, author_id: 3},
  {content: "Please, please! Show a bit of humility. I didn't decide to create the Earth so that folks like you could praise themselves on internet forums!", discussion_id: 1, author_id: 1},
  {content: "You're so fucking special.", discussion_id: 1, author_id: 5},
  {content: "Creep is a very well crafted pop song, my son. The haunting melody taps into some very ancient emotional response receptors that I placed in humans years and years ago. You are a gifted talent and should stop being so hard on your creations (believe me, I could be perceived as guilty of the same thing...).", discussion_id: 3, author_id: 1},
  {content: "I agree with Alex. Cleanliness is totally lame.", discussion_id: 1, author_id: 4},
  {content: "Cleaning is NOT a waste of time, and neither was this site. Love it! ;)", discussion_id: 2, author_id: 2},
  {content: "@God WTF bro?!!", discussion_id: 2, author_id: 2},
  {content: "Hi! It's me, God. Just letting you know there is no such thing as a waste of time, unless it's time spent cleaning your room.", discussion_id: 2, author_id: 1},
  {content: "Cleanliness sucks! That old outdated phrase is a crock. Don't get me wrong, you're a great guy, but next to godliness?? Come on, that's a bunch of crap.", discussion_id: 1, author_id: 3}
])
