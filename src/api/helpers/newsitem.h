#ifndef NEWSITEM_H
#define NEWSITEM_H

#include <QJsonArray>
#include <QJsonObject>
#include <QObject>

class NewsItem : public QObject
{
    Q_OBJECT
public:
    explicit NewsItem(QObject *parent = 0);
    void parseJsonObject(QJsonObject jsonObject);

    int getSourceId() { return m_sourceId; }
    int getPostId() { return m_postId; }

signals:

public slots:

private:
    int m_sourceId;
    int m_date;
    int m_postId;
    QString m_text;
    bool m_canEdit;
    bool m_canDelete;
    int m_commentsCount;
    bool m_canComment;
    int m_likesCount;
    bool m_isLiked;
    bool m_canLike;
    bool m_canRepost;
    int m_repostsCount;
    bool m_isReposted;
    QJsonArray m_attachments;

    int m_copyOwnerId;
    int m_copyPostId;
    int m_copyPostDate;
    QJsonArray m_copyHistory;
};

#endif // NEWSITEM_H
