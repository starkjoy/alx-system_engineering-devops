#!/usr/bin/python3

import requests


def numbers_of_subscribers(subreddit):
    """
    Queries the Reddit API to retrieve the number of subreddit subscribers

    :param subreddit: The name of the subreddit.
    :return: Number of subscribers for the subreddit, or 0 if the subreddit
    """

    headers = {'User-Agent': 'MyRedditBot/1.0'}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        subscribers = data['data']['subscribers']

        return subscribers
    else:
        if response.status_code == 404:
            return 0
    results = response.json().get("data")
    return results.get("subscribers")
