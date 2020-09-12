/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package models;

import java.util.Date;

/**
 *
 * @author BEN ALPHA
 */
public class Comment {
    private String newfeed;
    private String content;
    private String reply;
    private String replyTo;
    private String active;
    
    public String getNewfeed() {
        return newfeed;
    }

    public void setNewfeed(String newfeed) {
        this.newfeed = newfeed;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getReply() {
        return reply;
    }

    public void setReply(String reply) {
        this.reply = reply;
    }

    public String getReplyTo() {
        return replyTo;
    }

    public void setReplyTo(String replyTo) {
        this.replyTo = replyTo;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }
}
