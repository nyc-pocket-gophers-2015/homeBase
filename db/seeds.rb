Family.create!(surname: "Lannister",
							email: "tywin@casterlyrock.gov",
							password: "1234567")
Family.create!(surname: "Stark",
							email: "rob@thenorth.gov",
							password: "1234567")
Family.create!(surname: "Targaryen",
							email: "dayanares@dothraki.gov",
							password: "1234567")
Family.create!(surname: "Kardashian",
							email: "keeping@upwith.com",
							password: "1234567")

Member.create!(name: "Tywin",
					
							family_id: 1,
							task_points: 3,
							color: "red",
							img_url: "/assets/boy4.jpg")
Member.create!(name: "Tyrion",
							
							family_id: 1,
							task_points: 78,
							color: "red",
							img_url: "/assets/girl2.jpg")
Member.create!(name: "Cersei",
						
							family_id: 1,
							task_points: 0,
							color: "red",
							img_url: "/assets/girl1.jpg")
Member.create!(name: "Bob",
							
							family_id: 1,
							task_points: 0,
							color: "red",
							img_url: "/assets/boy5.jpg")
Member.create!(name: "Eddard",
						
							family_id: 2,
							task_points: 0,
							color: "red",
							img_url: "/assets/boy1.jpg")
Member.create!(name: "Rob",
					
							family_id: 2,
							task_points: 14,
							color: "red",
							img_url: "/assets/boy2.jpg")
Member.create!(name: "Jon",
						
							family_id: 2,
							task_points: 0,
							color: "red",
							img_url: "/assets/girl2.jpg")
Member.create!(name: "Arya",
							
							family_id: 2,
							task_points: 0,
							color: "red",
							img_url: "/assets/girl1.jpg")
Member.create!(name: "Dayanares",
						
							family_id: 3,
							task_points: -4,
							color: "red",
							img_url: "/assets/girl4.jpg")
Member.create!(name: "Barry",
						
							family_id: 3,
							task_points: 0,
							color: "red",
							img_url: "/assets/girl1.jpg")
Member.create!(name: "Mendel",
							
							family_id: 3,
							task_points: 10,
							color: "red",
							img_url: "/assets/girl2.jpg")
Member.create!(name: "Schlomo",
						
							family_id: 3,
							task_points: 0,
							color: "red",
							img_url: "/assets/grandpa.jpg")
Member.create!(name: "Kris",
							family_id: 4,
							task_points: 0,
							color: "red",
							img_url: "/assets/baby.jpg")
Member.create!(name: "Kourtney",
						
							family_id: 4,
							task_points: 0,
							color: "red",
							img_url: "/assets/girl3.jpg")
Member.create!(name: "Kylie",
							
							family_id: 4,
							task_points: 45,
							color: "red",
							img_url: "/assets/girl1.jpg")
Member.create!(name: "Kendall",
						
							family_id: 4,
							task_points: 500,
							color: "red",
							img_url: "/assets/girl4.jpg")

task1 = Task.create!(title: "Empty the dishwasher" ,
										point_value: 25,
										family_id: 1,
										assigned_member_id: 1,
										completed_member_id: 1,
										)
task2 = Task.create!(title: "Clean Bedroom",
										point_value: 10,
										family_id: 1,
										assigned_member_id: 2,
										completed_member_id: 1)
task3 = Task.create!(title: "Take out trash" ,
										point_value: 20,
										family_id: 1,
										)
task4 = Task.create!(title: "Sweep Kitchen floor",
										point_value: 35,
										family_id: 2,
										assigned_member_id: 5,
										completed_member_id: 5)

task5 = Task.create!(title: "Vaccuum living room",
										point_value: 30,
										family_id: 2,
										assigned_member_id: 6,
										)

task6 = Task.create!(title: "Walk the dog",
										point_value: 20,
										family_id: 2)

task7 = Task.create!(title: "Feed the fish",
										point_value: 10,
										family_id: 3,
										assigned_member_id: 9)

task8 = Task.create!(title: "Fold laundry",
										point_value: 25,
										family_id: 3,
										assigned_member_id: 10,
										completed_member_id: 10,
										)

task9 = Task.create!(title: "Vaccuum pool", point_value: 50, family_id: 3)


task10 = Task.create!(title: "Clean countertops", point_value: 20, family_id: 4, assigned_member_id: 13)
task11 = Task.create!(title: "Feed the dog", point_value: 10, family_id: 4, assigned_member_id: 14, completed_member_id: 15)
task12 = Task.create!(title: "Fold laundry", point_value: 25, family_id: 4, )

task13 = Task.create!(title: "Empty dishwasher", point_value: 20, family_id: 4, assigned_member_id: 16 )
task14 = Task.create!(title: "Pick up all toys", point_value: 15, family_id: 2, assigned_member_id: 5, completed_member_id: 5)
task15 = Task.create!(title: "Dust", point_value: 25, family_id: 3, )


reward1 = Reward.create!(name: "Spinach", category:"Delicious Food", cost: 10, family_id: 1, member_id: 3)
reward2 = Reward.create!(name: "Corn", category:"Delicious Food", cost: 20,family_id: 1, member_id: 1, status:"closed")
reward3 = Reward.create!(name: "Tootsie Roll", category:"Delicious Food", cost: 5, family_id: 1, member_id: 2)
reward4 = Reward.create!(name: "Kobe Beef", category:"Delicious Food", cost: 1000, family_id: 1, member_id: 2)
reward5 = Reward.create!(name: "Alaskan King Crab", category:"Delicious Food", cost: 400, family_id: 1, member_id: 1)
reward6 = Reward.create!(name: "Ramen Burger", category:"Delicious Food", cost: 100, family_id: 1, member_id: 4, status: "pending")

reward7 = Reward.create!(name: "MacBook", category:"Technology", cost: 10000, family_id: 2, member_id: 5, status:"closed")
reward8 = Reward.create!(name: "PlayStation4", category:"Technology", cost: 5000,family_id: 2, member_id: 6)
reward9 = Reward.create!(name: "XBoxOne", category:"Technology", cost: 5000, family_id: 2, member_id: 7)
reward10 = Reward.create!(name: "Soda", category:"Delicious Food", cost: 20, family_id: 2, member_id: 7)
reward11 = Reward.create!(name: "Shelter", category:"Basic Living", cost: 15, family_id: 2, member_id: 5, status:"pending")
reward12 = Reward.create!(name: "Gruel", category:"Basic Living", cost: 20, family_id: 2, member_id: 8)

reward13 = Reward.create!(name: "Basketball", category:"Technology", cost: 20, family_id: 4, member_id: 15)
reward14 = Reward.create!(name: "Pack of Gum", category:"Basic Living", cost: 100, family_id: 4, member_id: 15)

event1 = Event.create!(title: "Sherman's Birthday", start_time: Date.today+2, end_time: Date.today+6, family_id: 1, member_id: 3)
event2 = Event.create!(title: "Cersei's Birthday", start_time: Date.today+4, end_time: Date.today+7, family_id: 1)
event3 = Event.create!(title: "Tyrion's Birthday", start_time: Date.today+5, end_time: Date.today+8, family_id: 1, member_id: 1)
event4 = Event.create!(title: "Red Wedding", start_time: Date.today+1, end_time: Date.today+3, family_id: 1, member_id: 2)
