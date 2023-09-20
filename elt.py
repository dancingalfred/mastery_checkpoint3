import pandas as pd
import requests

#Task 1
doggie = "C:\\Users\\robba\\OneDrive\\Skrivbord\\Programmering\\Brights\\mastery_checkpoint3\\doggie.csv"
df = pd.read_csv(doggie, sep= ',', header = 0)

def csv_to_json(url):
    df = pd.read_csv(url, sep= ',', header = 0)
    json_object = df.to_json(orient = 'columns')
    return json_object

#Task 2
subject = "microsoft"
def get_wiki_article(subject):
    url = 'https://en.wikipedia.org/w/api.php'
    params = {
        'action': 'query',
        'format': 'json',
        'titles': subject,
        'prop': 'extracts',
        'exintro': True,
        'explaintext': True,
    }

    response = requests.get(url, params=params)
    json_object = response.json()
    return json_object


if __name__ == "__main__":
    #Task 1
    doggie_json = csv_to_json(doggie)
    print(doggie_json)
    print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -")

    #Task 2
    microsoft_wiki = get_wiki_article(subject)
    print(microsoft_wiki)

