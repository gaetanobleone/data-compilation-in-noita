import csv
import xml.etree.ElementTree as ET
import glob


# the path to locate game data files...
# 'C:\Users\gaeta\AppData\LocalLow\Nolla_Games_Noita\save00\stats\sessions'

# the path to the folder of files that we will be pulling from...
path = r"C:\Users\gaeta\Desktop\noita-data-compilation-project\noita data files\*stats.xml"

# iterate over each file in the folder.
for g in glob.glob(path):
    tree = ET.parse(g)
    root = tree.getroot()[0]

    build_date = tree.getroot().get('BUILD_NAME')[12:23]
    build_time = tree.getroot().get('BUILD_NAME')[24:]

    biomes_visited_with_wands = root.get('biomes_visited_with_wands')
    damage_taken = root.get('damage_taken') 
    dead = root.get('dead') 
    death_count = root.get('death_count') 
    death_pos_x = root.get('death_pos.x')
    death_pos_y = root.get('death_pos.y')
    enemies_killed = root.get('enemies_killed')
    gold = root.get('gold')
    gold_all = root.get('gold_all')
    gold_infinite = root.get('gold_infinite')
    healed = root.get('healed')
    heart_containers = root.get('heart_containers')
    hp = root.get('hp')
    items = root.get('items')
    kicks = root.get('kicks')
    killed_by = root.get('killed_by')
    killed_by_extra = root.get('killed_by_extra') 
    places_visited = root.get('places_visited')
    playtime = root.get('playtime')
    playtime_str = root.get('playtime_str') 
    projectiles_shot = root.get('projectiles_shot')
    streaks = root.get('streaks')
    teleports = root.get('teleports')
    wands_edited = root.get('wands_edited')
    world_seed = root.get('world_seed')

    list = (build_date
        ,build_time
        ,biomes_visited_with_wands
        ,damage_taken
        ,dead
        ,death_count
        ,death_pos_x
        ,death_pos_y
        ,enemies_killed
        ,gold
        ,gold_all
        ,gold_infinite
        ,healed
        ,heart_containers
        ,hp
        ,items
        ,kicks
        ,killed_by
        ,places_visited
        ,playtime
        ,playtime_str
        ,projectiles_shot
        ,streaks
        ,teleports
        ,wands_edited
        ,world_seed
        )

    # a temporary list to store values pulled from the current file that is being iterated over.
    temporary_list = []
    for value in list:
        temporary_list.append(f"{value}")

    new_file = r'C:\Users\gaeta\Desktop\noita-data-compilation-project\squeaky_clean.csv'

    # write the temporary list; which now contains values to a csv file.
    with open (new_file, 'a', newline='', encoding='utf-8') as f:
        writer = csv.writer(f)
        writer.writerow(temporary_list)


