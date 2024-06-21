from datetime import datetime, timedelta
import string
import random

character_set = string.ascii_lowercase + string.digits
guid_length = 16

# change project ID below
project_id = 627
user_to_blame = 215
# change penetration ID below
penetration_ids = (
    723202,
)

change_list_draft = list()
change_list_invoiced = list()

nowtime = datetime.now()
futuretime = nowtime + timedelta(seconds=600)

for penetration in penetration_ids:
    change_list_draft.append(
        f"('{''.join(random.choices(character_set, k=guid_length))}','{str(nowtime)[:19]}',{user_to_blame},{int(penetration)},2)"
    )
    change_list_invoiced.append(
        f"('{''.join(random.choices(character_set, k=guid_length))}','{str(futuretime)[:19]}',{user_to_blame},{int(penetration)},3)"
    )
#1 = draft 2 = completed 3 =approved 5 = invoiced

print("draft:")
print(','.join(change_list_draft))
print()
print()
print("invoiced:")
print(','.join(change_list_invoiced))
print()
print()

('pzkw74vuub4rppux','2024-06-21 17:17:39',215,723202,2)
('zyyalnwelb002oft','2024-06-21 17:27:39',215,723202,3)