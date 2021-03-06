package com.teamtreehouse.model;

public class Song {
  protected String mArtist;
  protected String mTitle;
  protected String mVideoUrl;

  public Song(String artist, String title, String videoUrl) {
    mArtist = artist;
    mTitle = title;
    mVideoUrl = videoUrl;
  }

  public String getTitle() {
    return mTitle;
  }

  public String getArtist() {
    return mArtist;
  }

  public String getVideoUrl() {
    return mVideoUrl;
  }

  @Override
  public String toString() {
    return String.format("Song:  %s by %s", mTitle, mArtist);
  }
}