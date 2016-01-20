#include "newsitem.h"

NewsItem::NewsItem(QObject *parent) : QObject(parent) {
}

void NewsItem::parseJsonObject(QJsonObject jsonObject) {
    m_sourceId = jsonObject.value("source_id").toInt();
    m_date = jsonObject.value("date").toInt();
    m_postId = jsonObject.value("post_id").toInt();
    m_text = jsonObject.value("text").toString();
    m_canEdit = jsonObject.value("can_edit").toBool();
    m_canDelete = jsonObject.value("can_delete").toBool();
    m_commentsCount = jsonObject.value("comments").toObject().value("count").toInt();
    m_canComment = jsonObject.value("comments").toObject().value("can_post").toBool();
    m_likesCount = jsonObject.value("likes").toObject().value("count").toInt();
    m_isLiked = jsonObject.value("likes").toObject().value("user_likes").toBool();
    m_canLike = jsonObject.value("likes").toObject().value("can_like").toBool();
    m_canRepost = jsonObject.value("likes").toObject().value("can_publish").toBool();
    m_repostsCount = jsonObject.value("reposts").toObject().value("count").toInt();
    m_isReposted = jsonObject.value("reposts").toObject().value("user_reposted").toBool();
    m_attachments = jsonObject.value("attachments").toArray();

    m_copyOwnerId = jsonObject.value("copy_owner_id").toInt();
    m_copyPostId = jsonObject.value("copy_post_id").toInt();
    m_copyPostDate = jsonObject.value("copy_post_date").toInt();
    m_copyHistory = jsonObject.value("copy_history").toArray();
}

