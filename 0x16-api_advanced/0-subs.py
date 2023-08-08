#!/usr/bin/python3
""" Functions to query subscribers on a given Reddit subreddit"""
import requests


def numbers_of_subscribers(subreddit):
    """Queries the Reddit API to retrieve the subreddit subscribers"""

    headers = {"User-Agent": "MyRedditBot/1.0"}
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 404:
        return 0
    results = response.json().get("data")
    return results.get("subscribers")
